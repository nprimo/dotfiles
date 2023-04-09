# Git
alias   gs="git status"   
alias   gca="git commit --amend"

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
