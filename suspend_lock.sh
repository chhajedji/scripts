#!/bin/sh

# Change screentimeout to 8 secs.
xset dpms 8
# Suspend and lock. See option `-n` 
systemctl suspend && i3lock -c "#222222" -n
# After unlocking, set screentimeout to 600 s.
xset dpms 600
