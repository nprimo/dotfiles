#!/usr/bin/env bash 

if [[ $(docker images | grep none) ]]; then
    docker rmi $(docker images | grep \<none\> | awk '{print $3}')
else
    echo "No images with <none> tag"
fi
