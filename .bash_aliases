#!/usr/bin/env bash

# Vim
alias v="nvim"

# Git
alias gc!="git commit --amend"
alias gst="git status"
alias glg="git log --stat"
alias fglo="git log --oneline --decorate | fzf --preview 'git show --name-only {1}'"

# Move around
alias ..="cd ..;pwd"
alias ...="cd ../..;pwd"
alias ....="cd ../../..;pwd"

# Rm
alias rm="trash-put"

# Not an alias but almost...
function cd() {
	if [[ $# -ne 1 ]]; then
		builtin cd "$HOME"
	fi
	builtin cd "$1" && ls -ACF
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
	dir=$(find "${1:-.}" -path '*/\.*' -prune \
		-o -type d -print 2>/dev/null | fzf +m) &&
		cd "$dir"
}

# fh - repeat history
function fh() {
	print -z "$( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac |
		sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')"
}

# [f]zf [g]it [b]ranch  - change branch
function fgb() {
	git checkout $(git branch | fzf)
}

# Livebook - Jupyter Notebook for Elixir
function livebook() {
	docker run -p 8080:8080 -p 8081:8081 --pull always -u "$(id -u)":"$(id -g)" -v "$(pwd)":/data ghcr.io/livebook-dev/livebook
}

function set-brightness() {
	~/script/set_brightness.sh "$@"
}

# Exec command whenever something change locally
function hot-exec() {
	while inotifywait -e close_write ./**; do
		"$@"
	done
}

# Dev utils
function run-dev-db() {
	docker system prune -f
	docker run --name dev-db -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
}

# Note taking
# INFO: the full path might change depending on where is my "dump dir"
alias new-note="/home/nprimo/nprimo-dump/utils/new-note.sh"
alias dump="/home/nprimo/nprimo-dump/utils/dump.sh"

# General survival
alias rescue-touchpad="sudo modprobe -r psmouse && sudo modprobe psmouse"

# 01 script
alias test-with-container="bash ~/01/gist/test_with_container/test_with_container.sh"
