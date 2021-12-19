#!/bin/sh

amixer get Master | tail -1 | grep -w '\[on\]' >/dev/null &&
    STATE="on" || STATE="off"

case $1 in

# Toggle Mute.
    -t)
        amixer -D pulse set Master toggle &&
            echo "Toggle Mute."
        ;;

# Increase volume
    -i)
    [ "$STATE" = "off" ] && amixer -D pulse set Master toggle
        amixer -D pulse set Master 5%+ &&
            echo "Increasing volume."
        ;;

# Decrease volume.
    -d)
    [ "$STATE" = "off" ] && amixer -D pulse set Master toggle
        amixer -D pulse set Master 5%- &&
            echo "Decreasing volume."
    ;;

# Mute Mic.
    -mm)
        amixer set Capture toggle &&
            echo "Muting mic."
        ;;

    *)
        echo "Invalid option."
        exit 1

esac && paplay $HOME/.local/share/supplements/volume_change.ogg &

restartbar.sh &
