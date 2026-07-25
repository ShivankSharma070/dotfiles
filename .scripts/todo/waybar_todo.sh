#!/bin/bash
TODO_FILE="$HOME/.scripts/todo/todo.md"
mkdir -p "$HOME/.scripts/todo"
[[ -f "$TODO_FILE" ]] || touch "$TODO_FILE"

case "$1" in
    mark_done)
        sed -i '0,/- \[ \]/ s/- \[ \]/- [x]/' "$TODO_FILE"
        exit 0
        ;;
    middle_click)
        sed -i '/- \[x\]/d' "$TODO_FILE"
        exit 0
        ;;
esac

current_task_line=$(grep '^- \[ \]' "$TODO_FILE" | head -n 1)

if [[ ! -s "$TODO_FILE" ]]; then
    bar_text="Add a task!"
    tooltip="Right-click to add a new task"
else
    if [[ -n "$current_task_line" ]]; then
        full_bar_text="${current_task_line#- \[ \] }"
        if (( ${#full_bar_text} > 20 )); then
            bar_text="$(echo "$full_bar_text" | cut -c1-17)..."
        else
            bar_text="$full_bar_text"
        fi
    else
        bar_text="✔ All Done!"
    fi

    tooltip="<b><u>Todo List\n</u></b>\n"
    pending_tasks=""
    completed_tasks=""

    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ "$line" == "- [ ] "* ]]; then
            desc="${line#- \[ \] }"
            pending_tasks+="$desc\n"
        elif [[ "$line" == "- [x] "* ]]; then
            desc="${line#- \[x\] }"
            completed_tasks+="<s>$desc</s>\n"
        fi
    done < "$TODO_FILE"

    tooltip+="$pending_tasks"
    tooltip+="$completed_tasks"

    if [[ -n "$current_task_line" ]]; then
        tooltip+="\n<b>Current task:</b> $full_bar_text"
    else
        tooltip+="\n<b>All tasks cleared. Great job!</b>"
    fi
fi

bar_text_json=$(echo -e "\u00a0\u00a0$bar_text" | sed 's/"/\\"/g')
tooltip_json=$(echo -e "$tooltip" | sed 's/"/\\"/g' | sed ':a;N;$!ba;s/\n/\\n/g')
printf '{"text": "%s", "tooltip": "%s"}\n' "$bar_text_json" "$tooltip_json"
