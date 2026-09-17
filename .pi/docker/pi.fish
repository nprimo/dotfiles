# pi.fish — run pi inside a sandboxed Docker container.
# Shadows the `pi` binary for fish sessions once sourced (e.g. from conf.d).
# Bypass with `command pi` for the plain host binary.
#
# What the container gets:
#   $PWD        → /workspace (rw; edits land on host files)
#   secrets     → masked: files overlaid with /dev/null, dirs with empty tmpfs
#   ~/.pi/agent → the real agent dir (settings, packages/extensions, sessions)
#                 with auth.json masked — auth travels via OPENCODE_API_KEY
#   ~/dotfiles  → read-only at the path the agent-dir symlinks point to:
#                 settings.json / AGENTS.md are symlinks into the dotfiles
#                 repo and would dangle inside the container without this
#   ~/.gitconfig → read-only (never .git-credentials)
#
# Bypass masking / run against a different directory: cd elsewhere first —
# only the current working directory is scanned and mounted.
#
# `pi-rebuild` → rebuild the image with the latest pi release
# (cache-busted; extensions update separately via `command pi update --extensions`).

function pi --description 'pi inside a sandboxed Docker container'
    # Same values as in _pi_build; kept local so each function stands alone.
    set -l docker_dir $HOME/dotfiles/.pi/docker
    set -l image pi-sandbox

    if not test -f "$docker_dir/Dockerfile.pi"
        echo "pi: sandbox not found at $docker_dir" >&2
        return 1
    end

    # First run only: build the image with the host uid/gid so files written
    # to /workspace are owned by you, not root.
    if not docker image inspect $image >/dev/null 2>&1
        _pi_build; or return $status
    end

    # --- secret masking ---------------------------------------------------
    set -l mask_args
    set -l uid_gid "uid=(id -u),gid=(id -g)"
    for pat in (cat $docker_dir/secrets.list 2>/dev/null \
                | string match -v '#*' | string match -r '\S+')
        # patterns may name dirs ("secrets/"); find wants a bare name
        set -l name (string trim -r -c / -- $pat)
        set -l matches (find . -maxdepth 5 \( -name .git -prune \) -o -name "$name" -print 2>/dev/null)
        for m in $matches
            # normalize without following symlinks (a masked symlink must not
            # redirect the overlay onto its target)
            set -l abs (path normalize -- "$PWD/$m")
            if test -d "$abs"
                set -a mask_args --tmpfs "$abs:$uid_gid"
            else
                set -a mask_args -v /dev/null:"$abs"
            end
        end
    end

    # --- read-only config mounts -------------------------------------------
    set -l run_args

    if test -f $HOME/.gitconfig
        set -a run_args -v "$HOME/.gitconfig:/home/pi/.gitconfig:ro"
    end

    # --- linked worktrees ---------------------------------------------------
    # In a worktree, .git is a file: "gitdir: /abs/main/.git/worktrees/<name>".
    # That absolute path into the main repo isn't mounted, so git is broken
    # inside the container (and plannotator with it). Bind-mount the *common*
    # git dir (the main repo's .git — the per-worktree dir has no objects/ or
    # refs/) at the same absolute path the .git file references, so the pointer
    # resolves unchanged. NOT at /workspace/.git: that would shadow the pointer
    # and make git treat the worktree as the main repo's working tree.
    # rw, so commits from the worktree keep working; git only touches the
    # worktree itself plus this dir, not the main repo's working tree.
    #
    # Detection = "does git itself resolve": empty output → not a repo (or no
    # git) → nothing to mount. --git-common-dir needs git ≥ 2.5; when it prints
    # a relative path (plain repos) we resolve it, absolute paths (worktrees)
    # pass through untouched — no symlink mangling of the .git-file pointer.
    set -l gitdir (git rev-parse --git-common-dir 2>/dev/null)
    if test -n "$gitdir"
        if not string match -q "/*" -- $gitdir
            set gitdir (path resolve -- $gitdir)
        end
        if test "$gitdir" != "$PWD/.git"  # plain repo: .git is already in $PWD mount
            set -a run_args -v "$gitdir:$gitdir"
        end
    end

    # --- auth ---------------------------------------------------------------
    set -x OPENCODE_API_KEY (pass show opencode-go/key)

    # --- agent hint for herdr -------------------------------------------------
    # Herdr detects agents by the pane's foreground process, which is `docker`
    # here, not pi. This host-side env var tells herdr to apply pi's detection
    # manifest to this wrapper. Must be set outside the container to be visible.
    set -lx HERDR_AGENT pi

    # --- assemble and run ----------------------------------------------------
    # The agent-dir symlinks (settings.json, AGENTS.md → ../../dotfiles/…)
    # resolve INSIDE the container against /home/pi, so the dotfiles repo
    # must be mounted at /home/pi/dotfiles for them to work. Mounting the
    # files individually also works, but it misses npm/, git/, sessions, and
    # models-store.json — i.e. the packages that provide your extensions.
    # --- plannotator (browser UI) --------------------------------------------
    # The container has no browser, so plannotator must always run in remote
    # mode. The container always listens on its fixed port 19432; the HOST side
    # of the forward is picked fresh per session so several pi containers can
    # run at once without colliding. Publish it on the host loopback only —
    # drop the "127.0.0.1:" prefix to expose it to the LAN/other devices.
    # There is a tiny race between the free-port check and docker's bind, but
    # it only matters if two sessions start in the same millisecond.
    set -l plannotator_port (python3 -c 'import socket; s=socket.socket(); s.bind(("127.0.0.1",0)); print(s.getsockname()[1]); s.close()' 2>/dev/null)
    if not test -n "$plannotator_port"
        # No python3 on the host: fall back to the fixed port (old behavior,
        # only one plannotator session at a time).
        set -l plannotator_port 19432
        echo "pi: python3 not found, using fixed plannotator port $plannotator_port" >&2
    end
    echo "pi: plannotator UI (when a review is open) → http://localhost:$plannotator_port" >&2
    set -a run_args \
        -e PLANNOTATOR_REMOTE=1 \
        -p 127.0.0.1:$plannotator_port:19432 \
        -v "$PWD:/workspace" \
        -v "$HOME/.agents":/home/pi/.agents \
        -v "$HOME/.pi/agent":/home/pi/.pi/agent \
        -v "$HOME/dotfiles":/home/pi/dotfiles:ro \
        -e OPENCODE_API_KEY \
        -e EDITOR="vim" \
        -e PI_WEB_TOOLS_EXA_ENDPOINT \
        -e TERM -e COLORTERM \
        --add-host host.docker.internal:host-gateway \
        -w /workspace

    docker run --rm -it $run_args $mask_args $image $argv
end

function _pi_build --description 'Build/refresh the pi-sandbox image with the latest pi release'
    set -l docker_dir $HOME/dotfiles/.pi/docker
    set -l image pi-sandbox

    if not test -f "$docker_dir/Dockerfile.pi"
        echo "pi: sandbox not found at $docker_dir" >&2
        return 1
    end

    # CACHEBUST changes per build → the npm layer re-resolves the latest pi;
    # the apt layers above stay cached.
    echo "pi: building $image…" >&2
    docker build -t $image \
        --build-arg CACHEBUST=(date +%s) \
        -f $docker_dir/Dockerfile.pi $docker_dir; or return $status

    # Print the baked-in version so an update is visibly an update.
    set -l ver (docker run --rm $image pi --version 2>/dev/null)
    if test -n "$ver"
        echo "pi: image ready — pi $ver" >&2
    end
end

function pi-rebuild --description 'Rebuild the pi-sandbox image with the latest pi'
    _pi_build
end
