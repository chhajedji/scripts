#!/bin/sh

# List all unique picture formats in wallpapers directory with this query and
# grep required file formats to choose from.

# ls -R $HOME/Pictures/wallpapers/ | sed "s/.*\(\.[a-z]*$\)/\1/p" -n | sort | uniq

# IMG="$(ls -R $HOME/Pictures/wallpapers/ | grep '.*\.png\|.*\.jpg\|\.jpeg' | shuf -n 1 | xargs -I {} fd {} $HOME/Pictures/wallpapers/ )"

echo "Setting new wallpaper."
#
# feh $IMG --bg-scale
#
# Set terminal colorscheme with `pywal'.
# wal -n -i "$IMG" -a 82

disp_config.sh
# To set wallpaper by `feh' without `IMG' variable.
feh --recursive --bg-scale --randomize $HOME/Pictures/wallpapers/*

