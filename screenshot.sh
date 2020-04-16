#!/bin/sh

mkdir -p $HOME/Pictures/screenshots/
DESTINATION="$HOME/Pictures/screenshots/%Y-%m-%d-%T.png"

# Sleep command is necessary for scrot to work from keybinding. Because of
# `sleep`, user gets time to release keyboard resource. If sleep is not there,
# scrot will throw error for unavailability of resource.
sleep 0.2s

case $1 in

# Area select.
    -s)
        scrot --select "$DESTINATION"
        ;;

# Window select.
    -w)
        scrot --focused --border "$DESTINATION"
        ;;

# Default is full screen.
    *)
        scrot "$DESTINATION"
        ;;

esac && notify-send "
$(ls -t $HOME/Pictures/screenshots/ |head -n1)
Screenshot saved "

