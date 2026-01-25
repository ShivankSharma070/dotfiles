#!/usr/bin/env sh

spotifyrunning=$(pgrep -x "spotify")
if  [[ -z $spotifyrunning ]] then
    playerctl play-pause
else
    playerctl -p spotify play-pause
fi



