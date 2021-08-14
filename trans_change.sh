#!/bin/sh

case "$1" in

    # Increase transparency.
    -i)
        WIN_ID="`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}'`"
        compton-trans -w ${WIN_ID} +"$2"
        echo "Transparency increased by $2"
        ;;


    # Decrease transparency.
    -d)
        WIN_ID="`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}'`"
        compton-trans -w ${WIN_ID} -"$2"
        echo "Transparency decreased by $2"
        ;;

    *)
        echo "Invalid option."
        exit 1
        ;;
esac
