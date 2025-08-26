#!/usr/bin/env bash

colour_file="$HOME/.cache/wal/colors.sh"
config="~/.config/dunst/dunstrc"

if [[ -f $colour_file ]]
then
    source $colour_file
    pidof dunst && killall dunst

    txt=$color7
    bg=$color0

    low=$color4
    normal=$color3
    urgent=$color2

#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
# 
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
# 
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.


    dunst --config $config \
        -lf  "$txt" \
        -lb  "$bg" \
        -lfr "$low" \
        -nf  "$txt" \
        -nb  "$bg" \
        -nfr "$normal" \
        -cf  "$txt" \
        -cb  "$bg" \
        -cfr "$urgent" > /dev/null 2>&1 &

    else
        echo "Oops, I think something went wrong. I can't find $color_file"
    fi
