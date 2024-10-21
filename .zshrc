# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function append_to_path() {
    export PATH=$PATH:$1
}

append_to_path "/usr/local/bin"
append_to_path "$HOME/.local/bin"
append_to_path "$HOME/scripts/"

# --- asdf 
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# for go
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Change directory color
LS_COLORS='di=01;33'

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
