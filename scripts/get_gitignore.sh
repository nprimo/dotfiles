#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "run script with 1 argument"
    exit 1
fi

lang=$1
BASE_URL="https://raw.githubusercontent.com/github/gitignore/main/"

get_github_gitignore_path() {
    lang=$1
    github_gitignore_url="https://api.github.com/repos/github/gitignore/contents/"

    path=$(curl -sL \
        -H "Accept: application/vnd.github+json"\
        -H "X-GitHub-Api-Version: 2022-11-28" $github_gitignore_url |\
        jq '.[] | .path' | grep -i $lang | sed 's:"::g')
    echo $path
}

filepath=$(get_github_gitignore_path $lang)
if [[ -z $filepath ]]; then
    echo "cannot find a .gitignore for <$1>"
    exit 1
fi

if [[ -f ".gitignore" ]]; then
    echo "Moving current .gitgnore to .gitignore.old"
    mv .gitignore .gitignore.old
fi

curl -s $BASE_URL$filepath > .gitignore
