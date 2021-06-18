#!/bin/sh

# List all unique picture formats in wallpapers directory with this query and
# grep required file formats to choose from.

# ls -R $HOME/Pictures/wallpapers/ | sed "s/.*\(\.[a-z]*$\)/\1/p" -n | sort | uniq

# IMG="$(ls -R $HOME/Pictures/wallpapers/ | grep '.*\.png\|.*\.jpg\|\.jpeg' | shuf -n 1 | xargs -I {} fd {} $HOME/Pictures/wallpapers/ )"

#
# feh $IMG --bg-scale
#
# Set terminal colorscheme with `pywal'.
# wal -n -i "$IMG" -a 82

# First update the monitor settings before changing wallpaper.
disp_config.sh

# Give any file as argument to set it as wallpaper.
if [ $1 ]; then
    echo "Setting $1 as new wallpaper."
    RET=$(feh --bg-scale "$1")
    return $RET
fi

echo "Setting new wallpaper."

# To set wallpaper by `feh' without `IMG' variable.
feh --recursive --bg-scale --randomize $HOME/Pictures/wallpapers/*

