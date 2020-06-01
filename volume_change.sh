#!/bin/sh

amixer get Master | tail -1 | grep -w '\[on\]' >/dev/null &&
    STATE="on" || STATE="off"

case $1 in

# Toggle Mute.
    -t)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;

# Increase volume
    -i)
    [ "$STATE" = "off" ] && pactl set-sink-mute @DEFAULT_SINK@ toggle
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;

# Decrease volume.
    -d)
    [ "$STATE" = "off" ] && pactl set-sink-mute @DEFAULT_SINK@ toggle
        pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;

# Mute Mic.
    -mm)
        pactl set-source-mute 1 toggle
        ;;

esac && paplay $HOME/.local/share/supplements/volume_change.ogg

restartbar.sh
