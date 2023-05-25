# Vim
alias   v="nvim"
alias   vim="nvim"

# Git
alias   gc!="git commit --amend"
alias   gst="git status"
alias   glg='git log --stat'

# Move around
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'

# Not an alias but almost...
function cd () {
    if [[ $# -ne 1 ]] 
    then
        builtin cd "$HOME"
    fi
    builtin cd "$1"
    ls -ACF
}

# Docker
alias dclean="~/script/docker_clean.sh"
