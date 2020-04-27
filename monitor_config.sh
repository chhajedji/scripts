#!/bin/sh

xrandr --auto

case "$1" in

    -dup)
        # Duplicate monitors.
        xrandr --output VIRTUAL1 --off --output eDP1 --mode 1600x900 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --primary --mode 1600x900 --pos 0x0 --rotate normal --output HDMI1 --off --output DP2 --off
        ;;

    -two)
        # Two monitors.
        xrandr --output VIRTUAL1 --off --output eDP1 --mode 1600x900 --pos 0x92 --rotate normal --output DP1 --off --output HDMI2 --primary --mode 1920x1080 --pos 1600x0 --rotate normal --output HDMI1 --off --output DP2 --off
        ;;

    *)
        # Single monitor.
        xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off
        ;;

    esac
