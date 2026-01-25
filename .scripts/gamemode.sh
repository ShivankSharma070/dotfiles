# !/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption decoration:shadow:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 0 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 1;\
        keyword decoration:shadow:enabled 1;\
        keyword decoration:blur:enabled 1;\
        keyword general:gaps_in 4;\
        keyword general:gaps_out 4;\
        keyword general:border_size 2; \
        keyword decoration:rounding 4"
    exit
fi
 hyprctl reload
