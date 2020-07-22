#!/bin/sh

case "$1" in

    # Increase transparency.
    -i)
WIN_ID="`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}'`"
compton-trans -w ${WIN_ID} +"$1"
        echo "Transparency increased by $1"
;;


    # Decrease transparency.
    -d)
        WIN_ID="`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}'`"
        compton-trans -w ${WIN_ID} -"$1"
        echo "Transparency decreased by $1"
        ;;

    *)
        echo "Invalid option."
        return 1
        ;;
    esac
