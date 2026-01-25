#!/bin/bash

# Stop swayidle and fake-lock-screen.py processes

# Kill swayidle
if pgrep -x swayidle > /dev/null; then
    pids=$(pgrep -x swayidle)
    for pid in $pids; do
        kill -TERM "$pid"
        echo "Terminated swayidle (PID: $pid)"
    done
else
    echo "No swayidle process found"
fi

# Kill fake_lock_hyprland.py
if pgrep -f "fake-lock-screen" > /dev/null; then
    pids=$(pgrep -f "fake-lock-screen")
    for pid in $pids; do
        kill -TERM "$pid"
        echo "Terminated fake-lock-screen.py (PID: $pid)"
        cp ~/.config/hypr/configs/keybinds.conf.bak ~/.config/hypr/configs/keybinds.conf
    done
else
    echo "No fake-lock-screen.py process found"
fi

# Wait briefly and check if processes are still running
sleep 1
if pgrep -x swayidle > /dev/null || pgrep -f "fake-lock-screen" > /dev/null; then
    echo "Warning: Some processes may not have terminated. Trying SIGKILL..."
    pgrep -x swayidle | xargs -r kill -KILL
    pgrep -f "fake-lock-screen" | xargs -r kill -KILL
    echo "Sent SIGKILL to remaining processes"
    cp ~/.config/hypr/configs/keybinds.conf.bak ~/.config/hypr/configs/keybinds.conf
else
    echo "All processes terminated successfully"
fi
