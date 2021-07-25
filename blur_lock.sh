#!/bin/bash

# Credits: https://github.com/petvas/i3lock-blur
TMPBG=/tmp/screen.png
LOCK=$HOME/.local/share/supplements/lock.png
RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')

# Without any lock image
ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -filter_complex "boxblur=10:1" -vframes 1 $TMPBG -loglevel quiet

# Use image in `LOCK` and overlay it over the blurred image.
# ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $LOCK -filter_complex "boxblur=10:1,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMPBG -loglevel quiet
xset dpms 3
# Watiting for some time before turning screen off looks so better with effects
# of a compositor like picom.
# Also sometimes `xset dpms 3' doesn't take effect. So ensuring that at start,
# screen goes off is good idea.
sleep 3s && xset dpms force off &
pgrep dunst >/dev/null && notify-send "DUNST_COMMAND_PAUSE" &&
    echo "Paused dunst notifications."
echo "Locking system with \`i3lock'"
i3lock -efi $TMPBG -n
xset dpms 600
pgrep dunst >/dev/null && notify-send "DUNST_COMMAND_RESUME" &&
    echo "Resumed dunst notifications."
rm $TMPBG
