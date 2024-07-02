#compdef jj

autoload -U is-at-least

_jj() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_jj_commands" \
"*::: :->jj" \
&& ret=0
    case $state in
    (jj)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-command-$line[1]:"
        case $line[1] in
            (abandon)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-s[Do not print every abandoned commit on a separate line]' \
'--summary[Do not print every abandoned commit on a separate line]' \
'*-r[Ignored (but lets you pass \`-r\` for consistency with other commands)]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::revisions -- The revision(s) to abandon:' \
&& ret=0
;;
(backout)
_arguments "${_arguments_options[@]}" \
'-r+[The revision to apply the reverse of]:REVISION: ' \
'--revision=[The revision to apply the reverse of]:REVISION: ' \
'*-d+[The revision to apply the reverse changes on top of]:DESTINATION: ' \
'*--destination=[The revision to apply the reverse changes on top of]:DESTINATION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(branch)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__branch_commands" \
"*::: :->branch" \
&& ret=0

    case $state in
    (branch)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-branch-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" \
'-r+[The branch'\''s target revision]:REVISION: ' \
'--revision=[The branch'\''s target revision]:REVISION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::names -- The branches to create:' \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" \
'*--glob=[Deprecated. Please prefix the pattern with \`glob\:\` instead]:GLOB: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::names -- The branches to delete:' \
&& ret=0
;;
(forget)
_arguments "${_arguments_options[@]}" \
'*--glob=[Deprecated. Please prefix the pattern with \`glob\:\` instead]:GLOB: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::names -- The branches to forget:' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
'*-r+[Show branches whose local targets are in the given revisions]:REVISIONS: ' \
'*--revisions=[Show branches whose local targets are in the given revisions]:REVISIONS: ' \
'-T+[Render each branch using the given template]:TEMPLATE: ' \
'--template=[Render each branch using the given template]:TEMPLATE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-a[Show all tracking and non-tracking remote branches including the ones whose targets are synchronized with the local branches]' \
'--all-remotes[Show all tracking and non-tracking remote branches including the ones whose targets are synchronized with the local branches]' \
'(-a --all-remotes)-t[Show remote tracked branches only. Omits local Git-tracking branches by default]' \
'(-a --all-remotes)--tracked[Show remote tracked branches only. Omits local Git-tracking branches by default]' \
'(-a --all-remotes)-c[Show conflicted branches only]' \
'(-a --all-remotes)--conflicted[Show conflicted branches only]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::names -- Show branches whose local name matches:' \
&& ret=0
;;
(rename)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':old -- The old name of the branch:' \
':new -- The new name of the branch:' \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
'-r+[The branch'\''s target revision]:REVISION: ' \
'--revision=[The branch'\''s target revision]:REVISION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-B[Allow moving the branch backwards or sideways]' \
'--allow-backwards[Allow moving the branch backwards or sideways]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::names -- The branches to update:' \
&& ret=0
;;
(track)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::names -- Remote branches to track:' \
&& ret=0
;;
(untrack)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::names -- Remote branches to untrack:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__branch__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-branch-help-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(forget)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(rename)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(track)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(untrack)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(cat)
_arguments "${_arguments_options[@]}" \
'-r+[The revision to get the file contents from]:REVISION: ' \
'--revision=[The revision to get the file contents from]:REVISION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Paths to print:_files' \
&& ret=0
;;
(checkout)
_arguments "${_arguments_options[@]}" \
'*-m+[The change description to use]:MESSAGE: ' \
'*--message=[The change description to use]:MESSAGE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-r[Ignored (but lets you pass \`-r\` for consistency with other commands)]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':revision -- The revision to update to:' \
&& ret=0
;;
(chmod)
_arguments "${_arguments_options[@]}" \
'-r+[The revision to update]:REVISION: ' \
'--revision=[The revision to update]:REVISION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':mode:((n\:"Make a path non-executable (alias\: normal)"
x\:"Make a path executable (alias\: executable)"))' \
'*::paths -- Paths to change the executable bit for:_files' \
&& ret=0
;;
(commit)
_arguments "${_arguments_options[@]}" \
'--tool=[Specify diff editor to be used (implies --interactive)]:NAME: ' \
'*-m+[The change description to use (don'\''t open editor)]:MESSAGE: ' \
'*--message=[The change description to use (don'\''t open editor)]:MESSAGE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-i[Interactively choose which changes to include in the first commit]' \
'--interactive[Interactively choose which changes to include in the first commit]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Put these paths in the first commit:_files' \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__config_commands" \
"*::: :->config" \
&& ret=0

    case $state in
    (config)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-config-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
'-T+[Render each variable using the given template]:TEMPLATE: ' \
'--template=[Render each variable using the given template]:TEMPLATE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'(--user --repo)--include-defaults[Whether to explicitly include built-in default values in the list]' \
'--include-overridden[Allow printing overridden values]' \
'--user[Target the user-level config]' \
'--repo[Target the repo-level config]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::name -- An optional name of a specific config option to look up:' \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':name:' \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--user[Target the user-level config]' \
'--repo[Target the repo-level config]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':name:' \
':value:' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--user[Target the user-level config]' \
'--repo[Target the repo-level config]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(path)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--user[Target the user-level config]' \
'--repo[Target the repo-level config]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__config__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-config-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(path)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(debug)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__debug_commands" \
"*::: :->debug" \
&& ret=0

    case $state in
    (debug)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-debug-command-$line[1]:"
        case $line[1] in
            (fileset)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':path:_files' \
&& ret=0
;;
(revset)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':revision:' \
&& ret=0
;;
(workingcopy)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(template)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':template:' \
&& ret=0
;;
(index)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(reindex)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(operation)
_arguments "${_arguments_options[@]}" \
'--display=[]:DISPLAY:((operation\:"Show only the operation details"
id\:"Show the operation id only"
view\:"Show only the view details"
all\:"Show both the view and the operation"))' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::operation:' \
&& ret=0
;;
(tree)
_arguments "${_arguments_options[@]}" \
'-r+[]:REVISION: ' \
'--revision=[]:REVISION: ' \
'(-r --revision)--id=[]:ID: ' \
'--dir=[]:DIR: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths:' \
&& ret=0
;;
(watchman)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__debug__watchman_commands" \
"*::: :->watchman" \
&& ret=0

    case $state in
    (watchman)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-debug-watchman-command-$line[1]:"
        case $line[1] in
            (status)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(query-clock)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(query-changed-files)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(reset-clock)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__debug__watchman__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-debug-watchman-help-command-$line[1]:"
        case $line[1] in
            (status)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(query-clock)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(query-changed-files)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(reset-clock)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__debug__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-debug-help-command-$line[1]:"
        case $line[1] in
            (fileset)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(revset)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(workingcopy)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(template)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(index)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(reindex)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(operation)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(tree)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(watchman)
_arguments "${_arguments_options[@]}" \
":: :_jj__debug__help__watchman_commands" \
"*::: :->watchman" \
&& ret=0

    case $state in
    (watchman)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-debug-help-watchman-command-$line[1]:"
        case $line[1] in
            (status)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(query-clock)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(query-changed-files)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(reset-clock)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(describe)
_arguments "${_arguments_options[@]}" \
'*-m+[The change description to use (don'\''t open editor)]:MESSAGE: ' \
'*--message=[The change description to use (don'\''t open editor)]:MESSAGE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-r[Ignored (but lets you pass \`-r\` for consistency with other commands)]' \
'--stdin[Read the change description from stdin]' \
'--no-edit[Don'\''t open an editor]' \
'--reset-author[Reset the author to the configured user]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::revision -- The revision whose description to edit:' \
&& ret=0
;;
(diff)
_arguments "${_arguments_options[@]}" \
'-r+[Show changes in this revision, compared to its parent(s)]:REVISION: ' \
'--revision=[Show changes in this revision, compared to its parent(s)]:REVISION: ' \
'(-r --revision)--from=[Show changes from this revision]:FROM: ' \
'(-r --revision)--to=[Show changes to this revision]:TO: ' \
'--tool=[Generate diff by external command]:TOOL: ' \
'--context=[Number of lines of context to show]:CONTEXT: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-s[For each path, show only whether it was modified, added, or deleted]' \
'--summary[For each path, show only whether it was modified, added, or deleted]' \
'--stat[Show a histogram of the changes]' \
'--types[For each path, show only its type before and after]' \
'--git[Show a Git-format diff]' \
'--color-words[Show a word-level diff with changes indicated only by color]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Restrict the diff to these paths:_files' \
&& ret=0
;;
(diffedit)
_arguments "${_arguments_options[@]}" \
'-r+[The revision to touch up. Defaults to @ if neither --to nor --from are specified]:REVISION: ' \
'--revision=[The revision to touch up. Defaults to @ if neither --to nor --from are specified]:REVISION: ' \
'(-r --revision)--from=[Show changes from this revision. Defaults to @ if --to is specified]:FROM: ' \
'(-r --revision)--to=[Edit changes in this revision. Defaults to @ if --from is specified]:TO: ' \
'--tool=[Specify diff editor to be used]:NAME: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(duplicate)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'*-r[Ignored (but lets you pass \`-r\` for consistency with other commands)]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::revisions -- The revision(s) to duplicate:' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-r[Ignored (but lets you pass \`-r\` for consistency with other commands)]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':revision -- The commit to edit:' \
&& ret=0
;;
(files)
_arguments "${_arguments_options[@]}" \
'-r+[The revision to list files in]:REVISION: ' \
'--revision=[The revision to list files in]:REVISION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Only list files matching these prefixes (instead of all files):_files' \
&& ret=0
;;
(fix)
_arguments "${_arguments_options[@]}" \
'*-s+[Fix files in the specified revision(s) and their descendants]:SOURCE: ' \
'*--source=[Fix files in the specified revision(s) and their descendants]:SOURCE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(git)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__git_commands" \
"*::: :->git" \
&& ret=0

    case $state in
    (git)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-git-command-$line[1]:"
        case $line[1] in
            (remote)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__git__remote_commands" \
"*::: :->remote" \
&& ret=0

    case $state in
    (remote)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-git-remote-command-$line[1]:"
        case $line[1] in
            (add)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':remote -- The remote'\''s name:' \
':url -- The remote'\''s URL:' \
&& ret=0
;;
(remove)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':remote -- The remote'\''s name:' \
&& ret=0
;;
(rename)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':old -- The name of an existing remote:' \
':new -- The desired name for `old`:' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__git__remote__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-git-remote-help-command-$line[1]:"
        case $line[1] in
            (add)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(remove)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(rename)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(init)
_arguments "${_arguments_options[@]}" \
'(--colocate)--git-repo=[Specifies a path to an **existing** git repository to be used as the backing git repo for the newly created \`jj\` repo]:GIT_REPO:_files -/' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'(--git-repo)--colocate[Specifies that the \`jj\` repo should also be a valid \`git\` repo, allowing the use of both \`jj\` and \`git\` commands in the same directory]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::destination -- The destination directory where the `jj` repo will be created. If the directory does not exist, it will be created. If no directory is given, the current directory is used:_files -/' \
&& ret=0
;;
(fetch)
_arguments "${_arguments_options[@]}" \
'*-b+[Fetch only some of the branches]:BRANCH: ' \
'*--branch=[Fetch only some of the branches]:BRANCH: ' \
'*--remote=[The remote to fetch from (only named remotes are supported, can be repeated)]:remote: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'(--remote)--all-remotes[Fetch from all remotes]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--colocate[Whether or not to colocate the Jujutsu repo with the git repo]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':source -- URL or path of the Git repo to clone:_files -/' \
'::destination -- The directory to write the Jujutsu repo to:_files -/' \
&& ret=0
;;
(push)
_arguments "${_arguments_options[@]}" \
'--remote=[The remote to push to (only named remotes are supported)]:REMOTE: ' \
'*-b+[Push only this branch, or branches matching a pattern (can be repeated)]:BRANCH: ' \
'*--branch=[Push only this branch, or branches matching a pattern (can be repeated)]:BRANCH: ' \
'*-r+[Push branches pointing to these commits (can be repeated)]:REVISIONS: ' \
'*--revisions=[Push branches pointing to these commits (can be repeated)]:REVISIONS: ' \
'*-c+[Push this commit by creating a branch based on its change ID (can be repeated)]:CHANGE: ' \
'*--change=[Push this commit by creating a branch based on its change ID (can be repeated)]:CHANGE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--all[Push all branches (including deleted branches)]' \
'--tracked[Push all tracked branches (including deleted branches)]' \
'--deleted[Push all deleted branches]' \
'--allow-empty-description[Allow pushing commits with empty descriptions]' \
'--dry-run[Only display what will change on the remote]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(import)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(submodule)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__git__submodule_commands" \
"*::: :->submodule" \
&& ret=0

    case $state in
    (submodule)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-git-submodule-command-$line[1]:"
        case $line[1] in
            (print-gitmodules)
_arguments "${_arguments_options[@]}" \
'-r+[Read .gitmodules from the given revision]:REVISIONS: ' \
'--revisions=[Read .gitmodules from the given revision]:REVISIONS: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__git__submodule__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-git-submodule-help-command-$line[1]:"
        case $line[1] in
            (print-gitmodules)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__git__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-git-help-command-$line[1]:"
        case $line[1] in
            (remote)
_arguments "${_arguments_options[@]}" \
":: :_jj__git__help__remote_commands" \
"*::: :->remote" \
&& ret=0

    case $state in
    (remote)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-git-help-remote-command-$line[1]:"
        case $line[1] in
            (add)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(remove)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(rename)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(init)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(fetch)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(push)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(import)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(submodule)
_arguments "${_arguments_options[@]}" \
":: :_jj__git__help__submodule_commands" \
"*::: :->submodule" \
&& ret=0

    case $state in
    (submodule)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-git-help-submodule-command-$line[1]:"
        case $line[1] in
            (print-gitmodules)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(init)
_arguments "${_arguments_options[@]}" \
'--git-repo=[DEPRECATED\: Use \`jj git init\` Path to a git repo the jj repo will be backed by]:GIT_REPO:_files -/' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--git[DEPRECATED\: Use \`jj git init\` Use the Git backend, creating a jj repo backed by a Git repo]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::destination -- The destination directory:_files -/' \
&& ret=0
;;
(interdiff)
_arguments "${_arguments_options[@]}" \
'--from=[Show changes from this revision]:FROM: ' \
'--to=[Show changes to this revision]:TO: ' \
'--tool=[Generate diff by external command]:TOOL: ' \
'--context=[Number of lines of context to show]:CONTEXT: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-s[For each path, show only whether it was modified, added, or deleted]' \
'--summary[For each path, show only whether it was modified, added, or deleted]' \
'--stat[Show a histogram of the changes]' \
'--types[For each path, show only its type before and after]' \
'--git[Show a Git-format diff]' \
'--color-words[Show a word-level diff with changes indicated only by color]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Restrict the diff to these paths:_files' \
&& ret=0
;;
(log)
_arguments "${_arguments_options[@]}" \
'*-r+[Which revisions to show. If no paths nor revisions are specified, this defaults to the \`revsets.log\` setting, or \`@ | ancestors(immutable_heads().., 2) | trunk()\` if it is not set]:REVISIONS: ' \
'*--revisions=[Which revisions to show. If no paths nor revisions are specified, this defaults to the \`revsets.log\` setting, or \`@ | ancestors(immutable_heads().., 2) | trunk()\` if it is not set]:REVISIONS: ' \
'-l+[Limit number of revisions to show]:LIMIT: ' \
'--limit=[Limit number of revisions to show]:LIMIT: ' \
'-T+[Render each revision using the given template]:TEMPLATE: ' \
'--template=[Render each revision using the given template]:TEMPLATE: ' \
'--tool=[Generate diff by external command]:TOOL: ' \
'--context=[Number of lines of context to show]:CONTEXT: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--reversed[Show revisions in the opposite order (older revisions first)]' \
'--no-graph[Don'\''t show the graph, show a flat list of revisions]' \
'-p[Show patch]' \
'--patch[Show patch]' \
'-s[For each path, show only whether it was modified, added, or deleted]' \
'--summary[For each path, show only whether it was modified, added, or deleted]' \
'--stat[Show a histogram of the changes]' \
'--types[For each path, show only its type before and after]' \
'--git[Show a Git-format diff]' \
'--color-words[Show a word-level diff with changes indicated only by color]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Show revisions modifying the given paths:_files' \
&& ret=0
;;
(merge)
_arguments "${_arguments_options[@]}" \
'*-m+[The change description to use]:MESSAGE: ' \
'*--message=[The change description to use]:MESSAGE: ' \
'()*-A+[Insert the new change after the given commit(s)]:INSERT_AFTER: ' \
'()*--insert-after=[Insert the new change after the given commit(s)]:INSERT_AFTER: ' \
'()*--after=[Insert the new change after the given commit(s)]:INSERT_AFTER: ' \
'()*-B+[Insert the new change before the given commit(s)]:INSERT_BEFORE: ' \
'()*--insert-before=[Insert the new change before the given commit(s)]:INSERT_BEFORE: ' \
'()*--before=[Insert the new change before the given commit(s)]:INSERT_BEFORE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'*-r[Ignored (but lets you pass \`-r\` for consistency with other commands)]' \
'-L[Deprecated. Please prefix the revset with \`all\:\` instead]' \
'--allow-large-revsets[Deprecated. Please prefix the revset with \`all\:\` instead]' \
'(--edit)--no-edit[Do not edit the newly created change]' \
'--edit[No-op flag to pair with --no-edit]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::revisions -- Parent(s) of the new change:' \
&& ret=0
;;
(move)
_arguments "${_arguments_options[@]}" \
'-f+[Move part of this change into the destination]:FROM: ' \
'--from=[Move part of this change into the destination]:FROM: ' \
'-t+[Move part of the source into this change]:TO: ' \
'--to=[Move part of the source into this change]:TO: ' \
'--tool=[Specify diff editor to be used (implies --interactive)]:NAME: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-i[Interactively choose which parts to move]' \
'--interactive[Interactively choose which parts to move]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Move only changes to these paths (instead of all paths):_files' \
&& ret=0
;;
(new)
_arguments "${_arguments_options[@]}" \
'*-m+[The change description to use]:MESSAGE: ' \
'*--message=[The change description to use]:MESSAGE: ' \
'()*-A+[Insert the new change after the given commit(s)]:INSERT_AFTER: ' \
'()*--insert-after=[Insert the new change after the given commit(s)]:INSERT_AFTER: ' \
'()*--after=[Insert the new change after the given commit(s)]:INSERT_AFTER: ' \
'()*-B+[Insert the new change before the given commit(s)]:INSERT_BEFORE: ' \
'()*--insert-before=[Insert the new change before the given commit(s)]:INSERT_BEFORE: ' \
'()*--before=[Insert the new change before the given commit(s)]:INSERT_BEFORE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'*-r[Ignored (but lets you pass \`-r\` for consistency with other commands)]' \
'-L[Deprecated. Please prefix the revset with \`all\:\` instead]' \
'--allow-large-revsets[Deprecated. Please prefix the revset with \`all\:\` instead]' \
'(--edit)--no-edit[Do not edit the newly created change]' \
'--edit[No-op flag to pair with --no-edit]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::revisions -- Parent(s) of the new change:' \
&& ret=0
;;
(next)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-e[Instead of creating a new working-copy commit on top of the target commit (like \`jj new\`), edit the target commit directly (like \`jj edit\`)]' \
'--edit[Instead of creating a new working-copy commit on top of the target commit (like \`jj new\`), edit the target commit directly (like \`jj edit\`)]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::offset -- How many revisions to move forward. Advances to the next child by default:' \
&& ret=0
;;
(obslog)
_arguments "${_arguments_options[@]}" \
'-r+[]:REVISION: ' \
'--revision=[]:REVISION: ' \
'-l+[Limit number of revisions to show]:LIMIT: ' \
'--limit=[Limit number of revisions to show]:LIMIT: ' \
'-T+[Render each revision using the given template]:TEMPLATE: ' \
'--template=[Render each revision using the given template]:TEMPLATE: ' \
'--tool=[Generate diff by external command]:TOOL: ' \
'--context=[Number of lines of context to show]:CONTEXT: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--no-graph[Don'\''t show the graph, show a flat list of revisions]' \
'-p[Show patch compared to the previous version of this change]' \
'--patch[Show patch compared to the previous version of this change]' \
'-s[For each path, show only whether it was modified, added, or deleted]' \
'--summary[For each path, show only whether it was modified, added, or deleted]' \
'--stat[Show a histogram of the changes]' \
'--types[For each path, show only its type before and after]' \
'--git[Show a Git-format diff]' \
'--color-words[Show a word-level diff with changes indicated only by color]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(operation)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__operation_commands" \
"*::: :->operation" \
&& ret=0

    case $state in
    (operation)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-operation-command-$line[1]:"
        case $line[1] in
            (abandon)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':operation -- The operation or operation range to abandon:' \
&& ret=0
;;
(log)
_arguments "${_arguments_options[@]}" \
'-l+[Limit number of operations to show]:LIMIT: ' \
'--limit=[Limit number of operations to show]:LIMIT: ' \
'-T+[Render each operation using the given template]:TEMPLATE: ' \
'--template=[Render each operation using the given template]:TEMPLATE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--no-graph[Don'\''t show the graph, show a flat list of operations]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(undo)
_arguments "${_arguments_options[@]}" \
'*--what=[What portions of the local state to restore (can be repeated)]:WHAT:((repo\:"The jj repo state and local branches"
remote-tracking\:"The remote-tracking branches. Do not restore these if you'\''d like to push after the undo"))' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::operation -- The operation to undo:' \
&& ret=0
;;
(restore)
_arguments "${_arguments_options[@]}" \
'*--what=[What portions of the local state to restore (can be repeated)]:WHAT:((repo\:"The jj repo state and local branches"
remote-tracking\:"The remote-tracking branches. Do not restore these if you'\''d like to push after the undo"))' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':operation -- The operation to restore to:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__operation__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-operation-help-command-$line[1]:"
        case $line[1] in
            (abandon)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(log)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(undo)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(restore)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(parallelize)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::revisions -- Revisions to parallelize:' \
&& ret=0
;;
(prev)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-e[Edit the parent directly, instead of moving the working-copy commit]' \
'--edit[Edit the parent directly, instead of moving the working-copy commit]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::offset -- How many revisions to move backward. Moves to the parent by default:' \
&& ret=0
;;
(rebase)
_arguments "${_arguments_options[@]}" \
'*-b+[Rebase the whole branch relative to destination'\''s ancestors (can be repeated)]:BRANCH: ' \
'*--branch=[Rebase the whole branch relative to destination'\''s ancestors (can be repeated)]:BRANCH: ' \
'*-s+[Rebase specified revision(s) together with their trees of descendants (can be repeated)]:SOURCE: ' \
'*--source=[Rebase specified revision(s) together with their trees of descendants (can be repeated)]:SOURCE: ' \
'*-r+[Rebase the given revisions, rebasing descendants onto this revision'\''s parent(s)]:REVISIONS: ' \
'*--revisions=[Rebase the given revisions, rebasing descendants onto this revision'\''s parent(s)]:REVISIONS: ' \
'*-d+[The revision(s) to rebase onto (can be repeated to create a merge commit)]:DESTINATION: ' \
'*--destination=[The revision(s) to rebase onto (can be repeated to create a merge commit)]:DESTINATION: ' \
'(-d --destination -s --source -b --branch)*-A+[The revision(s) to insert after (can be repeated to create a merge commit)]:INSERT_AFTER: ' \
'(-d --destination -s --source -b --branch)*--insert-after=[The revision(s) to insert after (can be repeated to create a merge commit)]:INSERT_AFTER: ' \
'(-d --destination -s --source -b --branch)*--after=[The revision(s) to insert after (can be repeated to create a merge commit)]:INSERT_AFTER: ' \
'(-d --destination -s --source -b --branch)*-B+[The revision(s) to insert before (can be repeated to create a merge commit)]:INSERT_BEFORE: ' \
'(-d --destination -s --source -b --branch)*--insert-before=[The revision(s) to insert before (can be repeated to create a merge commit)]:INSERT_BEFORE: ' \
'(-d --destination -s --source -b --branch)*--before=[The revision(s) to insert before (can be repeated to create a merge commit)]:INSERT_BEFORE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'(-r --revisions)--skip-empty[If true, when rebasing would produce an empty commit, the commit is abandoned. It will not be abandoned if it was already empty before the rebase. Will never skip merge commits with multiple non-empty parents]' \
'-L[Deprecated. Please prefix the revset with \`all\:\` instead]' \
'--allow-large-revsets[Deprecated. Please prefix the revset with \`all\:\` instead]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(resolve)
_arguments "${_arguments_options[@]}" \
'-r+[]:REVISION: ' \
'--revision=[]:REVISION: ' \
'(-l --list)--tool=[Specify 3-way merge tool to be used]:NAME: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-l[Instead of resolving one conflict, list all the conflicts]' \
'--list[Instead of resolving one conflict, list all the conflicts]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Restrict to these paths when searching for a conflict to resolve. We will attempt to resolve the first conflict we can find. You can use the `--list` argument to find paths to use here:_files' \
&& ret=0
;;
(restore)
_arguments "${_arguments_options[@]}" \
'--from=[Revision to restore from (source)]:FROM: ' \
'--to=[Revision to restore into (destination)]:TO: ' \
'(--to --from)-c+[Undo the changes in a revision as compared to the merge of its parents]:REVISION: ' \
'(--to --from)--changes-in=[Undo the changes in a revision as compared to the merge of its parents]:REVISION: ' \
'-r+[Prints an error. DO NOT USE]:REVISION: ' \
'--revision=[Prints an error. DO NOT USE]:REVISION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Restore only these paths (instead of all paths):_files' \
&& ret=0
;;
(revert)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::_args:' \
&& ret=0
;;
(root)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(run)
_arguments "${_arguments_options[@]}" \
'*-r+[The revisions to change]:REVISIONS: ' \
'*--revisions=[The revisions to change]:REVISIONS: ' \
'-j+[How many processes should run in parallel, uses by default all cores]:JOBS: ' \
'--jobs=[How many processes should run in parallel, uses by default all cores]:JOBS: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-x[A no-op option to match the interface of \`git rebase -x\`]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':shell_command -- The command to run across all selected revisions:' \
&& ret=0
;;
(show)
_arguments "${_arguments_options[@]}" \
'-T+[Render a revision using the given template]:TEMPLATE: ' \
'--template=[Render a revision using the given template]:TEMPLATE: ' \
'--tool=[Generate diff by external command]:TOOL: ' \
'--context=[Number of lines of context to show]:CONTEXT: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-r[Ignored (but lets you pass \`-r\` for consistency with other commands)]' \
'-s[For each path, show only whether it was modified, added, or deleted]' \
'--summary[For each path, show only whether it was modified, added, or deleted]' \
'--stat[Show a histogram of the changes]' \
'--types[For each path, show only its type before and after]' \
'--git[Show a Git-format diff]' \
'--color-words[Show a word-level diff with changes indicated only by color]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::revision -- Show changes in this revision, compared to its parent(s):' \
&& ret=0
;;
(sparse)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__sparse_commands" \
"*::: :->sparse" \
&& ret=0

    case $state in
    (sparse)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-sparse-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
'*--add=[Patterns to add to the working copy]:ADD:_files' \
'(--clear)*--remove=[Patterns to remove from the working copy]:REMOVE:_files' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--clear[Include no files in the working copy (combine with --add)]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(reset)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__sparse__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-sparse-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(reset)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(split)
_arguments "${_arguments_options[@]}" \
'--tool=[Specify diff editor to be used (implies --interactive)]:NAME: ' \
'-r+[The revision to split]:REVISION: ' \
'--revision=[The revision to split]:REVISION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-i[Interactively choose which parts to split. This is the default if no paths are provided]' \
'--interactive[Interactively choose which parts to split. This is the default if no paths are provided]' \
'-s[Split the revision into two siblings instead of a parent and child]' \
'--siblings[Split the revision into two siblings instead of a parent and child]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Put these paths in the first commit:_files' \
&& ret=0
;;
(squash)
_arguments "${_arguments_options[@]}" \
'-r+[Revision to squash into its parent (default\: @)]:REVISION: ' \
'--revision=[Revision to squash into its parent (default\: @)]:REVISION: ' \
'(-r --revision)*--from=[Revision(s) to squash from (default\: @)]:FROM: ' \
'(-r --revision)--into=[Revision to squash into (default\: @)]:INTO: ' \
'(-r --revision)--to=[Revision to squash into (default\: @)]:INTO: ' \
'*-m+[The description to use for squashed revision (don'\''t open editor)]:MESSAGE: ' \
'*--message=[The description to use for squashed revision (don'\''t open editor)]:MESSAGE: ' \
'--tool=[Specify diff editor to be used (implies --interactive)]:NAME: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'(-m --message)-u[Use the description of the destination revision and discard the description(s) of the source revision(s)]' \
'(-m --message)--use-destination-message[Use the description of the destination revision and discard the description(s) of the source revision(s)]' \
'-i[Interactively choose which parts to squash]' \
'--interactive[Interactively choose which parts to squash]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Move only changes to these paths (instead of all paths):_files' \
&& ret=0
;;
(status)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Restrict the status display to these paths:_files' \
&& ret=0
;;
(tag)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__tag_commands" \
"*::: :->tag" \
&& ret=0

    case $state in
    (tag)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-tag-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
'-T+[Render each tag using the given template]:TEMPLATE: ' \
'--template=[Render each tag using the given template]:TEMPLATE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::names -- Show tags whose local name matches:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__tag__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-tag-help-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(util)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__util_commands" \
"*::: :->util" \
&& ret=0

    case $state in
    (util)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-util-command-$line[1]:"
        case $line[1] in
            (completion)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--bash[Deprecated. Use the SHELL positional argument instead]' \
'--fish[Deprecated. Use the SHELL positional argument instead]' \
'--zsh[Deprecated. Use the SHELL positional argument instead]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::shell:(bash elvish fish nushell power-shell zsh)' \
&& ret=0
;;
(gc)
_arguments "${_arguments_options[@]}" \
'--expire=[Time threshold]:EXPIRE: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(mangen)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(markdown-help)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(config-schema)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__util__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-util-help-command-$line[1]:"
        case $line[1] in
            (completion)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(gc)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(mangen)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(markdown-help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(config-schema)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(undo)
_arguments "${_arguments_options[@]}" \
'*--what=[What portions of the local state to restore (can be repeated)]:WHAT:((repo\:"The jj repo state and local branches"
remote-tracking\:"The remote-tracking branches. Do not restore these if you'\''d like to push after the undo"))' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'::operation -- The operation to undo:' \
&& ret=0
;;
(unsquash)
_arguments "${_arguments_options[@]}" \
'-r+[]:REVISION: ' \
'--revision=[]:REVISION: ' \
'--tool=[Specify diff editor to be used (implies --interactive)]:NAME: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'-i[Interactively choose which parts to unsquash]' \
'--interactive[Interactively choose which parts to unsquash]' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(untrack)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::paths -- Paths to untrack. They must already be ignored:_files' \
&& ret=0
;;
(version)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(workspace)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
":: :_jj__workspace_commands" \
"*::: :->workspace" \
&& ret=0

    case $state in
    (workspace)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-workspace-command-$line[1]:"
        case $line[1] in
            (add)
_arguments "${_arguments_options[@]}" \
'--name=[A name for the workspace]:NAME: ' \
'*-r+[A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents]:REVISION: ' \
'*--revision=[A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents]:REVISION: ' \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
':destination -- Where to create the new workspace:' \
&& ret=0
;;
(forget)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'*::workspaces -- Names of the workspaces to forget. By default, forgets only the current workspace:' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(root)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(update-stale)
_arguments "${_arguments_options[@]}" \
'-R+[Path to repository to operate on]:REPOSITORY:_files -/' \
'--repository=[Path to repository to operate on]:REPOSITORY:_files -/' \
'--at-operation=[Operation to load the repo at]:AT_OPERATION: ' \
'--at-op=[Operation to load the repo at]:AT_OPERATION: ' \
'--color=[When to colorize output (always, never, debug, auto)]:WHEN: ' \
'*--config-toml=[Additional configuration options (can be repeated)]:TOML: ' \
'--ignore-working-copy[Don'\''t snapshot the working copy, and don'\''t update it]' \
'--ignore-immutable[Allow rewriting immutable commits]' \
'--debug[Enable debug logging]' \
'--quiet[Silence non-primary command output]' \
'--no-pager[Disable the pager]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__workspace__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-workspace-help-command-$line[1]:"
        case $line[1] in
            (add)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(forget)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(root)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(update-stale)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" \
":: :_jj__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-command-$line[1]:"
        case $line[1] in
            (abandon)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(backout)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(branch)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__branch_commands" \
"*::: :->branch" \
&& ret=0

    case $state in
    (branch)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-branch-command-$line[1]:"
        case $line[1] in
            (create)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(delete)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(forget)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(rename)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(track)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(untrack)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(cat)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(checkout)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(chmod)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(commit)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(config)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__config_commands" \
"*::: :->config" \
&& ret=0

    case $state in
    (config)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-config-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(get)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(path)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(debug)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__debug_commands" \
"*::: :->debug" \
&& ret=0

    case $state in
    (debug)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-debug-command-$line[1]:"
        case $line[1] in
            (fileset)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(revset)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(workingcopy)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(template)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(index)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(reindex)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(operation)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(tree)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(watchman)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__debug__watchman_commands" \
"*::: :->watchman" \
&& ret=0

    case $state in
    (watchman)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-debug-watchman-command-$line[1]:"
        case $line[1] in
            (status)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(query-clock)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(query-changed-files)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(reset-clock)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(describe)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(diff)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(diffedit)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(duplicate)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(files)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(fix)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(git)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__git_commands" \
"*::: :->git" \
&& ret=0

    case $state in
    (git)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-git-command-$line[1]:"
        case $line[1] in
            (remote)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__git__remote_commands" \
"*::: :->remote" \
&& ret=0

    case $state in
    (remote)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-git-remote-command-$line[1]:"
        case $line[1] in
            (add)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(remove)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(rename)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(init)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(fetch)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(clone)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(push)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(import)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(export)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(submodule)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__git__submodule_commands" \
"*::: :->submodule" \
&& ret=0

    case $state in
    (submodule)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-git-submodule-command-$line[1]:"
        case $line[1] in
            (print-gitmodules)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
;;
(init)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(interdiff)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(log)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(merge)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(move)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(new)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(next)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(obslog)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(operation)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__operation_commands" \
"*::: :->operation" \
&& ret=0

    case $state in
    (operation)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-operation-command-$line[1]:"
        case $line[1] in
            (abandon)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(log)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(undo)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(restore)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(parallelize)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(prev)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(rebase)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(resolve)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(restore)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(revert)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(root)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(run)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(show)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(sparse)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__sparse_commands" \
"*::: :->sparse" \
&& ret=0

    case $state in
    (sparse)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-sparse-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(set)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(reset)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(edit)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(split)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(squash)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(status)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(tag)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__tag_commands" \
"*::: :->tag" \
&& ret=0

    case $state in
    (tag)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-tag-command-$line[1]:"
        case $line[1] in
            (list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(util)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__util_commands" \
"*::: :->util" \
&& ret=0

    case $state in
    (util)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-util-command-$line[1]:"
        case $line[1] in
            (completion)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(gc)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(mangen)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(markdown-help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(config-schema)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(undo)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(unsquash)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(untrack)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(version)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(workspace)
_arguments "${_arguments_options[@]}" \
":: :_jj__help__workspace_commands" \
"*::: :->workspace" \
&& ret=0

    case $state in
    (workspace)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:jj-help-workspace-command-$line[1]:"
        case $line[1] in
            (add)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(forget)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(root)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
(update-stale)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
(help)
_arguments "${_arguments_options[@]}" \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_jj_commands] )) ||
_jj_commands() {
    local commands; commands=(
'abandon:Abandon a revision' \
'backout:Apply the reverse of a revision on top of another revision' \
'branch:Manage branches' \
'cat:Print contents of files in a revision' \
'checkout:Create a new, empty change and edit it in the working copy (DEPRECATED, use \`jj new\`)' \
'chmod:Sets or removes the executable bit for paths in the repo' \
'commit:Update the description and create a new change on top' \
'ci:Update the description and create a new change on top' \
'config:Manage config options' \
'debug:Low-level commands not intended for users' \
'describe:Update the change description or other metadata' \
'desc:Update the change description or other metadata' \
'diff:Compare file contents between two revisions' \
'diffedit:Touch up the content changes in a revision with a diff editor' \
'duplicate:Create a new change with the same content as an existing one' \
'edit:Sets the specified revision as the working-copy revision' \
'files:List files in a revision' \
'fix:Update files with formatting fixes or other changes' \
'git:Commands for working with Git remotes and the underlying Git repo' \
'init:Create a new repo in the given directory' \
'interdiff:Compare the changes of two commits' \
'log:Show revision history' \
'merge:Merge work from multiple branches (DEPRECATED, use \`jj new\`)' \
'move:Move changes from one revision into another (DEPRECATED, use \`jj squash\`)' \
'new:Create a new, empty change and (by default) edit it in the working copy' \
'next:Move the working-copy commit to the child revision' \
'obslog:Show how a change has evolved over time' \
'operation:Commands for working with the operation log' \
'op:Commands for working with the operation log' \
'parallelize:Parallelize revisions by making them siblings' \
'prev:Change the working copy revision relative to the parent revision' \
'rebase:Move revisions to different parent(s)' \
'resolve:Resolve a conflicted file with an external merge tool' \
'restore:Restore paths from another revision' \
'revert:A dummy command that accepts any arguments' \
'root:Show the current workspace root directory' \
'run:Run a command across a set of revisions.' \
'show:Show commit description and changes in a revision' \
'sparse:Manage which paths from the working-copy commit are present in the working copy' \
'split:Split a revision in two' \
'squash:Move changes from a revision into another revision' \
'status:Show high-level repo status' \
'st:Show high-level repo status' \
'tag:Manage tags' \
'util:Infrequently used commands such as for generating shell completions' \
'undo:Undo an operation (shortcut for \`jj op undo\`)' \
'unsquash:Move changes from a revision'\''s parent into the revision' \
'untrack:Stop tracking specified paths in the working copy' \
'version:Display version information' \
'workspace:Commands for working with workspaces' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj commands' commands "$@"
}
(( $+functions[_jj__abandon_commands] )) ||
_jj__abandon_commands() {
    local commands; commands=()
    _describe -t commands 'jj abandon commands' commands "$@"
}
(( $+functions[_jj__help__abandon_commands] )) ||
_jj__help__abandon_commands() {
    local commands; commands=()
    _describe -t commands 'jj help abandon commands' commands "$@"
}
(( $+functions[_jj__help__operation__abandon_commands] )) ||
_jj__help__operation__abandon_commands() {
    local commands; commands=()
    _describe -t commands 'jj help operation abandon commands' commands "$@"
}
(( $+functions[_jj__operation__abandon_commands] )) ||
_jj__operation__abandon_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation abandon commands' commands "$@"
}
(( $+functions[_jj__operation__help__abandon_commands] )) ||
_jj__operation__help__abandon_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation help abandon commands' commands "$@"
}
(( $+functions[_jj__git__help__remote__add_commands] )) ||
_jj__git__help__remote__add_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help remote add commands' commands "$@"
}
(( $+functions[_jj__git__remote__add_commands] )) ||
_jj__git__remote__add_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote add commands' commands "$@"
}
(( $+functions[_jj__git__remote__help__add_commands] )) ||
_jj__git__remote__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote help add commands' commands "$@"
}
(( $+functions[_jj__help__git__remote__add_commands] )) ||
_jj__help__git__remote__add_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git remote add commands' commands "$@"
}
(( $+functions[_jj__help__workspace__add_commands] )) ||
_jj__help__workspace__add_commands() {
    local commands; commands=()
    _describe -t commands 'jj help workspace add commands' commands "$@"
}
(( $+functions[_jj__workspace__add_commands] )) ||
_jj__workspace__add_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace add commands' commands "$@"
}
(( $+functions[_jj__workspace__help__add_commands] )) ||
_jj__workspace__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace help add commands' commands "$@"
}
(( $+functions[_jj__backout_commands] )) ||
_jj__backout_commands() {
    local commands; commands=()
    _describe -t commands 'jj backout commands' commands "$@"
}
(( $+functions[_jj__help__backout_commands] )) ||
_jj__help__backout_commands() {
    local commands; commands=()
    _describe -t commands 'jj help backout commands' commands "$@"
}
(( $+functions[_jj__branch_commands] )) ||
_jj__branch_commands() {
    local commands; commands=(
'create:Create a new branch' \
'c:Create a new branch' \
'delete:Delete an existing branch and propagate the deletion to remotes on the next push' \
'd:Delete an existing branch and propagate the deletion to remotes on the next push' \
'forget:Forget everything about a branch, including its local and remote targets' \
'f:Forget everything about a branch, including its local and remote targets' \
'list:List branches and their targets' \
'l:List branches and their targets' \
'rename:Rename \`old\` branch name to \`new\` branch name' \
'r:Rename \`old\` branch name to \`new\` branch name' \
'set:Update an existing branch to point to a certain commit' \
's:Update an existing branch to point to a certain commit' \
'track:Start tracking given remote branches' \
't:Start tracking given remote branches' \
'untrack:Stop tracking given remote branches' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj branch commands' commands "$@"
}
(( $+functions[_jj__help__branch_commands] )) ||
_jj__help__branch_commands() {
    local commands; commands=(
'create:Create a new branch' \
'delete:Delete an existing branch and propagate the deletion to remotes on the next push' \
'forget:Forget everything about a branch, including its local and remote targets' \
'list:List branches and their targets' \
'rename:Rename \`old\` branch name to \`new\` branch name' \
'set:Update an existing branch to point to a certain commit' \
'track:Start tracking given remote branches' \
'untrack:Stop tracking given remote branches' \
    )
    _describe -t commands 'jj help branch commands' commands "$@"
}
(( $+functions[_jj__cat_commands] )) ||
_jj__cat_commands() {
    local commands; commands=()
    _describe -t commands 'jj cat commands' commands "$@"
}
(( $+functions[_jj__help__cat_commands] )) ||
_jj__help__cat_commands() {
    local commands; commands=()
    _describe -t commands 'jj help cat commands' commands "$@"
}
(( $+functions[_jj__checkout_commands] )) ||
_jj__checkout_commands() {
    local commands; commands=()
    _describe -t commands 'jj checkout commands' commands "$@"
}
(( $+functions[_jj__help__checkout_commands] )) ||
_jj__help__checkout_commands() {
    local commands; commands=()
    _describe -t commands 'jj help checkout commands' commands "$@"
}
(( $+functions[_jj__chmod_commands] )) ||
_jj__chmod_commands() {
    local commands; commands=()
    _describe -t commands 'jj chmod commands' commands "$@"
}
(( $+functions[_jj__help__chmod_commands] )) ||
_jj__help__chmod_commands() {
    local commands; commands=()
    _describe -t commands 'jj help chmod commands' commands "$@"
}
(( $+functions[_jj__git__clone_commands] )) ||
_jj__git__clone_commands() {
    local commands; commands=()
    _describe -t commands 'jj git clone commands' commands "$@"
}
(( $+functions[_jj__git__help__clone_commands] )) ||
_jj__git__help__clone_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help clone commands' commands "$@"
}
(( $+functions[_jj__help__git__clone_commands] )) ||
_jj__help__git__clone_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git clone commands' commands "$@"
}
(( $+functions[_jj__commit_commands] )) ||
_jj__commit_commands() {
    local commands; commands=()
    _describe -t commands 'jj commit commands' commands "$@"
}
(( $+functions[_jj__help__commit_commands] )) ||
_jj__help__commit_commands() {
    local commands; commands=()
    _describe -t commands 'jj help commit commands' commands "$@"
}
(( $+functions[_jj__help__util__completion_commands] )) ||
_jj__help__util__completion_commands() {
    local commands; commands=()
    _describe -t commands 'jj help util completion commands' commands "$@"
}
(( $+functions[_jj__util__completion_commands] )) ||
_jj__util__completion_commands() {
    local commands; commands=()
    _describe -t commands 'jj util completion commands' commands "$@"
}
(( $+functions[_jj__util__help__completion_commands] )) ||
_jj__util__help__completion_commands() {
    local commands; commands=()
    _describe -t commands 'jj util help completion commands' commands "$@"
}
(( $+functions[_jj__config_commands] )) ||
_jj__config_commands() {
    local commands; commands=(
'list:List variables set in config file, along with their values' \
'l:List variables set in config file, along with their values' \
'get:Get the value of a given config option.' \
'g:Get the value of a given config option.' \
'set:Update config file to set the given option to a given value' \
's:Update config file to set the given option to a given value' \
'edit:Start an editor on a jj config file' \
'e:Start an editor on a jj config file' \
'path:Print the path to the config file' \
'p:Print the path to the config file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj config commands' commands "$@"
}
(( $+functions[_jj__help__config_commands] )) ||
_jj__help__config_commands() {
    local commands; commands=(
'list:List variables set in config file, along with their values' \
'get:Get the value of a given config option.' \
'set:Update config file to set the given option to a given value' \
'edit:Start an editor on a jj config file' \
'path:Print the path to the config file' \
    )
    _describe -t commands 'jj help config commands' commands "$@"
}
(( $+functions[_jj__help__util__config-schema_commands] )) ||
_jj__help__util__config-schema_commands() {
    local commands; commands=()
    _describe -t commands 'jj help util config-schema commands' commands "$@"
}
(( $+functions[_jj__util__config-schema_commands] )) ||
_jj__util__config-schema_commands() {
    local commands; commands=()
    _describe -t commands 'jj util config-schema commands' commands "$@"
}
(( $+functions[_jj__util__help__config-schema_commands] )) ||
_jj__util__help__config-schema_commands() {
    local commands; commands=()
    _describe -t commands 'jj util help config-schema commands' commands "$@"
}
(( $+functions[_jj__branch__create_commands] )) ||
_jj__branch__create_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch create commands' commands "$@"
}
(( $+functions[_jj__branch__help__create_commands] )) ||
_jj__branch__help__create_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help create commands' commands "$@"
}
(( $+functions[_jj__help__branch__create_commands] )) ||
_jj__help__branch__create_commands() {
    local commands; commands=()
    _describe -t commands 'jj help branch create commands' commands "$@"
}
(( $+functions[_jj__debug_commands] )) ||
_jj__debug_commands() {
    local commands; commands=(
'fileset:Parse fileset expression' \
'revset:Evaluate revset to full commit IDs' \
'workingcopy:Show information about the working copy state' \
'template:Parse a template' \
'index:Show commit index stats' \
'reindex:Rebuild commit index' \
'operation:Show information about an operation and its view' \
'view:Show information about an operation and its view' \
'tree:List the recursive entries of a tree' \
'watchman:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj debug commands' commands "$@"
}
(( $+functions[_jj__help__debug_commands] )) ||
_jj__help__debug_commands() {
    local commands; commands=(
'fileset:Parse fileset expression' \
'revset:Evaluate revset to full commit IDs' \
'workingcopy:Show information about the working copy state' \
'template:Parse a template' \
'index:Show commit index stats' \
'reindex:Rebuild commit index' \
'operation:Show information about an operation and its view' \
'tree:List the recursive entries of a tree' \
'watchman:' \
    )
    _describe -t commands 'jj help debug commands' commands "$@"
}
(( $+functions[_jj__branch__delete_commands] )) ||
_jj__branch__delete_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch delete commands' commands "$@"
}
(( $+functions[_jj__branch__help__delete_commands] )) ||
_jj__branch__help__delete_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help delete commands' commands "$@"
}
(( $+functions[_jj__help__branch__delete_commands] )) ||
_jj__help__branch__delete_commands() {
    local commands; commands=()
    _describe -t commands 'jj help branch delete commands' commands "$@"
}
(( $+functions[_jj__describe_commands] )) ||
_jj__describe_commands() {
    local commands; commands=()
    _describe -t commands 'jj describe commands' commands "$@"
}
(( $+functions[_jj__help__describe_commands] )) ||
_jj__help__describe_commands() {
    local commands; commands=()
    _describe -t commands 'jj help describe commands' commands "$@"
}
(( $+functions[_jj__diff_commands] )) ||
_jj__diff_commands() {
    local commands; commands=()
    _describe -t commands 'jj diff commands' commands "$@"
}
(( $+functions[_jj__help__diff_commands] )) ||
_jj__help__diff_commands() {
    local commands; commands=()
    _describe -t commands 'jj help diff commands' commands "$@"
}
(( $+functions[_jj__diffedit_commands] )) ||
_jj__diffedit_commands() {
    local commands; commands=()
    _describe -t commands 'jj diffedit commands' commands "$@"
}
(( $+functions[_jj__help__diffedit_commands] )) ||
_jj__help__diffedit_commands() {
    local commands; commands=()
    _describe -t commands 'jj help diffedit commands' commands "$@"
}
(( $+functions[_jj__duplicate_commands] )) ||
_jj__duplicate_commands() {
    local commands; commands=()
    _describe -t commands 'jj duplicate commands' commands "$@"
}
(( $+functions[_jj__help__duplicate_commands] )) ||
_jj__help__duplicate_commands() {
    local commands; commands=()
    _describe -t commands 'jj help duplicate commands' commands "$@"
}
(( $+functions[_jj__config__edit_commands] )) ||
_jj__config__edit_commands() {
    local commands; commands=()
    _describe -t commands 'jj config edit commands' commands "$@"
}
(( $+functions[_jj__config__help__edit_commands] )) ||
_jj__config__help__edit_commands() {
    local commands; commands=()
    _describe -t commands 'jj config help edit commands' commands "$@"
}
(( $+functions[_jj__edit_commands] )) ||
_jj__edit_commands() {
    local commands; commands=()
    _describe -t commands 'jj edit commands' commands "$@"
}
(( $+functions[_jj__help__config__edit_commands] )) ||
_jj__help__config__edit_commands() {
    local commands; commands=()
    _describe -t commands 'jj help config edit commands' commands "$@"
}
(( $+functions[_jj__help__edit_commands] )) ||
_jj__help__edit_commands() {
    local commands; commands=()
    _describe -t commands 'jj help edit commands' commands "$@"
}
(( $+functions[_jj__help__sparse__edit_commands] )) ||
_jj__help__sparse__edit_commands() {
    local commands; commands=()
    _describe -t commands 'jj help sparse edit commands' commands "$@"
}
(( $+functions[_jj__sparse__edit_commands] )) ||
_jj__sparse__edit_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse edit commands' commands "$@"
}
(( $+functions[_jj__sparse__help__edit_commands] )) ||
_jj__sparse__help__edit_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse help edit commands' commands "$@"
}
(( $+functions[_jj__git__export_commands] )) ||
_jj__git__export_commands() {
    local commands; commands=()
    _describe -t commands 'jj git export commands' commands "$@"
}
(( $+functions[_jj__git__help__export_commands] )) ||
_jj__git__help__export_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help export commands' commands "$@"
}
(( $+functions[_jj__help__git__export_commands] )) ||
_jj__help__git__export_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git export commands' commands "$@"
}
(( $+functions[_jj__git__fetch_commands] )) ||
_jj__git__fetch_commands() {
    local commands; commands=()
    _describe -t commands 'jj git fetch commands' commands "$@"
}
(( $+functions[_jj__git__help__fetch_commands] )) ||
_jj__git__help__fetch_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help fetch commands' commands "$@"
}
(( $+functions[_jj__help__git__fetch_commands] )) ||
_jj__help__git__fetch_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git fetch commands' commands "$@"
}
(( $+functions[_jj__files_commands] )) ||
_jj__files_commands() {
    local commands; commands=()
    _describe -t commands 'jj files commands' commands "$@"
}
(( $+functions[_jj__help__files_commands] )) ||
_jj__help__files_commands() {
    local commands; commands=()
    _describe -t commands 'jj help files commands' commands "$@"
}
(( $+functions[_jj__debug__fileset_commands] )) ||
_jj__debug__fileset_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug fileset commands' commands "$@"
}
(( $+functions[_jj__debug__help__fileset_commands] )) ||
_jj__debug__help__fileset_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help fileset commands' commands "$@"
}
(( $+functions[_jj__help__debug__fileset_commands] )) ||
_jj__help__debug__fileset_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug fileset commands' commands "$@"
}
(( $+functions[_jj__fix_commands] )) ||
_jj__fix_commands() {
    local commands; commands=()
    _describe -t commands 'jj fix commands' commands "$@"
}
(( $+functions[_jj__help__fix_commands] )) ||
_jj__help__fix_commands() {
    local commands; commands=()
    _describe -t commands 'jj help fix commands' commands "$@"
}
(( $+functions[_jj__branch__forget_commands] )) ||
_jj__branch__forget_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch forget commands' commands "$@"
}
(( $+functions[_jj__branch__help__forget_commands] )) ||
_jj__branch__help__forget_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help forget commands' commands "$@"
}
(( $+functions[_jj__help__branch__forget_commands] )) ||
_jj__help__branch__forget_commands() {
    local commands; commands=()
    _describe -t commands 'jj help branch forget commands' commands "$@"
}
(( $+functions[_jj__help__workspace__forget_commands] )) ||
_jj__help__workspace__forget_commands() {
    local commands; commands=()
    _describe -t commands 'jj help workspace forget commands' commands "$@"
}
(( $+functions[_jj__workspace__forget_commands] )) ||
_jj__workspace__forget_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace forget commands' commands "$@"
}
(( $+functions[_jj__workspace__help__forget_commands] )) ||
_jj__workspace__help__forget_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace help forget commands' commands "$@"
}
(( $+functions[_jj__help__util__gc_commands] )) ||
_jj__help__util__gc_commands() {
    local commands; commands=()
    _describe -t commands 'jj help util gc commands' commands "$@"
}
(( $+functions[_jj__util__gc_commands] )) ||
_jj__util__gc_commands() {
    local commands; commands=()
    _describe -t commands 'jj util gc commands' commands "$@"
}
(( $+functions[_jj__util__help__gc_commands] )) ||
_jj__util__help__gc_commands() {
    local commands; commands=()
    _describe -t commands 'jj util help gc commands' commands "$@"
}
(( $+functions[_jj__config__get_commands] )) ||
_jj__config__get_commands() {
    local commands; commands=()
    _describe -t commands 'jj config get commands' commands "$@"
}
(( $+functions[_jj__config__help__get_commands] )) ||
_jj__config__help__get_commands() {
    local commands; commands=()
    _describe -t commands 'jj config help get commands' commands "$@"
}
(( $+functions[_jj__help__config__get_commands] )) ||
_jj__help__config__get_commands() {
    local commands; commands=()
    _describe -t commands 'jj help config get commands' commands "$@"
}
(( $+functions[_jj__git_commands] )) ||
_jj__git_commands() {
    local commands; commands=(
'remote:Manage Git remotes' \
'init:Create a new Git backed repo' \
'fetch:Fetch from a Git remote' \
'clone:Create a new repo backed by a clone of a Git repo' \
'push:Push to a Git remote' \
'import:Update repo with changes made in the underlying Git repo' \
'export:Update the underlying Git repo with changes made in the repo' \
'submodule:FOR INTERNAL USE ONLY Interact with git submodules' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj git commands' commands "$@"
}
(( $+functions[_jj__help__git_commands] )) ||
_jj__help__git_commands() {
    local commands; commands=(
'remote:Manage Git remotes' \
'init:Create a new Git backed repo' \
'fetch:Fetch from a Git remote' \
'clone:Create a new repo backed by a clone of a Git repo' \
'push:Push to a Git remote' \
'import:Update repo with changes made in the underlying Git repo' \
'export:Update the underlying Git repo with changes made in the repo' \
'submodule:FOR INTERNAL USE ONLY Interact with git submodules' \
    )
    _describe -t commands 'jj help git commands' commands "$@"
}
(( $+functions[_jj__branch__help_commands] )) ||
_jj__branch__help_commands() {
    local commands; commands=(
'create:Create a new branch' \
'delete:Delete an existing branch and propagate the deletion to remotes on the next push' \
'forget:Forget everything about a branch, including its local and remote targets' \
'list:List branches and their targets' \
'rename:Rename \`old\` branch name to \`new\` branch name' \
'set:Update an existing branch to point to a certain commit' \
'track:Start tracking given remote branches' \
'untrack:Stop tracking given remote branches' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj branch help commands' commands "$@"
}
(( $+functions[_jj__branch__help__help_commands] )) ||
_jj__branch__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help help commands' commands "$@"
}
(( $+functions[_jj__config__help_commands] )) ||
_jj__config__help_commands() {
    local commands; commands=(
'list:List variables set in config file, along with their values' \
'get:Get the value of a given config option.' \
'set:Update config file to set the given option to a given value' \
'edit:Start an editor on a jj config file' \
'path:Print the path to the config file' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj config help commands' commands "$@"
}
(( $+functions[_jj__config__help__help_commands] )) ||
_jj__config__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj config help help commands' commands "$@"
}
(( $+functions[_jj__debug__help_commands] )) ||
_jj__debug__help_commands() {
    local commands; commands=(
'fileset:Parse fileset expression' \
'revset:Evaluate revset to full commit IDs' \
'workingcopy:Show information about the working copy state' \
'template:Parse a template' \
'index:Show commit index stats' \
'reindex:Rebuild commit index' \
'operation:Show information about an operation and its view' \
'tree:List the recursive entries of a tree' \
'watchman:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj debug help commands' commands "$@"
}
(( $+functions[_jj__debug__help__help_commands] )) ||
_jj__debug__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help help commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__help_commands] )) ||
_jj__debug__watchman__help_commands() {
    local commands; commands=(
'status:Check whether \`watchman\` is enabled and whether it'\''s correctly installed' \
'query-clock:' \
'query-changed-files:' \
'reset-clock:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj debug watchman help commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__help__help_commands] )) ||
_jj__debug__watchman__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman help help commands' commands "$@"
}
(( $+functions[_jj__git__help_commands] )) ||
_jj__git__help_commands() {
    local commands; commands=(
'remote:Manage Git remotes' \
'init:Create a new Git backed repo' \
'fetch:Fetch from a Git remote' \
'clone:Create a new repo backed by a clone of a Git repo' \
'push:Push to a Git remote' \
'import:Update repo with changes made in the underlying Git repo' \
'export:Update the underlying Git repo with changes made in the repo' \
'submodule:FOR INTERNAL USE ONLY Interact with git submodules' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj git help commands' commands "$@"
}
(( $+functions[_jj__git__help__help_commands] )) ||
_jj__git__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help help commands' commands "$@"
}
(( $+functions[_jj__git__remote__help_commands] )) ||
_jj__git__remote__help_commands() {
    local commands; commands=(
'add:Add a Git remote' \
'remove:Remove a Git remote and forget its branches' \
'rename:Rename a Git remote' \
'list:List Git remotes' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj git remote help commands' commands "$@"
}
(( $+functions[_jj__git__remote__help__help_commands] )) ||
_jj__git__remote__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote help help commands' commands "$@"
}
(( $+functions[_jj__git__submodule__help_commands] )) ||
_jj__git__submodule__help_commands() {
    local commands; commands=(
'print-gitmodules:Print the relevant contents from .gitmodules. For debugging purposes only' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj git submodule help commands' commands "$@"
}
(( $+functions[_jj__git__submodule__help__help_commands] )) ||
_jj__git__submodule__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj git submodule help help commands' commands "$@"
}
(( $+functions[_jj__help_commands] )) ||
_jj__help_commands() {
    local commands; commands=(
'abandon:Abandon a revision' \
'backout:Apply the reverse of a revision on top of another revision' \
'branch:Manage branches' \
'cat:Print contents of files in a revision' \
'checkout:Create a new, empty change and edit it in the working copy (DEPRECATED, use \`jj new\`)' \
'chmod:Sets or removes the executable bit for paths in the repo' \
'commit:Update the description and create a new change on top' \
'config:Manage config options' \
'debug:Low-level commands not intended for users' \
'describe:Update the change description or other metadata' \
'diff:Compare file contents between two revisions' \
'diffedit:Touch up the content changes in a revision with a diff editor' \
'duplicate:Create a new change with the same content as an existing one' \
'edit:Sets the specified revision as the working-copy revision' \
'files:List files in a revision' \
'fix:Update files with formatting fixes or other changes' \
'git:Commands for working with Git remotes and the underlying Git repo' \
'init:Create a new repo in the given directory' \
'interdiff:Compare the changes of two commits' \
'log:Show revision history' \
'merge:Merge work from multiple branches (DEPRECATED, use \`jj new\`)' \
'move:Move changes from one revision into another (DEPRECATED, use \`jj squash\`)' \
'new:Create a new, empty change and (by default) edit it in the working copy' \
'next:Move the working-copy commit to the child revision' \
'obslog:Show how a change has evolved over time' \
'operation:Commands for working with the operation log' \
'parallelize:Parallelize revisions by making them siblings' \
'prev:Change the working copy revision relative to the parent revision' \
'rebase:Move revisions to different parent(s)' \
'resolve:Resolve a conflicted file with an external merge tool' \
'restore:Restore paths from another revision' \
'revert:A dummy command that accepts any arguments' \
'root:Show the current workspace root directory' \
'run:Run a command across a set of revisions.' \
'show:Show commit description and changes in a revision' \
'sparse:Manage which paths from the working-copy commit are present in the working copy' \
'split:Split a revision in two' \
'squash:Move changes from a revision into another revision' \
'status:Show high-level repo status' \
'tag:Manage tags' \
'util:Infrequently used commands such as for generating shell completions' \
'undo:Undo an operation (shortcut for \`jj op undo\`)' \
'unsquash:Move changes from a revision'\''s parent into the revision' \
'untrack:Stop tracking specified paths in the working copy' \
'version:Display version information' \
'workspace:Commands for working with workspaces' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj help commands' commands "$@"
}
(( $+functions[_jj__help__help_commands] )) ||
_jj__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj help help commands' commands "$@"
}
(( $+functions[_jj__operation__help_commands] )) ||
_jj__operation__help_commands() {
    local commands; commands=(
'abandon:Abandon operation history' \
'log:Show the operation log' \
'undo:Create a new operation that undoes an earlier operation' \
'restore:Create a new operation that restores the repo to an earlier state' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj operation help commands' commands "$@"
}
(( $+functions[_jj__operation__help__help_commands] )) ||
_jj__operation__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation help help commands' commands "$@"
}
(( $+functions[_jj__sparse__help_commands] )) ||
_jj__sparse__help_commands() {
    local commands; commands=(
'list:List the patterns that are currently present in the working copy' \
'set:Update the patterns that are present in the working copy' \
'reset:Reset the patterns to include all files in the working copy' \
'edit:Start an editor to update the patterns that are present in the working copy' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj sparse help commands' commands "$@"
}
(( $+functions[_jj__sparse__help__help_commands] )) ||
_jj__sparse__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse help help commands' commands "$@"
}
(( $+functions[_jj__tag__help_commands] )) ||
_jj__tag__help_commands() {
    local commands; commands=(
'list:List tags' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj tag help commands' commands "$@"
}
(( $+functions[_jj__tag__help__help_commands] )) ||
_jj__tag__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj tag help help commands' commands "$@"
}
(( $+functions[_jj__util__help_commands] )) ||
_jj__util__help_commands() {
    local commands; commands=(
'completion:Print a command-line-completion script' \
'gc:Run backend-dependent garbage collection' \
'mangen:Print a ROFF (manpage)' \
'markdown-help:Print the CLI help for all subcommands in Markdown' \
'config-schema:Print the JSON schema for the jj TOML config format' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj util help commands' commands "$@"
}
(( $+functions[_jj__util__help__help_commands] )) ||
_jj__util__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj util help help commands' commands "$@"
}
(( $+functions[_jj__workspace__help_commands] )) ||
_jj__workspace__help_commands() {
    local commands; commands=(
'add:Add a workspace' \
'forget:Stop tracking a workspace'\''s working-copy commit in the repo' \
'list:List workspaces' \
'root:Show the current workspace root directory' \
'update-stale:Update a workspace that has become stale' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj workspace help commands' commands "$@"
}
(( $+functions[_jj__workspace__help__help_commands] )) ||
_jj__workspace__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace help help commands' commands "$@"
}
(( $+functions[_jj__git__help__import_commands] )) ||
_jj__git__help__import_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help import commands' commands "$@"
}
(( $+functions[_jj__git__import_commands] )) ||
_jj__git__import_commands() {
    local commands; commands=()
    _describe -t commands 'jj git import commands' commands "$@"
}
(( $+functions[_jj__help__git__import_commands] )) ||
_jj__help__git__import_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git import commands' commands "$@"
}
(( $+functions[_jj__debug__help__index_commands] )) ||
_jj__debug__help__index_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help index commands' commands "$@"
}
(( $+functions[_jj__debug__index_commands] )) ||
_jj__debug__index_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug index commands' commands "$@"
}
(( $+functions[_jj__help__debug__index_commands] )) ||
_jj__help__debug__index_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug index commands' commands "$@"
}
(( $+functions[_jj__git__help__init_commands] )) ||
_jj__git__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help init commands' commands "$@"
}
(( $+functions[_jj__git__init_commands] )) ||
_jj__git__init_commands() {
    local commands; commands=()
    _describe -t commands 'jj git init commands' commands "$@"
}
(( $+functions[_jj__help__git__init_commands] )) ||
_jj__help__git__init_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git init commands' commands "$@"
}
(( $+functions[_jj__help__init_commands] )) ||
_jj__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'jj help init commands' commands "$@"
}
(( $+functions[_jj__init_commands] )) ||
_jj__init_commands() {
    local commands; commands=()
    _describe -t commands 'jj init commands' commands "$@"
}
(( $+functions[_jj__help__interdiff_commands] )) ||
_jj__help__interdiff_commands() {
    local commands; commands=()
    _describe -t commands 'jj help interdiff commands' commands "$@"
}
(( $+functions[_jj__interdiff_commands] )) ||
_jj__interdiff_commands() {
    local commands; commands=()
    _describe -t commands 'jj interdiff commands' commands "$@"
}
(( $+functions[_jj__branch__help__list_commands] )) ||
_jj__branch__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help list commands' commands "$@"
}
(( $+functions[_jj__branch__list_commands] )) ||
_jj__branch__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch list commands' commands "$@"
}
(( $+functions[_jj__config__help__list_commands] )) ||
_jj__config__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj config help list commands' commands "$@"
}
(( $+functions[_jj__config__list_commands] )) ||
_jj__config__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj config list commands' commands "$@"
}
(( $+functions[_jj__git__help__remote__list_commands] )) ||
_jj__git__help__remote__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help remote list commands' commands "$@"
}
(( $+functions[_jj__git__remote__help__list_commands] )) ||
_jj__git__remote__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote help list commands' commands "$@"
}
(( $+functions[_jj__git__remote__list_commands] )) ||
_jj__git__remote__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote list commands' commands "$@"
}
(( $+functions[_jj__help__branch__list_commands] )) ||
_jj__help__branch__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj help branch list commands' commands "$@"
}
(( $+functions[_jj__help__config__list_commands] )) ||
_jj__help__config__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj help config list commands' commands "$@"
}
(( $+functions[_jj__help__git__remote__list_commands] )) ||
_jj__help__git__remote__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git remote list commands' commands "$@"
}
(( $+functions[_jj__help__sparse__list_commands] )) ||
_jj__help__sparse__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj help sparse list commands' commands "$@"
}
(( $+functions[_jj__help__tag__list_commands] )) ||
_jj__help__tag__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj help tag list commands' commands "$@"
}
(( $+functions[_jj__help__workspace__list_commands] )) ||
_jj__help__workspace__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj help workspace list commands' commands "$@"
}
(( $+functions[_jj__sparse__help__list_commands] )) ||
_jj__sparse__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse help list commands' commands "$@"
}
(( $+functions[_jj__sparse__list_commands] )) ||
_jj__sparse__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse list commands' commands "$@"
}
(( $+functions[_jj__tag__help__list_commands] )) ||
_jj__tag__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj tag help list commands' commands "$@"
}
(( $+functions[_jj__tag__list_commands] )) ||
_jj__tag__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj tag list commands' commands "$@"
}
(( $+functions[_jj__workspace__help__list_commands] )) ||
_jj__workspace__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace help list commands' commands "$@"
}
(( $+functions[_jj__workspace__list_commands] )) ||
_jj__workspace__list_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace list commands' commands "$@"
}
(( $+functions[_jj__help__log_commands] )) ||
_jj__help__log_commands() {
    local commands; commands=()
    _describe -t commands 'jj help log commands' commands "$@"
}
(( $+functions[_jj__help__operation__log_commands] )) ||
_jj__help__operation__log_commands() {
    local commands; commands=()
    _describe -t commands 'jj help operation log commands' commands "$@"
}
(( $+functions[_jj__log_commands] )) ||
_jj__log_commands() {
    local commands; commands=()
    _describe -t commands 'jj log commands' commands "$@"
}
(( $+functions[_jj__operation__help__log_commands] )) ||
_jj__operation__help__log_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation help log commands' commands "$@"
}
(( $+functions[_jj__operation__log_commands] )) ||
_jj__operation__log_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation log commands' commands "$@"
}
(( $+functions[_jj__help__util__mangen_commands] )) ||
_jj__help__util__mangen_commands() {
    local commands; commands=()
    _describe -t commands 'jj help util mangen commands' commands "$@"
}
(( $+functions[_jj__util__help__mangen_commands] )) ||
_jj__util__help__mangen_commands() {
    local commands; commands=()
    _describe -t commands 'jj util help mangen commands' commands "$@"
}
(( $+functions[_jj__util__mangen_commands] )) ||
_jj__util__mangen_commands() {
    local commands; commands=()
    _describe -t commands 'jj util mangen commands' commands "$@"
}
(( $+functions[_jj__help__util__markdown-help_commands] )) ||
_jj__help__util__markdown-help_commands() {
    local commands; commands=()
    _describe -t commands 'jj help util markdown-help commands' commands "$@"
}
(( $+functions[_jj__util__help__markdown-help_commands] )) ||
_jj__util__help__markdown-help_commands() {
    local commands; commands=()
    _describe -t commands 'jj util help markdown-help commands' commands "$@"
}
(( $+functions[_jj__util__markdown-help_commands] )) ||
_jj__util__markdown-help_commands() {
    local commands; commands=()
    _describe -t commands 'jj util markdown-help commands' commands "$@"
}
(( $+functions[_jj__help__merge_commands] )) ||
_jj__help__merge_commands() {
    local commands; commands=()
    _describe -t commands 'jj help merge commands' commands "$@"
}
(( $+functions[_jj__merge_commands] )) ||
_jj__merge_commands() {
    local commands; commands=()
    _describe -t commands 'jj merge commands' commands "$@"
}
(( $+functions[_jj__help__move_commands] )) ||
_jj__help__move_commands() {
    local commands; commands=()
    _describe -t commands 'jj help move commands' commands "$@"
}
(( $+functions[_jj__move_commands] )) ||
_jj__move_commands() {
    local commands; commands=()
    _describe -t commands 'jj move commands' commands "$@"
}
(( $+functions[_jj__help__new_commands] )) ||
_jj__help__new_commands() {
    local commands; commands=()
    _describe -t commands 'jj help new commands' commands "$@"
}
(( $+functions[_jj__new_commands] )) ||
_jj__new_commands() {
    local commands; commands=()
    _describe -t commands 'jj new commands' commands "$@"
}
(( $+functions[_jj__help__next_commands] )) ||
_jj__help__next_commands() {
    local commands; commands=()
    _describe -t commands 'jj help next commands' commands "$@"
}
(( $+functions[_jj__next_commands] )) ||
_jj__next_commands() {
    local commands; commands=()
    _describe -t commands 'jj next commands' commands "$@"
}
(( $+functions[_jj__help__obslog_commands] )) ||
_jj__help__obslog_commands() {
    local commands; commands=()
    _describe -t commands 'jj help obslog commands' commands "$@"
}
(( $+functions[_jj__obslog_commands] )) ||
_jj__obslog_commands() {
    local commands; commands=()
    _describe -t commands 'jj obslog commands' commands "$@"
}
(( $+functions[_jj__debug__help__operation_commands] )) ||
_jj__debug__help__operation_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help operation commands' commands "$@"
}
(( $+functions[_jj__debug__operation_commands] )) ||
_jj__debug__operation_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug operation commands' commands "$@"
}
(( $+functions[_jj__help__debug__operation_commands] )) ||
_jj__help__debug__operation_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug operation commands' commands "$@"
}
(( $+functions[_jj__help__operation_commands] )) ||
_jj__help__operation_commands() {
    local commands; commands=(
'abandon:Abandon operation history' \
'log:Show the operation log' \
'undo:Create a new operation that undoes an earlier operation' \
'restore:Create a new operation that restores the repo to an earlier state' \
    )
    _describe -t commands 'jj help operation commands' commands "$@"
}
(( $+functions[_jj__operation_commands] )) ||
_jj__operation_commands() {
    local commands; commands=(
'abandon:Abandon operation history' \
'log:Show the operation log' \
'undo:Create a new operation that undoes an earlier operation' \
'restore:Create a new operation that restores the repo to an earlier state' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj operation commands' commands "$@"
}
(( $+functions[_jj__help__parallelize_commands] )) ||
_jj__help__parallelize_commands() {
    local commands; commands=()
    _describe -t commands 'jj help parallelize commands' commands "$@"
}
(( $+functions[_jj__parallelize_commands] )) ||
_jj__parallelize_commands() {
    local commands; commands=()
    _describe -t commands 'jj parallelize commands' commands "$@"
}
(( $+functions[_jj__config__help__path_commands] )) ||
_jj__config__help__path_commands() {
    local commands; commands=()
    _describe -t commands 'jj config help path commands' commands "$@"
}
(( $+functions[_jj__config__path_commands] )) ||
_jj__config__path_commands() {
    local commands; commands=()
    _describe -t commands 'jj config path commands' commands "$@"
}
(( $+functions[_jj__help__config__path_commands] )) ||
_jj__help__config__path_commands() {
    local commands; commands=()
    _describe -t commands 'jj help config path commands' commands "$@"
}
(( $+functions[_jj__help__prev_commands] )) ||
_jj__help__prev_commands() {
    local commands; commands=()
    _describe -t commands 'jj help prev commands' commands "$@"
}
(( $+functions[_jj__prev_commands] )) ||
_jj__prev_commands() {
    local commands; commands=()
    _describe -t commands 'jj prev commands' commands "$@"
}
(( $+functions[_jj__git__help__submodule__print-gitmodules_commands] )) ||
_jj__git__help__submodule__print-gitmodules_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help submodule print-gitmodules commands' commands "$@"
}
(( $+functions[_jj__git__submodule__help__print-gitmodules_commands] )) ||
_jj__git__submodule__help__print-gitmodules_commands() {
    local commands; commands=()
    _describe -t commands 'jj git submodule help print-gitmodules commands' commands "$@"
}
(( $+functions[_jj__git__submodule__print-gitmodules_commands] )) ||
_jj__git__submodule__print-gitmodules_commands() {
    local commands; commands=()
    _describe -t commands 'jj git submodule print-gitmodules commands' commands "$@"
}
(( $+functions[_jj__help__git__submodule__print-gitmodules_commands] )) ||
_jj__help__git__submodule__print-gitmodules_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git submodule print-gitmodules commands' commands "$@"
}
(( $+functions[_jj__git__help__push_commands] )) ||
_jj__git__help__push_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help push commands' commands "$@"
}
(( $+functions[_jj__git__push_commands] )) ||
_jj__git__push_commands() {
    local commands; commands=()
    _describe -t commands 'jj git push commands' commands "$@"
}
(( $+functions[_jj__help__git__push_commands] )) ||
_jj__help__git__push_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git push commands' commands "$@"
}
(( $+functions[_jj__debug__help__watchman__query-changed-files_commands] )) ||
_jj__debug__help__watchman__query-changed-files_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help watchman query-changed-files commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__help__query-changed-files_commands] )) ||
_jj__debug__watchman__help__query-changed-files_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman help query-changed-files commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__query-changed-files_commands] )) ||
_jj__debug__watchman__query-changed-files_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman query-changed-files commands' commands "$@"
}
(( $+functions[_jj__help__debug__watchman__query-changed-files_commands] )) ||
_jj__help__debug__watchman__query-changed-files_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug watchman query-changed-files commands' commands "$@"
}
(( $+functions[_jj__debug__help__watchman__query-clock_commands] )) ||
_jj__debug__help__watchman__query-clock_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help watchman query-clock commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__help__query-clock_commands] )) ||
_jj__debug__watchman__help__query-clock_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman help query-clock commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__query-clock_commands] )) ||
_jj__debug__watchman__query-clock_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman query-clock commands' commands "$@"
}
(( $+functions[_jj__help__debug__watchman__query-clock_commands] )) ||
_jj__help__debug__watchman__query-clock_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug watchman query-clock commands' commands "$@"
}
(( $+functions[_jj__help__rebase_commands] )) ||
_jj__help__rebase_commands() {
    local commands; commands=()
    _describe -t commands 'jj help rebase commands' commands "$@"
}
(( $+functions[_jj__rebase_commands] )) ||
_jj__rebase_commands() {
    local commands; commands=()
    _describe -t commands 'jj rebase commands' commands "$@"
}
(( $+functions[_jj__debug__help__reindex_commands] )) ||
_jj__debug__help__reindex_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help reindex commands' commands "$@"
}
(( $+functions[_jj__debug__reindex_commands] )) ||
_jj__debug__reindex_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug reindex commands' commands "$@"
}
(( $+functions[_jj__help__debug__reindex_commands] )) ||
_jj__help__debug__reindex_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug reindex commands' commands "$@"
}
(( $+functions[_jj__git__help__remote_commands] )) ||
_jj__git__help__remote_commands() {
    local commands; commands=(
'add:Add a Git remote' \
'remove:Remove a Git remote and forget its branches' \
'rename:Rename a Git remote' \
'list:List Git remotes' \
    )
    _describe -t commands 'jj git help remote commands' commands "$@"
}
(( $+functions[_jj__git__remote_commands] )) ||
_jj__git__remote_commands() {
    local commands; commands=(
'add:Add a Git remote' \
'remove:Remove a Git remote and forget its branches' \
'rename:Rename a Git remote' \
'list:List Git remotes' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj git remote commands' commands "$@"
}
(( $+functions[_jj__help__git__remote_commands] )) ||
_jj__help__git__remote_commands() {
    local commands; commands=(
'add:Add a Git remote' \
'remove:Remove a Git remote and forget its branches' \
'rename:Rename a Git remote' \
'list:List Git remotes' \
    )
    _describe -t commands 'jj help git remote commands' commands "$@"
}
(( $+functions[_jj__git__help__remote__remove_commands] )) ||
_jj__git__help__remote__remove_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help remote remove commands' commands "$@"
}
(( $+functions[_jj__git__remote__help__remove_commands] )) ||
_jj__git__remote__help__remove_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote help remove commands' commands "$@"
}
(( $+functions[_jj__git__remote__remove_commands] )) ||
_jj__git__remote__remove_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote remove commands' commands "$@"
}
(( $+functions[_jj__help__git__remote__remove_commands] )) ||
_jj__help__git__remote__remove_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git remote remove commands' commands "$@"
}
(( $+functions[_jj__branch__help__rename_commands] )) ||
_jj__branch__help__rename_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help rename commands' commands "$@"
}
(( $+functions[_jj__branch__rename_commands] )) ||
_jj__branch__rename_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch rename commands' commands "$@"
}
(( $+functions[_jj__git__help__remote__rename_commands] )) ||
_jj__git__help__remote__rename_commands() {
    local commands; commands=()
    _describe -t commands 'jj git help remote rename commands' commands "$@"
}
(( $+functions[_jj__git__remote__help__rename_commands] )) ||
_jj__git__remote__help__rename_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote help rename commands' commands "$@"
}
(( $+functions[_jj__git__remote__rename_commands] )) ||
_jj__git__remote__rename_commands() {
    local commands; commands=()
    _describe -t commands 'jj git remote rename commands' commands "$@"
}
(( $+functions[_jj__help__branch__rename_commands] )) ||
_jj__help__branch__rename_commands() {
    local commands; commands=()
    _describe -t commands 'jj help branch rename commands' commands "$@"
}
(( $+functions[_jj__help__git__remote__rename_commands] )) ||
_jj__help__git__remote__rename_commands() {
    local commands; commands=()
    _describe -t commands 'jj help git remote rename commands' commands "$@"
}
(( $+functions[_jj__help__sparse__reset_commands] )) ||
_jj__help__sparse__reset_commands() {
    local commands; commands=()
    _describe -t commands 'jj help sparse reset commands' commands "$@"
}
(( $+functions[_jj__sparse__help__reset_commands] )) ||
_jj__sparse__help__reset_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse help reset commands' commands "$@"
}
(( $+functions[_jj__sparse__reset_commands] )) ||
_jj__sparse__reset_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse reset commands' commands "$@"
}
(( $+functions[_jj__debug__help__watchman__reset-clock_commands] )) ||
_jj__debug__help__watchman__reset-clock_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help watchman reset-clock commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__help__reset-clock_commands] )) ||
_jj__debug__watchman__help__reset-clock_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman help reset-clock commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__reset-clock_commands] )) ||
_jj__debug__watchman__reset-clock_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman reset-clock commands' commands "$@"
}
(( $+functions[_jj__help__debug__watchman__reset-clock_commands] )) ||
_jj__help__debug__watchman__reset-clock_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug watchman reset-clock commands' commands "$@"
}
(( $+functions[_jj__help__resolve_commands] )) ||
_jj__help__resolve_commands() {
    local commands; commands=()
    _describe -t commands 'jj help resolve commands' commands "$@"
}
(( $+functions[_jj__resolve_commands] )) ||
_jj__resolve_commands() {
    local commands; commands=()
    _describe -t commands 'jj resolve commands' commands "$@"
}
(( $+functions[_jj__help__operation__restore_commands] )) ||
_jj__help__operation__restore_commands() {
    local commands; commands=()
    _describe -t commands 'jj help operation restore commands' commands "$@"
}
(( $+functions[_jj__help__restore_commands] )) ||
_jj__help__restore_commands() {
    local commands; commands=()
    _describe -t commands 'jj help restore commands' commands "$@"
}
(( $+functions[_jj__operation__help__restore_commands] )) ||
_jj__operation__help__restore_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation help restore commands' commands "$@"
}
(( $+functions[_jj__operation__restore_commands] )) ||
_jj__operation__restore_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation restore commands' commands "$@"
}
(( $+functions[_jj__restore_commands] )) ||
_jj__restore_commands() {
    local commands; commands=()
    _describe -t commands 'jj restore commands' commands "$@"
}
(( $+functions[_jj__help__revert_commands] )) ||
_jj__help__revert_commands() {
    local commands; commands=()
    _describe -t commands 'jj help revert commands' commands "$@"
}
(( $+functions[_jj__revert_commands] )) ||
_jj__revert_commands() {
    local commands; commands=()
    _describe -t commands 'jj revert commands' commands "$@"
}
(( $+functions[_jj__debug__help__revset_commands] )) ||
_jj__debug__help__revset_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help revset commands' commands "$@"
}
(( $+functions[_jj__debug__revset_commands] )) ||
_jj__debug__revset_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug revset commands' commands "$@"
}
(( $+functions[_jj__help__debug__revset_commands] )) ||
_jj__help__debug__revset_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug revset commands' commands "$@"
}
(( $+functions[_jj__help__root_commands] )) ||
_jj__help__root_commands() {
    local commands; commands=()
    _describe -t commands 'jj help root commands' commands "$@"
}
(( $+functions[_jj__help__workspace__root_commands] )) ||
_jj__help__workspace__root_commands() {
    local commands; commands=()
    _describe -t commands 'jj help workspace root commands' commands "$@"
}
(( $+functions[_jj__root_commands] )) ||
_jj__root_commands() {
    local commands; commands=()
    _describe -t commands 'jj root commands' commands "$@"
}
(( $+functions[_jj__workspace__help__root_commands] )) ||
_jj__workspace__help__root_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace help root commands' commands "$@"
}
(( $+functions[_jj__workspace__root_commands] )) ||
_jj__workspace__root_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace root commands' commands "$@"
}
(( $+functions[_jj__help__run_commands] )) ||
_jj__help__run_commands() {
    local commands; commands=()
    _describe -t commands 'jj help run commands' commands "$@"
}
(( $+functions[_jj__run_commands] )) ||
_jj__run_commands() {
    local commands; commands=()
    _describe -t commands 'jj run commands' commands "$@"
}
(( $+functions[_jj__branch__help__set_commands] )) ||
_jj__branch__help__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help set commands' commands "$@"
}
(( $+functions[_jj__branch__set_commands] )) ||
_jj__branch__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch set commands' commands "$@"
}
(( $+functions[_jj__config__help__set_commands] )) ||
_jj__config__help__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj config help set commands' commands "$@"
}
(( $+functions[_jj__config__set_commands] )) ||
_jj__config__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj config set commands' commands "$@"
}
(( $+functions[_jj__help__branch__set_commands] )) ||
_jj__help__branch__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj help branch set commands' commands "$@"
}
(( $+functions[_jj__help__config__set_commands] )) ||
_jj__help__config__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj help config set commands' commands "$@"
}
(( $+functions[_jj__help__sparse__set_commands] )) ||
_jj__help__sparse__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj help sparse set commands' commands "$@"
}
(( $+functions[_jj__sparse__help__set_commands] )) ||
_jj__sparse__help__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse help set commands' commands "$@"
}
(( $+functions[_jj__sparse__set_commands] )) ||
_jj__sparse__set_commands() {
    local commands; commands=()
    _describe -t commands 'jj sparse set commands' commands "$@"
}
(( $+functions[_jj__help__show_commands] )) ||
_jj__help__show_commands() {
    local commands; commands=()
    _describe -t commands 'jj help show commands' commands "$@"
}
(( $+functions[_jj__show_commands] )) ||
_jj__show_commands() {
    local commands; commands=()
    _describe -t commands 'jj show commands' commands "$@"
}
(( $+functions[_jj__help__sparse_commands] )) ||
_jj__help__sparse_commands() {
    local commands; commands=(
'list:List the patterns that are currently present in the working copy' \
'set:Update the patterns that are present in the working copy' \
'reset:Reset the patterns to include all files in the working copy' \
'edit:Start an editor to update the patterns that are present in the working copy' \
    )
    _describe -t commands 'jj help sparse commands' commands "$@"
}
(( $+functions[_jj__sparse_commands] )) ||
_jj__sparse_commands() {
    local commands; commands=(
'list:List the patterns that are currently present in the working copy' \
'set:Update the patterns that are present in the working copy' \
'reset:Reset the patterns to include all files in the working copy' \
'edit:Start an editor to update the patterns that are present in the working copy' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj sparse commands' commands "$@"
}
(( $+functions[_jj__help__split_commands] )) ||
_jj__help__split_commands() {
    local commands; commands=()
    _describe -t commands 'jj help split commands' commands "$@"
}
(( $+functions[_jj__split_commands] )) ||
_jj__split_commands() {
    local commands; commands=()
    _describe -t commands 'jj split commands' commands "$@"
}
(( $+functions[_jj__help__squash_commands] )) ||
_jj__help__squash_commands() {
    local commands; commands=()
    _describe -t commands 'jj help squash commands' commands "$@"
}
(( $+functions[_jj__squash_commands] )) ||
_jj__squash_commands() {
    local commands; commands=()
    _describe -t commands 'jj squash commands' commands "$@"
}
(( $+functions[_jj__debug__help__watchman__status_commands] )) ||
_jj__debug__help__watchman__status_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help watchman status commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__help__status_commands] )) ||
_jj__debug__watchman__help__status_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman help status commands' commands "$@"
}
(( $+functions[_jj__debug__watchman__status_commands] )) ||
_jj__debug__watchman__status_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug watchman status commands' commands "$@"
}
(( $+functions[_jj__help__debug__watchman__status_commands] )) ||
_jj__help__debug__watchman__status_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug watchman status commands' commands "$@"
}
(( $+functions[_jj__help__status_commands] )) ||
_jj__help__status_commands() {
    local commands; commands=()
    _describe -t commands 'jj help status commands' commands "$@"
}
(( $+functions[_jj__status_commands] )) ||
_jj__status_commands() {
    local commands; commands=()
    _describe -t commands 'jj status commands' commands "$@"
}
(( $+functions[_jj__git__help__submodule_commands] )) ||
_jj__git__help__submodule_commands() {
    local commands; commands=(
'print-gitmodules:Print the relevant contents from .gitmodules. For debugging purposes only' \
    )
    _describe -t commands 'jj git help submodule commands' commands "$@"
}
(( $+functions[_jj__git__submodule_commands] )) ||
_jj__git__submodule_commands() {
    local commands; commands=(
'print-gitmodules:Print the relevant contents from .gitmodules. For debugging purposes only' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj git submodule commands' commands "$@"
}
(( $+functions[_jj__help__git__submodule_commands] )) ||
_jj__help__git__submodule_commands() {
    local commands; commands=(
'print-gitmodules:Print the relevant contents from .gitmodules. For debugging purposes only' \
    )
    _describe -t commands 'jj help git submodule commands' commands "$@"
}
(( $+functions[_jj__help__tag_commands] )) ||
_jj__help__tag_commands() {
    local commands; commands=(
'list:List tags' \
    )
    _describe -t commands 'jj help tag commands' commands "$@"
}
(( $+functions[_jj__tag_commands] )) ||
_jj__tag_commands() {
    local commands; commands=(
'list:List tags' \
'l:List tags' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj tag commands' commands "$@"
}
(( $+functions[_jj__debug__help__template_commands] )) ||
_jj__debug__help__template_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help template commands' commands "$@"
}
(( $+functions[_jj__debug__template_commands] )) ||
_jj__debug__template_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug template commands' commands "$@"
}
(( $+functions[_jj__help__debug__template_commands] )) ||
_jj__help__debug__template_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug template commands' commands "$@"
}
(( $+functions[_jj__branch__help__track_commands] )) ||
_jj__branch__help__track_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help track commands' commands "$@"
}
(( $+functions[_jj__branch__track_commands] )) ||
_jj__branch__track_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch track commands' commands "$@"
}
(( $+functions[_jj__help__branch__track_commands] )) ||
_jj__help__branch__track_commands() {
    local commands; commands=()
    _describe -t commands 'jj help branch track commands' commands "$@"
}
(( $+functions[_jj__debug__help__tree_commands] )) ||
_jj__debug__help__tree_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help tree commands' commands "$@"
}
(( $+functions[_jj__debug__tree_commands] )) ||
_jj__debug__tree_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug tree commands' commands "$@"
}
(( $+functions[_jj__help__debug__tree_commands] )) ||
_jj__help__debug__tree_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug tree commands' commands "$@"
}
(( $+functions[_jj__help__operation__undo_commands] )) ||
_jj__help__operation__undo_commands() {
    local commands; commands=()
    _describe -t commands 'jj help operation undo commands' commands "$@"
}
(( $+functions[_jj__help__undo_commands] )) ||
_jj__help__undo_commands() {
    local commands; commands=()
    _describe -t commands 'jj help undo commands' commands "$@"
}
(( $+functions[_jj__operation__help__undo_commands] )) ||
_jj__operation__help__undo_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation help undo commands' commands "$@"
}
(( $+functions[_jj__operation__undo_commands] )) ||
_jj__operation__undo_commands() {
    local commands; commands=()
    _describe -t commands 'jj operation undo commands' commands "$@"
}
(( $+functions[_jj__undo_commands] )) ||
_jj__undo_commands() {
    local commands; commands=()
    _describe -t commands 'jj undo commands' commands "$@"
}
(( $+functions[_jj__help__unsquash_commands] )) ||
_jj__help__unsquash_commands() {
    local commands; commands=()
    _describe -t commands 'jj help unsquash commands' commands "$@"
}
(( $+functions[_jj__unsquash_commands] )) ||
_jj__unsquash_commands() {
    local commands; commands=()
    _describe -t commands 'jj unsquash commands' commands "$@"
}
(( $+functions[_jj__branch__help__untrack_commands] )) ||
_jj__branch__help__untrack_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch help untrack commands' commands "$@"
}
(( $+functions[_jj__branch__untrack_commands] )) ||
_jj__branch__untrack_commands() {
    local commands; commands=()
    _describe -t commands 'jj branch untrack commands' commands "$@"
}
(( $+functions[_jj__help__branch__untrack_commands] )) ||
_jj__help__branch__untrack_commands() {
    local commands; commands=()
    _describe -t commands 'jj help branch untrack commands' commands "$@"
}
(( $+functions[_jj__help__untrack_commands] )) ||
_jj__help__untrack_commands() {
    local commands; commands=()
    _describe -t commands 'jj help untrack commands' commands "$@"
}
(( $+functions[_jj__untrack_commands] )) ||
_jj__untrack_commands() {
    local commands; commands=()
    _describe -t commands 'jj untrack commands' commands "$@"
}
(( $+functions[_jj__help__workspace__update-stale_commands] )) ||
_jj__help__workspace__update-stale_commands() {
    local commands; commands=()
    _describe -t commands 'jj help workspace update-stale commands' commands "$@"
}
(( $+functions[_jj__workspace__help__update-stale_commands] )) ||
_jj__workspace__help__update-stale_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace help update-stale commands' commands "$@"
}
(( $+functions[_jj__workspace__update-stale_commands] )) ||
_jj__workspace__update-stale_commands() {
    local commands; commands=()
    _describe -t commands 'jj workspace update-stale commands' commands "$@"
}
(( $+functions[_jj__help__util_commands] )) ||
_jj__help__util_commands() {
    local commands; commands=(
'completion:Print a command-line-completion script' \
'gc:Run backend-dependent garbage collection' \
'mangen:Print a ROFF (manpage)' \
'markdown-help:Print the CLI help for all subcommands in Markdown' \
'config-schema:Print the JSON schema for the jj TOML config format' \
    )
    _describe -t commands 'jj help util commands' commands "$@"
}
(( $+functions[_jj__util_commands] )) ||
_jj__util_commands() {
    local commands; commands=(
'completion:Print a command-line-completion script' \
'gc:Run backend-dependent garbage collection' \
'mangen:Print a ROFF (manpage)' \
'markdown-help:Print the CLI help for all subcommands in Markdown' \
'config-schema:Print the JSON schema for the jj TOML config format' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj util commands' commands "$@"
}
(( $+functions[_jj__help__version_commands] )) ||
_jj__help__version_commands() {
    local commands; commands=()
    _describe -t commands 'jj help version commands' commands "$@"
}
(( $+functions[_jj__version_commands] )) ||
_jj__version_commands() {
    local commands; commands=()
    _describe -t commands 'jj version commands' commands "$@"
}
(( $+functions[_jj__debug__help__watchman_commands] )) ||
_jj__debug__help__watchman_commands() {
    local commands; commands=(
'status:Check whether \`watchman\` is enabled and whether it'\''s correctly installed' \
'query-clock:' \
'query-changed-files:' \
'reset-clock:' \
    )
    _describe -t commands 'jj debug help watchman commands' commands "$@"
}
(( $+functions[_jj__debug__watchman_commands] )) ||
_jj__debug__watchman_commands() {
    local commands; commands=(
'status:Check whether \`watchman\` is enabled and whether it'\''s correctly installed' \
'query-clock:' \
'query-changed-files:' \
'reset-clock:' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj debug watchman commands' commands "$@"
}
(( $+functions[_jj__help__debug__watchman_commands] )) ||
_jj__help__debug__watchman_commands() {
    local commands; commands=(
'status:Check whether \`watchman\` is enabled and whether it'\''s correctly installed' \
'query-clock:' \
'query-changed-files:' \
'reset-clock:' \
    )
    _describe -t commands 'jj help debug watchman commands' commands "$@"
}
(( $+functions[_jj__debug__help__workingcopy_commands] )) ||
_jj__debug__help__workingcopy_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug help workingcopy commands' commands "$@"
}
(( $+functions[_jj__debug__workingcopy_commands] )) ||
_jj__debug__workingcopy_commands() {
    local commands; commands=()
    _describe -t commands 'jj debug workingcopy commands' commands "$@"
}
(( $+functions[_jj__help__debug__workingcopy_commands] )) ||
_jj__help__debug__workingcopy_commands() {
    local commands; commands=()
    _describe -t commands 'jj help debug workingcopy commands' commands "$@"
}
(( $+functions[_jj__help__workspace_commands] )) ||
_jj__help__workspace_commands() {
    local commands; commands=(
'add:Add a workspace' \
'forget:Stop tracking a workspace'\''s working-copy commit in the repo' \
'list:List workspaces' \
'root:Show the current workspace root directory' \
'update-stale:Update a workspace that has become stale' \
    )
    _describe -t commands 'jj help workspace commands' commands "$@"
}
(( $+functions[_jj__workspace_commands] )) ||
_jj__workspace_commands() {
    local commands; commands=(
'add:Add a workspace' \
'forget:Stop tracking a workspace'\''s working-copy commit in the repo' \
'list:List workspaces' \
'root:Show the current workspace root directory' \
'update-stale:Update a workspace that has become stale' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'jj workspace commands' commands "$@"
}

if [ "$funcstack[1]" = "_jj" ]; then
    _jj "$@"
else
    compdef _jj jj
fi
