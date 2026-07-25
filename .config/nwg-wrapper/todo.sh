#!/bin/bash
while IFS= read -r line; do
  if [[ "$line" == "- [x]"* ]]; then
    task="${line#- [x] }"
    echo "<span foreground='#6c7086' strikethrough='true'>✓ $task</span>"
  elif [[ "$line" == "- [ ]"* ]]; then
    task="${line#- [ ] }"
    echo "<span foreground='#cdd6f4'>○ $task</span>"
  elif [[ "$line" == "# "* ]]; then
    heading="${line#\# }"
    echo "<span foreground='#cba6f7' weight='bold' size='large'>$heading</span>"
  fi
done < ~/.config/nwg-wrapper/todo.md
