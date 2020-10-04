#!/bin/sh

# Change screentimeout to 8 secs.
xset dpms 8
pgrep dunst >/dev/null && notify-send "DUNST_COMMAND_PAUSE" &&
    echo "Paused dunst notifications."
# Suspend and lock. See option `-n` 
echo "Suspending system and locking with \`i3lock'."
systemctl suspend && i3lock -c "#222222" -n
# After unlocking, set screentimeout to 600 s.
xset dpms 600
pgrep dunst >/dev/null && notify-send "DUNST_COMMAND_RESUME" &&
    echo "Resumed dunst notifications."
