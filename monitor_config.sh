#!/bin/sh

xrandr --auto

case "$1" in

    -dup)
        # Duplicate monitors.
        xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output DP2 --off &&
            echo "Duplicating two monitors."
        ;;

    -two)
        # Two monitors.
        xrandr --output eDP1 --mode 1600x900 --pos 1920x90 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off && echo "Configuring 2 displays."
        ;;
    -up)
        # HDMI2 up, monitor down.
        xrandr --output eDP1 --mode 1600x900 --pos 160x1080 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        ;;

    *)
        # Screen mirror if second screen is connected or else for single screen.
        xrandr | grep 'HDMI2 connected' && xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output DP2 --off  && echo "Duplicating display." || { xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off && echo "Configuring single display."; }
        ;;

    esac
