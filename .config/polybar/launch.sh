#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -q main -c "~/.config/polybar/config" &
polybar -q util -c "~/.config/polybar/config" &
polybar -q mon -c "~/.config/polybar/config" &