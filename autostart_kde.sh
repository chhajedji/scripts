#!/bin/sh

# Autostart these applications on startup.

# Turnoff touchpad. Use `xinput` to see all inputs. To enable, set it to 1. Put
# this in i3 config, not .bashrc as for floating wm for my Kubuntu, a script automatically
# disables it.
# Usage: `xinput` - lists all input devices.
#        `xinput list-props [Device name in quotes/Device ID]` - lists all properties of given device.
#        `xinput set-prop [Device name in quotes/Device ID]` - set desired property for given device.

# For T14
xinput set-prop "Synaptics TM3471-020" "Device Enabled" 0

# If has emacs, search if daemon is already running. If not then start
# an emacs daemon.
type emacs && { [ "$(ps aux | grep 'emacs --daemon' | wc -l)" = "2" ] ||
    emacs --daemon; } &

# 1. Check if dwm is current windown manager.
# 2. Start dwmbar only if it's not running.
[ $GDMSESSION = "dwm" ] && { pgrep dwmbar || dwmbar; } &
