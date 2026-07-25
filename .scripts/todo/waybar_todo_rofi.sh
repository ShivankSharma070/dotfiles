#!/bin/bash
TODO_DIR="$HOME/.scripts/todo"
TODO_FILE="$TODO_DIR/todo.md"
THEME="$HOME/.config/waybar/scripts/rofi/theme.rasi"

mkdir -p "$TODO_DIR"
[[ -f "$TODO_FILE" ]] || touch "$TODO_FILE"

MENU="[-] Clear Completed\n[x] Clear All\n"
while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ "$line" == "- [x] "* ]]; then
        desc="${line#- \[x\] }"
        MENU+="✔ $desc\n"
    elif [[ "$line" == "- [ ] "* ]]; then
        desc="${line#- \[ \] }"
        MENU+="  $desc\n"
    fi
done < "$TODO_FILE"

CHOICE=$(echo -e "$MENU" | rofi -dmenu -i -p "Tasks" -theme "$THEME")

if [[ -z "$CHOICE" ]]; then
    exit 0
fi

if [[ "$CHOICE" == "[-] Clear Completed" ]]; then
    sed -i '/- \[x\]/d' "$TODO_FILE"
elif [[ "$CHOICE" == "[x] Clear All" ]]; then
    > "$TODO_FILE"
else
    # Check if choice is an existing task
    if [[ "$CHOICE" == ✔* ]] || [[ "$CHOICE" == "  "* ]]; then
        desc_clean="${CHOICE:2}"
        ACTION=$(echo -e "  Toggle Status\n  Delete Task" | rofi -dmenu -i -p "Action" -theme "$THEME")
        
        escaped_desc=$(printf '%s\n' "$desc_clean" | sed 's/[[\.*^$]/\\&/g')

        if [[ "$ACTION" == *"Toggle Status"* ]]; then
            if grep -q "^- \[ \] $escaped_desc$" "$TODO_FILE"; then
                sed -i "s/^- \[ \] $escaped_desc$/- [x] $desc_clean/" "$TODO_FILE"
            elif grep -q "^- \[x\] $escaped_desc$" "$TODO_FILE"; then
                sed -i "s/^- \[x\] $escaped_desc$/- [ ] $desc_clean/" "$TODO_FILE"
            fi
        elif [[ "$ACTION" == *"Delete Task"* ]]; then
            sed -i "/^- \[.\] $escaped_desc$/d" "$TODO_FILE"
        fi
    else
        # If text is entered that is not an option, create it!
        echo "- [ ] $CHOICE" >> "$TODO_FILE"
    fi
fi
