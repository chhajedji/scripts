#!/bin/bash

# Credits: https://github.com/petvas/i3lock-blur
TMPBG=/tmp/screen.png
LOCK=$HOME/.config/i3/other_files/lock2.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
 
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=10:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
xset dpms 3
i3lock -efi $TMPBG -n
xset dpms 600
rm $TMPBG
