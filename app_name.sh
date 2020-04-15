#!/bin/sh

xprop -id $(xdotool getactivewindow) | grep _NET_WM_NAME | cut -d'"' -f2
# xprop -id $(xdotool getactivewindow) | grep 'WM_NAME(STRING)' | cut -d'"' -f2
