#!/bin/sh

wifi="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"
if [ $wifi = "enabled" ]
then
    nmcli r wifi off
else
    nmcli r wifi on
fi
