#!/bin/bash
   current=$(hyprctl getoption scrolling:focus_fit_method -j | jq '.int')
   if [ "$current" -eq 1 ]; then
       hyprctl keyword scrolling:focus_fit_method 0
   else
       hyprctl keyword scrolling:focus_fit_method 1
   fi
