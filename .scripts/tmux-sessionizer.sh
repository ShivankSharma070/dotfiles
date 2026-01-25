#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/OneDrive ~/.config ~/.scripts ~/Documents \( -name ".git" -o -name "node_modules" -o -name ".next" \) -prune  -o -type d -print | fzf)
fi

[[ -z $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)

# If session does NOT exist, create it (detached if inside tmux)
if ! tmux has-session -t "$selected_name" 2> /dev/null; then
    if [[ -z $TMUX ]]; then
        tmux new-session -ds "$selected_name" -c "$selected"
    else
        tmux new-session -ds "$selected_name" -c "$selected"
    fi
fi

# Now decide: attach or switch
if [[ -z $TMUX ]]; then
    # Outside tmux → attach
    tmux attach-session -t "$selected_name"
else
    # Inside tmux → switch
    tmux switch-client -t "$selected_name"
fi
