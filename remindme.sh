#!/bin/sh

# Demo video: https://youtu.be/5_5AoSFpOxQ

# Usage:
# Time input should be given in 24 hour format with or without : separated. Or in terms of 'minutes', 'hours' or 'days'
# Correct inputs include: 1534, 12:21, 3 minutes, 45m, 2h, 14h, 13 hours

# Option    Function
# -r        Set a reminder
# -d        Delete a reminder

DMENU_FONT1="Inconsolata"

# Gift by a God's man. Don't know how it works but it works soooo well.
# https://serverfault.com/a/937822
atqc(){ atq | perl -nE'($q,$j)=/((\d+).*)/;qx(at -c $j)=~/\n}\n(.*?)\s*$/s;say"$q: $1"'; }

case $1 in

    # Set a reminder.
    -r)

        WHEN=$(echo | dmenu -p 'When? (min / hr / days or 24 hr format):' -fn "$DMENU_FONT1")

        # If non empty time.
        if [ -n "$WHEN" ]; then

            # Take message as input.
            WHAT=$(echo | dmenu -p 'Message:' -fn "$DMENU_FONT1")

            # If message length is zero.
            if [ -z "$WHAT" ]; then
                echo "No message entered. Reminder not set."
                exit 1
            else
                # Check if the input is in format "now + x time".
                ADDM=$(echo "$WHEN" | grep '[mM]' | grep -o '[0-9]*')
                if [ $? -eq 0 ]; then
                    echo "notify-send '$WHAT'" | at now + $ADDM minutes
                    exit
                fi

                ADDH=$(echo "$WHEN" | grep '[hH]' | grep -o '[0-9]*')
                if [ $? -eq 0 ]; then
                    echo "notify-send '$WHAT'" | at now + $ADDH hours
                    exit
                fi

                ADDD=$(echo "$WHEN" | grep '[dD]' | grep -o '[0-9]*')
                if [ $? -eq 0 ]; then
                    echo "notify-send '$WHAT'" | at now + $ADDD days
                    exit
                fi


                # Instead of addition in time, exact time is given.
                { echo "$WHEN" | grep -q ':'; } && { echo "notify-send '$WHAT'" | at $WHEN; exit; }

                # Check if input is just 4 numbers without any other character and
                # format it in HH:MM.
                # Easier way to separate time with ':' would be `sed 's/^.\{2\}/&:/g'`
                # But this wouldn't check if there are only 4 numbers.
                TRUETIME="$(echo "$WHEN" | sed -nE 's/^([0-9]{2})([0-9]{2})$/\1:\2/p')"

                if [ $TRUETIME ]; then
                    echo "notify-send '$WHAT'" | at $TRUETIME
                    exit
                fi

                # If no case so far, then invalid input.
                echo "Invalid time: $WHEN"
                exit 1

            fi
        else
            echo "No time selected."
            exit 1
        fi
        ;;

    # Delete a reminder
    -d)

        # `atqc` is function defined above.
        SEL=$(atqc | dmenu -p 'Kill which reminder?' -l 20 -fn "$DMENU_FONT1")

        if [ -z "$SEL" ]; then
            echo "No job selected to kill."
            exit 1
        fi
        atrm $(echo $SEL | cut -d ' ' -f 1)
        exit
        ;;

    # By default, set reminder.
    *)

        $0 -r
        ;;

esac
