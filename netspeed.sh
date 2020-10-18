#!/bin/bash

# Pre-requisites: `speedtest'

# Usage:
# `netspeed CYCLES[number of tests]' [anything for upload][optional].

CYCLES=$1
# Default is 5 cycles
[ -n "$CYCLES" ] || CYCLES=2

rm /tmp/upspeed 2>/dev/null

echo "** Download Speed **" > /tmp/downspeed
echo $(date) >> /tmp/downspeed
echo '' >> /tmp/downspeed

for((i=0;i<$CYCLES;i++));do
    (command -v speedtest >/dev/null && speedtest --no-upload |grep ^Download |tee -a /tmp/downspeed)
done

# Update number of cycles based on results. This might be less than or equal to
# `CYCLES' defined earlier.
ROUNDS=$(cat /tmp/downspeed | grep "^Download: [0-9.]\{1,4\}" | wc -l)

# Calculating average download speed.
echo "" >> /tmp/downspeed
echo -n "Average download speed in Mbps for $ROUNDS cycle is " >> /tmp/downspeed
echo "scale=2; (($(cat /tmp/downspeed | sed 's/.* \([0-9]*\.[0-9]*\) .*/\1/p' -n | paste -sd '+'))/$ROUNDS)" | bc >> /tmp/downspeed

notify-send "Download speed results.

$(cat /tmp/downspeed)"



# Follow same procedure used above for upload speed also.


# Give any argument after number of cycles to log upload speed.
if [ $2 ]; then

    echo "** Upload Speed **" >> /tmp/upspeed
    echo $(date) >> /tmp/upspeed
    echo '' >> /tmp/upspeed
    for((i=0;i<$CYCLES;i++));do
        command -v speedtest >/dev/null && speedtest --no-download |grep ^Upload |tee -a /tmp/upspeed
    done

# Update number of cycles based on results. This might be less than or equal to
# `CYCLES' defined earlier.
    ROUNDS=$(cat /tmp/upspeed | grep "^Upload: [0-9.]\{1,4\}" | wc -l)

    echo "" >> /tmp/upspeed
    echo -n "Average upload speed in Mbps for $ROUNDS cycle is " >> /tmp/upspeed
    echo "scale=2; (($(cat /tmp/upspeed | sed 's/.* \([0-9]*\.[0-9]*\) .*/\1/p' -n | paste -sd '+'))/$ROUNDS)" | bc >> /tmp/upspeed
    notify-send "Upload speed results.

    $(cat /tmp/upspeed)"

fi
