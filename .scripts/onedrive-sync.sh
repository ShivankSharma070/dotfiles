#!/bin/bash
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

notify-send "OneDrive Syncing"
onedrive --sync --upload-only>> /home/shivank/onedrive-sync.log 2>&1
