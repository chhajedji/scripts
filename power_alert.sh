#!/bin/sh

# Set `CRITICAL_THRESHOLD' to the value of battery for which you want
# to be notified if level goes below. Similarly set `SAFE_THRESHOLD'
# for safe value.
# You will be notified by `notify-send' utility to
# send system notifications whenever battery
# crosses. `CRITICAL_THRESHOLD' value.

ALERT_SENT=0
CRITICAL_THRESHOLD=40
SAFE_THRESHOLD=80

# Global variables which might be used by other applications.
export BAT_CRITICAL=0
export BAT_SAFE=0
export BAT_NORMAL=0

while true; do

BAT_STATUS=$(cat /sys/class/power_supply/BAT1/capacity)

    # Set environment variables.
    if [ $BAT_STATUS -lt $CRITICAL_THRESHOLD ]; then
        if [ $ALERT_SENT -eq 0 ]; then
            notify-send -u critical "Battery less than $CRITICAL_THRESHOLD%."
            ALERT_SENT=1
        fi
        export BAT_CRITICAL=1
        export BAT_SAFE=0
        export BAT_NORMAL=0
    else
        ALERT_SENT=0
        if [ $BAT_STATUS -gt $SAFE_THRESHOLD ]; then
            export BAT_CRITICAL=0
            export BAT_SAFE=1
            export BAT_NORMAL=0
        else
            export BAT_CRITICAL=0
            export BAT_SAFE=0
            export BAT_NORMAL=1
        fi
    fi

    sleep 1m
done &
