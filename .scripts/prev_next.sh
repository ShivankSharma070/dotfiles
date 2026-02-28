#!/usr/bin/env sh

spotifyrunning=$(pgrep -x "spotify")
case $1 in 
    next)
        if  [[ -z $spotifyrunning ]] then
            playerctl position 5+
        else
            playerctl -p spotify next
        fi
    ;;
    prev) 
        if  [[ -z $spotifyrunning ]] then
            playerctl position 5-
        else
            playerctl -p spotify previous
        fi
    ;;
esac
