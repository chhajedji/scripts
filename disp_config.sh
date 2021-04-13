#!/bin/sh

xrandr --auto

DUPLICATE="xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI1 --off --output DP2 --off"

LAPTOPDOWN="xrandr --output eDP1 --mode 1600x900 --pos 160x1080 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"

LAPTOPRIGHT="xrandr --output eDP1 --mode 1600x900 --pos 1920x90 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"

ONE="xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off"

LAPTOPLEFT="xrandr --output eDP1 --mode 1600x900 --pos 0x90 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --primary --mode 1920x1080 --pos 1600x0 --rotate normal --output VIRTUAL1 --off"

case "$1" in

    -dup)
        # Duplicate monitors.
        $DUPLICATE &&
            echo "Duplicating two monitors."
        ;;

    -two)
        # Two monitors.
        $LAPTOPRIGHT && echo "Configuring 2 displays."
        ;;

    -one)
        $ONE && echo "Configuring single display."
        ;;

    -up)
        # HDMI2 up, monitor down.
        $LAPTOPDOWN && echo "Configuring 2 displays."
        ;;

    *)
        # Check if laptop lid is open or close. Act according to that.
        # If lid is open, configure right-left display, or else duplicate.

            cat /proc/acpi/button/lid/LID/state | grep 'open' >/dev/null
            STATE="$?"
            if [ "$STATE" = '0' ]; then
                xrandr | grep 'HDMI. connected' >/dev/null
                STATE="$?"
                if [ "$STATE" = '0' ]; then
                    $LAPTOPRIGHT && echo "Configuring 2 displays."
                else
                    $ONE && echo "Configuring single display."
                fi
            else
                $DUPLICATE && echo "Configuring duplicate display."
            fi
        ;;

    esac
