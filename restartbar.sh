#!/bin/sh

# Get count of "dwmbar" processes running. If count is 1 then kill sleep
# subprocess within it. If count is more than 1, kill all instances (if any)
# and start a new process.

{ [ $(pgrep -c dwmbar) = "1" ] && pkill -P $(pgrep dwmbar) sleep; } || { pkill dwmbar; dwmbar; }
echo "Restarting dwmbar.."
