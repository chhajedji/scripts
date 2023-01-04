#!/bin/sh

TOGGLEWHAT="--touchscreen"
[ "$1" ] && TOGGLEWHAT="$1"

case "$TOGGLEWHAT" in
    --touchscreen)
        TOUCHSCREENID="$(xinput | grep 'ELAN.*pointer' | sed -n 's/.*id=\([0-9]*\).*/\1/p')"

        if [ $(echo $TOUCHSCREENID | wc -w) -ne 1 ];
        then
            echo "Number of IDs not 1."
            return 1
        fi

        if xinput list-props $TOUCHSCREENID | grep "Device Enabled ([0-9]*):.*1" >/dev/null;
        then
            xinput disable $TOUCHSCREENID
        else
            xinput enable $TOUCHSCREENID
        fi
        ;;

    --trackpad)
        TRACKPADID="$(xinput | grep 'Touchpad' | sed -n 's/.*id=\([0-9]*\).*/\1/p')"

        if [ $(echo $TRACKPADID | wc -w) -ne 1 ];
        then
            echo "Number of IDs not 1."
            return 1
        fi

        if xinput list-props $TRACKPADID | grep "Device Enabled ([0-9]*):.*1" >/dev/null;
        then
            xinput disable $TRACKPADID
        else
            xinput enable $TRACKPADID
        fi
        ;;

    --mouse)
        MOUSEID="$(xinput | grep 'Mouse' | sed -n 's/.*id=\([0-9]*\).*/\1/p')"

        if [ $(echo $MOUSEID | wc -w) -ne 1 ];
        then
            echo "Number of IDs not 1."
            return 1
        fi

        if xinput list-props $MOUSEID | grep "Device Enabled ([0-9]*):.*1" >/dev/null;
        then
            xinput disable $MOUSEID
        else
            xinput enable $MOUSEID
        fi
        ;;

    esac
