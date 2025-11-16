#!/usr/bin/env bash
## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Quick Links

# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"


prompt="Bookmarks"
mesg="Open files in emacs"

if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-3'* ) || ( "$theme" == *'type-5'* ) ]]; then
	list_col='1'
	list_row='7'
elif [[ ( "$theme" == *'type-2'* ) || ( "$theme" == *'type-4'* ) ]]; then
	list_col='7'
	list_row='1'
fi

if [[ ( "$theme" == *'type-1'* ) || ( "$theme" == *'type-5'* ) ]]; then
	efonts="JetBrains Mono Nerd Font 10"
else
	efonts="JetBrains Mono Nerd Font 28"
fi

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Qtile"
	option_2=" Rofi"
	option_3=" Doom Config"
	option_4=" Doom Init"
	option_5=" Fish"
	option_6=" Autostart"
	option_7=" Alacritty"
else
	option_1=""
	option_2=""
	option_3=""
	option_4=""
	option_5=""
	option_6=""
	option_7=""
fi



# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-theme-str "element-text {font: \"$efonts\";}" \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}
# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3\n$option_4\n$option_5\n$option_6\n$option_7" | rofi_cmd
}
# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		emacsclient -c -a 'emacs' "$HOME/.config/qtile/README.org"
	elif [[ "$1" == '--opt2' ]]; then
		emacsclient -c -a 'emacs' "$HOME/.config/rofi/launchers/type-2/launcher.sh"
	elif [[ "$1" == '--opt3' ]]; then
		emacsclient -c -a 'emacs' "$HOME/.config/doom/config.org"
	elif [[ "$1" == '--opt4' ]]; then
		emacsclient -c -a 'emacs' "$HOME/.config/doom/init.el"
	elif [[ "$1" == '--opt5' ]]; then
		emacsclient -c -a 'emacs' "$HOME/.config/fish/config.fish"
	elif [[ "$1" == '--opt6' ]]; then
		emacsclient -c -a 'emacs' "$HOME/.config/qtile/autostart.sh"
    elif [[ "$1" == '--opt7' ]]; then
		emacsclient -c -a 'emacs' "$HOME/.config/alacritty/alacritty.toml"
	fi
}


# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
    $option_4)
		run_cmd --opt4
        ;;
    $option_5)
		run_cmd --opt5
        ;;
    $option_6)
		run_cmd --opt6
        ;;
    $option_7)
		run_cmd --opt7
        ;;
esac
