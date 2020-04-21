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

esac && paplay $HOME/.config/i3/other_files/volume_change.ogg

# Get count of "dwmbar" processes running. If count is 1 then kill sleep
# subprocess within it. If count is more than 1, kill all instances (if any)
# and start a new process.
{ [ $(pgrep -c dwmbar) = "1" ] && pkill -P $(pgrep dwmbar) sleep; } || { pkill dwmbar; dwmbar; }
