#!/bin/sh

# Use "$BUTTON" to recognise mouse click. For left click, value will
# be 1, for right, value will be 3 and for middle click, value will be
# 2.

case $1 in

    -n)
        # TODO: Draw a graph showing internet speed variation in past few cycles.
        ;;

    -v)
        # Left click to decrease volume.
        # Right click to increase volume.
        # Middle click to mute/unmute.
        case $BUTTON in
            1) volume_change.sh -d ;;
            2) volume_change.sh -t ;;
            3) volume_change.sh -i ;;
            *) echo "Invalid command."; return 1 ;;
        esac ;;

    -s) $TERMINAL -e htop ;;

    -d) gnome-calendar ;;

    *)
        echo "Invalid option."
        return 1
        # Do nothing by default
    ;;

esac
