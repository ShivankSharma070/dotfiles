#!/bin/bash


# Wayland / GUI environment variables for cron
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export WAYLAND_DISPLAY="wayland-1"
export SWWW_TRANSITION=none

#setting wallpaper
wallpaperFolder="/usr/share/backgrounds/"
echo "Finding a random wallpaper..."
fileName=$(find $wallpaperFolder -type f | shuf -n 1 | awk '{print $NF}' )
if ! [ -z $1 ]; then
    fileName=$wallpaperFolder$1
fi
echo "$fileName"
pid=$(pidof swww-daemon)

if [ -z $pid ] ; then
    echo "Trying to start daemon.."
    swww-daemon 
    sleep 2
else
    echo "Daemon already running... "
fi

echo "Setting wallpaper..."
echo "$fileName"
swww  img "$fileName"

# echo "Generating theme..."
# wal -i $fileName -nts
#
# echo "Restarting waybar..."
# sleep 2
# killall waybar >/dev/null && waybar
#
# # kill -SIGUSR1 $(pgrep kitty)
# pkill -USR1 -f kitty
