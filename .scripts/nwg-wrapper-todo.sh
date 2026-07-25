#!/usr/bin/env bash

NWG_PID=""

# Function to clean up on exit
cleanup() {
    if [[ -n "$NWG_PID" ]]; then
        kill "$NWG_PID" 2>/dev/null
    fi
    # Also blindly kill any stragglers from previous bad runs
    pkill -f "nwg-wrapper -s .*nwg_todo.sh" 2>/dev/null
    exit 0
}

# Trap termination signals
trap cleanup SIGINT SIGTERM

# Kill any existing instances first from before we added PID tracking
pkill -f "nwg-wrapper -s .*nwg_todo.sh" 2>/dev/null

while true; do
    # Check if the output of the todo script actually has any viewable content
    OUTPUT=$(bash "$HOME/.scripts/todo/nwg_todo.sh" | tr -d ' \n\r')
    
    if [[ -n "$OUTPUT" ]]; then
        # If output exists and nwg-wrapper is NOT recorded running
        if [[ -z "$NWG_PID" ]] || ! kill -0 "$NWG_PID" 2>/dev/null; then
            nwg-wrapper -s "$HOME/.scripts/todo/nwg_todo.sh" -c "$HOME/.scripts/todo/nwg_todo.css" -p right -mr 10 -mt 10 -a start -r 2000 -l 1 &
            NWG_PID=$!
        fi
    else
        # If output is completely empty, kill the active wrapper process
        if [[ -n "$NWG_PID" ]] && kill -0 "$NWG_PID" 2>/dev/null; then
            kill "$NWG_PID" 2>/dev/null
            NWG_PID=""
        fi
    fi
    # Only need to poll every few seconds
    sleep 2
done
