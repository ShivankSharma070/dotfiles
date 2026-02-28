#!/usr/bin/env sh

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-2'

dirToOpen=$(find ~/OneDrive ~/.config ~/dotfiles/.config ~/.scripts ~/Documents \( -path ~/OneDrive/config -o -name ".git" -o -name "node_modules" -o -name ".next" \) -prune  -o -type d -print | rofi -dmenu -i -p Open -theme ${dir}/${theme}.rasi )

if [[  -z $dirToOpen ]]; then
    echo "None selected"
    exit 1
fi

cd "$dirToOpen" && neovide "$dirToOpen"
