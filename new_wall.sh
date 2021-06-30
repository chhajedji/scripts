#!/bin/sh

# Usage: new_wall.sh [OPTIONAL DIRECTORY] [OPTIONAL FILE]
# Randomize a file from the optional argument DIRECTORY or set optional
# argument FILE as a wallpaper on all desktops.


# Set terminal colorscheme with `pywal'.
# wal -n -i "$IMG" -a 82

# First update the monitor settings before changing wallpaper.
disp_config.sh

# Give any file as argument to set it as wallpaper.
if [ $1 ]; then
    if [ -d "$1" ]; then
        echo "Setting wallpaper from $(realpath $1)"
        feh --recursive --bg-scale --randomize "$1"
        return $?
    fi
    echo "Setting $1 as new wallpaper."
    feh --bg-scale "$1"
    return $?
fi

echo "Setting new wallpaper."

# To set wallpaper by `feh' without `IMG' variable.
feh --recursive --bg-scale --randomize $HOME/Pictures/wallpapers/*

