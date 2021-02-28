#!/bin/sh

# If launched from terminal, will ask to select a window. Or else active
# window's name will be displayed.

if [ $(tty) = "not a tty" ]; then
    xprop -id $(xdotool getactivewindow) | grep _NET_WM_NAME | cut -d'"' -f2
    # xprop -id $(xdotool getactivewindow) | grep 'WM_NAME(STRING)' | cut -d'"' -f2
else
    echo "Select the window."
    xprop | grep _NET_WM_NAME | cut -d'"' -f2
fi
