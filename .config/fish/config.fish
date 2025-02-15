set PATH $PATH "/usr/local/bin"
set PATH $PATH "$HOME/.local/bin"
set PATH $PATH "$HOME/scripts/"
set PATH $PATH "$HOME/.cargo/bin"

source $HOME/.config/fish/alias.fish
source $HOME/.config/fish/asdf.fish

function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

zoxide init fish | source
