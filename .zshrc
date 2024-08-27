function append_to_path() {
    export PATH=$PATH:$1
}

append_to_path "/usr/local/bin"
append_to_path "$HOME/.local/bin"
append_to_path "$HOME/scripts/"

# asdf 
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Change directory color
LS_COLORS='di=01;33'

## Start tmux at every shell login
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach || tmux new -s playground>/dev/null 2>&1
fi

if [[ -f "$HOME/.bash_aliases" ]]; then
    . "$HOME/.bash_aliases"
fi

# Enable autocompletion
for f in $(find /etc/bash_completion.d/ -type f,l); do
    source $f 2> /dev/null
done

# Custom completion
for f in ~/completion.d/*; do
    source $f
done

# Zoxide init
[[ $commands[zoxide] ]] && eval "$(zoxide init zsh)"
