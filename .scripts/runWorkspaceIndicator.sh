#!/bin/sh

export LD_PRELOAD=/usr/lib/libgtk4-layer-shell.so 

case $1 in 
    niri)
        exec python /home/shivank/.scripts/workspace-indicator-niri.py
    ;;
    hypr)
        exec python /home/shivank/.scripts/workspace-indicator-hypr.py
    ;;
    mango)
        exec python /home/shivank/.scripts/workspace-indicator-mango.py
    ;;
esac
