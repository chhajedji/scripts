#!/bin/sh

[ -n "$TERMINAL" ] || export TERMINAL="urxvt"

# ID_FOCUSED=$(xdotool getwindowfocus)
# ID_ACTIVE=$(xdotool getactivewindow)
# PID=$(xdotool getwindowpid "$ID_ACTIVE")
# echo "ID_FOCUSED: $ID_FOCUSED    ID_ACTIVE: $ID_ACTIVE    PID: $PID"

samedirnoob.sh
exit

ID=$(xdpyinfo | grep focus | cut -f4 -d " ")
PID=$(($(xprop -id $ID | grep -m 1 PID | cut -d " " -f 3) + 2))

echo "PID is $PID."

if [ -e "/proc/$PID/cwd" ]
then
    case "$TERMINAL" in
        "urxvt")
            $TERMINAL -cd "$(readlink /proc/$PID/cwd)"
            ;;
        "konsole")
            # $TERMINAL --workdir "$(readlink /proc/$PID/cwd)"
            cd "$(readlink /proc/$PID/cwd)" && $TERMINAL
            ;;
        "st")
            cd "$(readlink /proc/\"$((($PID+1)))\"/cwd)" && $TERMINAL
            ;;
        *)
            echo "Running default terminal or urxvt."
            $TERMINAL
            ;;
    esac &
else
    $TERMINAL &
fi echo "Opening $TERMINAL.."
