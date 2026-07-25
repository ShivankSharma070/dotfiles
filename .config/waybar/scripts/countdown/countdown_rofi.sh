#!/bin/bash
DATA_FILE="$HOME/.config/waybar/scripts/countdown/countdowns.txt"
THEME="$HOME/.config/waybar/scripts/rofi/theme.rasi"

mkdir -p "$(dirname "$DATA_FILE")"
touch "$DATA_FILE"

MENU="[+] Add New Countdown\n"

while IFS=';' read -r label start end format || [[ -n "$label" ]]; do
    if [[ -z "$label" ]]; then continue; fi
    MENU+="  $label ($end)\n"
done < "$DATA_FILE"

CHOICE=$(echo -e "$MENU" | rofi -dmenu -i -p "Countdowns" -theme "$THEME")

if [[ -z "$CHOICE" ]]; then
    exit 0
fi

if [[ "$CHOICE" == "[+] Add New Countdown" ]]; then
    LABEL=$(echo "" | rofi -dmenu -p "Label" -theme "$THEME" -lines 0)
    [[ -z "$LABEL" ]] && exit 0
    
    START_DATE=$(echo "" | rofi -dmenu -p "Start [Def=$(date +%Y-%m-%d)]" -theme "$THEME" -lines 0)
    [[ -z "$START_DATE" ]] && START_DATE="$(date +%Y-%m-%d)"
    
    END_DATE=$(echo "" | rofi -dmenu -p "End (YYYY-MM-DD)" -theme "$THEME" -lines 0)
    [[ -z "$END_DATE" ]] && exit 0
    
    FORMAT=$(echo -e "days\npercentage" | rofi -dmenu -i -p "Format" -theme "$THEME" -lines 2)
    [[ -z "$FORMAT" ]] && exit 0

    echo "$LABEL;$START_DATE;$END_DATE;$FORMAT" >> "$DATA_FILE"
else
    # Extract the label properly
    # "  LABEL (END_DATE)" -> "LABEL"
    label_clean=$(echo "$CHOICE" | sed -E 's/^  //' | rev | cut -d'(' -f2- | rev | sed 's/ $//')

    ACTION=$(echo -e "  Delete Countdown" | rofi -dmenu -i -p "Action" -theme "$THEME")
    
    if [[ "$ACTION" == *"Delete"* ]]; then
        escaped_lbl=$(sed 's/[&/\]/\\&/g' <<< "$label_clean")
        sed -i "/^${escaped_lbl};/d" "$DATA_FILE"
    fi
fi
