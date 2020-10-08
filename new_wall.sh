#!/bin/sh

echo "Setting new wallpaper."
feh --recursive --randomize $HOME/Pictures/wallpapers/* --bg-scale
