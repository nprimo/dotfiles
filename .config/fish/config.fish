set PATH $PATH "/usr/local/bin"
set PATH $PATH "$HOME/.local/bin"
set PATH $PATH "$HOME/scripts/"
set PATH $PATH "$HOME/.cargo/bin"
set PATH $PATH /nix/var/nix/profiles/default/bin/
set PATH $PATH "$HOME/.bin/zig-linux-x86_64-0.14.0-dev.3222+8a3aebaee/"

source $HOME/.config/fish/alias.fish
source $HOME/.config/fish/asdf.fish

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

zoxide init fish | source
