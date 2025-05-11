set PATH $PATH "/usr/local/bin"
set PATH $PATH "/usr/local/nvim/bin"
set PATH $PATH "$HOME/.local/bin"
set PATH $PATH "$HOME/scripts"
set PATH $PATH "$HOME/.cargo/bin"
set PATH $PATH /nix/var/nix/profiles/default/bin/
set PATH $PATH "$HOME/.nix-profile/bin"

source $HOME/.config/fish/alias.fish

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

zoxide init fish | source

if status is-interactive
and not set -q TMUX
    exec tmux
end
