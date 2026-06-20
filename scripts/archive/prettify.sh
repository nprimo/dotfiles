#!/usr/bin/env bash 

IFS='
'

if [[ $# -lt 1 ]]; then
    echo "Run $0 with one or more aguments"
    exit 1
fi

format () {
    # assume prettier is installed 
    npx prettier -w "$1"
    # From H1 to H2 (only .md files)
    if [[ "$1" =~ .*\.md$ ]]; then
        sed -i 's:^# :## :' "$1"
    fi
}

for file in $@; do 
    if [[ !(-f $file) ]]; then 
       continue 
     fi
     format "$file"
done
