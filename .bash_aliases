# Vim
alias   v="nvim"

# Git
alias   gc!="git commit --amend"
alias   gst="git status"
alias   glg="git log --stat"
alias   fglo="git log --oneline --decorate | fzf --preview 'git show --name-only {1}'"

# Move around
alias ..="cd ..;pwd"
alias ...="cd ../..;pwd"
alias ....="cd ../../..;pwd"

# Not an alias but almost...
function cd () {
    if [[ $# -ne 1 ]] 
    then
        builtin cd "$HOME"
    fi
    builtin cd "$1"
    ls -ACF
}

function get_gitignore() {
    if [[ $# -eq 1 ]]; then
        ~/scripts/get_gitignore.sh $1
    fi
}

function ww() {
    watch -c -n 1 "script -q -c '$@' /dev/null"
}

function rhistory() {
     history | cut -c 8- | uniq | fzf 
}


# fzf function from repo example
# fd - cd to selected directory
function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

function fv() {
  local file
  file=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type f -print 2> /dev/null | fzf +m) &&
  nvim "$file"
}

# fh - repeat history
function fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# Livebook - Jupyter Notebook for Elixir
function livebook() {
  docker run -p 8080:8080 -p 8081:8081 --pull always -u $(id -u):$(id -g) -v $(pwd):/data ghcr.io/livebook-dev/livebook
}

# Docker
alias docker-clean="~/scripts/docker_clean.sh"

# General
alias rescue-touchpad="sudo modprobe -r psmouse && sudo modprobe psmouse"
alias change-keyboard="~/scripts/change_keyboard.sh"

# Screen related
alias nightlight="xrandr --output eDP-1 --gamma 1.0:0.88:0.5 --brightness 0.7"
alias daylight="xrandr --output eDP-1 --gamma 1:1:1 --brightness 1"
alias dualscreen="xrandr --auto --output eDP-1 --mode 1600x900 --left-of HDMI-1"

function set-brightness() {
    ~/script/set_brightness.sh $@
}
