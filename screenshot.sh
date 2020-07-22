#!/bin/sh

mkdir -p $HOME/Pictures/screenshots/
DESTINATION="$HOME/Pictures/screenshots/"

# Sleep command is necessary for scrot to work from keybinding. Because of
# `sleep`, user gets time to release keyboard resource. If sleep is not there,
# scrot will throw error for unavailability of resource.
sleep 0.2s

case $1 in

# Area select.
    -s)
        scrot --select "$DESTINATION%Y-%m-%d-%T.png"
        ;;

# Window select.
    -w)
        scrot --focused --border "$DESTINATION%Y-%m-%d-%T.png"
        ;;

# Default is full screen.
    *)
        scrot "$DESTINATION%Y-%m-%d-%T.png"
        ;;

esac &&
    {
        SSNAME="$(ls -t $DESTINATION |head -n1)";
        xclip -in -selection clipboard -target image/png "$DESTINATION$SSNAME"
    } &&
        notify-send "
$(ls -t $HOME/Pictures/screenshots/ |head -n1)
Screenshot saved and copied to clipboard. " &&
        echo "$(ls -t $HOME/Pictures/screenshots/ |head -n1)
Screenshot saved and copied to clipboard."

