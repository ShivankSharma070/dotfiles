#!/bin/bash

while true ; do
    echo "running now ..."
  if [[ $(playerctl -p firefox status  2>/dev/null) = "Playing" ]]; then
    playerctl -p spotify pause &>/dev/null
    else
    playerctl -p spotify play &>/dev/null
  fi
  sleep 2
done
