#!/bin/sh

# Usage: new_wall.sh [DIRECTORY|FILE]

# Demo video: https://youtu.be/11Dqat5XS9c

# Randomize a file from the optional argument DIRECTORY or set optional
# argument FILE as a wallpaper on all desktops.


# Set terminal colorscheme with `pywal'.
# wal -n -i "$IMG" -a 82

# First update the monitor settings before changing wallpaper.
# Get this script here: https://github.com/chhajedji/scripts/blob/master/disp_config.sh
# disp_config.sh

# Give any file or directory as argument to set it as wallpaper.
if [ "$1" ]; then

    # Check if input is directory.
    if [ -d "$1" ]; then
        echo "Setting wallpaper from $(realpath $1)"

        feh --recursive --bg-scale --randomize "$1"/*
        exit
    fi

    # Input is a wallpaper file.
    echo "Setting $1 as new wallpaper."
    feh --bg-scale "$1"
    exit
fi

echo "Setting new wallpaper."

# To set wallpaper by `feh' without `IMG' variable.
feh --recursive --bg-scale --randomize "$HOME"/Pictures/wallpapers/*

