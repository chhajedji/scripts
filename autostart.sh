#!/bin/sh

# Autostart these applications on startup.

# Clipboard manager.
command -v parcellite && parcellite &

command -v nm-applet && nm-applet &

# Set screen-timeout to 600 seconds.
xset dpms 600

# Turnoff touchpad. Use `xinput` to see all inputs. To enable, set it to 1. Put
# this in i3 config, not .bashrc as for floating wm for my Kubuntu, a script automatically
# disables it.
# Usage: `xinput` - lists all input devices.
#        `xinput list-props [Device name in quotes/Device ID]` - lists all properties of given device.
#        `xinput set-prop [Device name in quotes/Device ID]` - set desired property for given device.
xinput set-prop "Synaptics TM3276-022" "Device Enabled" 0

command -v compton && compton --config $HOME/.config/compton/compton.conf -b &
command -v dunst && killall -q notify-osd; dunst -config $HOME/.config/dunst/dunstrc &
redshift -P -O 3700 &
new_wall.sh &

xrdb -merge $HOME/.Xresources

wmctrl -m |grep dwm && dwmstatus
