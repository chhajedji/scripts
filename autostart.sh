#!/bin/sh

# Autostart these applications on startup.

# Clipboard manager.
command -v parcellite && { pgrep parcellite || parcellite & }

command -v nm-applet && { pgrep nm-applet || nm-applet & }

# Set screen-timeout to 420 seconds.
xset dpms 420

# Prevent screen from blanking.
# xset s off -dpms

# Turnoff touchpad. Use `xinput` to see all inputs. To enable, set it to 1. Put
# this in i3 config, not .bashrc as for floating wm for my Kubuntu, a script automatically
# disables it.
# Usage: `xinput` - lists all input devices.
#        `xinput list-props [Device name in quotes/Device ID]` - lists all properties of given device.
#        `xinput set-prop [Device name in quotes/Device ID]` - set desired property for given device.
xinput set-prop "DLL07A0:01 044E:120B" "Device Enabled" 0

# Try to use picom, if not available then use compton.
{ command -v picom && { pgrep picom || picom --config $HOME/.config/picom/picom.conf -b & }; } ||
    { command -v compton && { pgrep compton || compton --config $HOME/.config/compton/compton.conf -b & } }

# awesomewm doesn't need dunst for notifications.
pgrep -x awesome ||
    { command -v dunst && { pgrep dunst || { killall -q notify-osd; dunst -config $HOME/.config/dunst/dunstrc & } } }

redshift -P -O 3700 &
new_wall.sh &

# If has emacs, search if daemon is already running. If not then start
# an emacs daemon.
type emacs && { [ "$(ps aux | grep 'emacs --daemon' | wc -l)" = "2" ] ||
    emacs --daemon; } &

disp_config.sh

# 1. Check if dwm is current windown manager.
# 2. Start dwmbar only if it's not running.
[ $GDMSESSION = "dwm" ] && { pgrep dwmbar || dwmbar; } &

pgrep -x power_alert.sh >/dev/null || power_alert.sh
