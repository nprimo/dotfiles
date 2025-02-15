# Vim
alias v="nvim"

# Git
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -v"
alias gc!="git commit --amend"
alias gco="git checkout"
alias gd="git diff"
alias gst="git status"
alias glg="git log --stat"
alias glo="git log --oneline"
alias fglo="git log --oneline --decorate | fzf --preview 'git show --name-only {1}'"
alias gp="git push"
alias grs="git restore"
alias glc="git rev-parse --short HEAD"

# Move around
alias ..="cd ..;pwd"
alias ...="cd ../..;pwd"
alias ....="cd ../../..;pwd"

# Rm - avoid deleting for ever
alias rm="trash-put"

function fh 
	history | cut -c 8- | uniq | fzf
end
