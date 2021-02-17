#!/bin/sh

wifi="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"
if [ $wifi = "enabled" ]
then
    nmcli r wifi off
    echo "WiFi Turned Off."
else
    nmcli r wifi on
    echo "WiFi Turned On."
fi
