#!/bin/sh

amixer get Master | tail -1 | grep -w '\[on\]' >/dev/null &&
    STATE="on" || STATE="off"

case $1 in

# Toggle Mute.
    -t)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        echo "Toggle Mute."
        ;;

# Increase volume
    -i)
    [ "$STATE" = "off" ] && pactl set-sink-mute @DEFAULT_SINK@ toggle
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        echo "Increasing volume."
        ;;

# Decrease volume.
    -d)
    [ "$STATE" = "off" ] && pactl set-sink-mute @DEFAULT_SINK@ toggle
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        echo "Decreasing volume."
    ;;

# Mute Mic.
    -mm)
        pactl set-source-mute 1 toggle
        echo "Muting mic."
        ;;

    *)
        echo "Invalid option."
        exit 1

esac && paplay $HOME/.local/share/supplements/volume_change.ogg &

restartbar.sh &
