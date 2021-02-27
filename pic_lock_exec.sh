#!/bin/sh

# Whenever script is called, following actions happen:
#    - set screenoff time to 5 secs
#    - lock the screen with i3lock with some color.
#    - `-n` option blocks until screen is unlocked.
#    - After unlocking, set screen timeout to 300 secs

# xset dpms 5; i3lock -ef --color 2f343f -n; xset dpms 600

# List all unique picture formats in wallpapers directory with this query and
# grep required file formats to choose from.

# ls -R $HOME/Pictures/wallpapers/ | sed "s/.*\(\.[a-z]*$\)/\1/p" -n | sort | uniq

IMG="$(ls -R $HOME/Pictures/wallpapers/ | grep '.*\.png\|.*\.jpg\|\.jpeg' | shuf -n 1 | xargs find $HOME/Pictures/wallpapers/ -name )"
echo Lock image: $IMG

xset dpms 8
pgrep dunst >/dev/null && notify-send "DUNST_COMMAND_PAUSE" &&
    echo "Paused dunst notifications."
pic_lock.sh -i $IMG
pgrep dunst >/dev/null && notify-send "DUNST_COMMAND_RESUME"
&& echo "Resumed dunst notifications."
xset dpms 600


