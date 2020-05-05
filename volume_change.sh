#!/bin/sh

case $1 in

# Toggle Mute.
    -t)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;

# Increase volume
    -i)
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;

# Decrease volume.
    -d)
        pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;

# Mute Mic.
    -mm)
        pactl set-source-mute 1 toggle
        ;;

esac && paplay $HOME/.local/share/supplements/volume_change.ogg

restartbar.sh
