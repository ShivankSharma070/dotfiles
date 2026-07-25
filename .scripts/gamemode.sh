# !/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = true ] ; then
    hyprctl eval 'hl.config({ 
    animations = {enabled = false}, 
    decoration = { 
        shadow = {enabled = false}, 
        blur = {enabled = false}, 
        rounding         = 5,
    }, 
    general = {
        gaps_in         = 2,
        gaps_out        = 3,
        border_size     = 0,
    },
    })'
    exit
fi
 hyprctl reload
