#!/bin/sh

CHANGE=15
# Argument expected is "-inc" or "-dec".

xbacklight "$1" $CHANGE &&
    echo "Brightness changed by $CHANGE."
