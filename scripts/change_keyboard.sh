#!/usr/bin/env bash

CURRENT=$(setxkbmap -query | grep layout | awk '{print $NF}')

case ${CURRENT} in 
    'us')
        setxkbmap pt 
        echo "to PT"
        ;;
    'pt')
        setxkbmap us
        echo "to US"
        ;;
    *)
        echo "is ${CURRENT}"
        setxkbmap pt 
        ;;
esac
