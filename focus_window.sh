#!/bin/sh

WIN_ID="$(xdotool getactivewindow)"
compton-trans -w ${WIN_ID} 0
sleep 0.01
compton-trans -w ${WIN_ID} 100
sleep 0.01
compton-trans -w ${WIN_ID} 0
sleep 0.01
compton-trans -w ${WIN_ID} 100
