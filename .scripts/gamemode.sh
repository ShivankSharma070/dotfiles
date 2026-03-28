# !/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 1;\
        keyword general:gaps_in 2;\
        keyword general:gaps_out 3;\
        keyword general:border_size 0; \
        keyword decoration:rounding 5"
    exit
fi
 hyprctl reload
