#!/bin/sh

# ** NOTE: Useful when notification manager is dunst only. **

# Manage visibility of notifications by this script. By default it
# will toggle visibility of notifications every time.

case "$1" in

    # Resume all notifications.
    "-r")
        notify-send "DUNST_COMMAND_RESUME"
        notify-send "Notifications resumed."
        ;;

    # Pause all notifications.
    "-p")
        notify-send "DUNST_COMMAND_PAUSE"
        ;;

    # Toggle all notifications.
    *)
        notify-send "Notifications resumed."
        notify-send "DUNST_COMMAND_TOGGLE"
        ;;

esac
