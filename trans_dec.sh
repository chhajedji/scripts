#!/bin/sh

WIN_ID="`xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}'`"
compton-trans -w ${WIN_ID} -5
