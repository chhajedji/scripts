#!/bin/sh

WIN_ID="$(xdotool getactivewindow)"
compton-trans -w ${WIN_ID} 0
sleep 0.05
compton-trans -w ${WIN_ID} 100
echo "Blinking focused window."
sleep 0.05
compton-trans -w ${WIN_ID} 0
sleep 0.05
compton-trans -w ${WIN_ID} 100
