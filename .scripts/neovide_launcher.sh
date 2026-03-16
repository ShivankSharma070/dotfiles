#!/usr/bin/env bash

dirToOpen=$(find ~/OneDrive ~/.config ~/OneDrive/dotfiles/ \( -path ~/OneDrive/config -o -name ".git" -o -name "node_modules" -o -name ".next" \) -prune -o -type d -print | rofi -dmenu -i -p Open -theme ~/.config/rofi/config-dmenu.rasi)

[ -z "$dirToOpen" ] && exit 0

cd "$dirToOpen" && neovide "$dirToOpen"
