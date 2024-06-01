#!/bin/sh
for id in `xinput --list | awk '/Razer Razer DeathAdder V3 Pro .*pointer/ {print $8}' | sed 's/id=\(.*\)/\1/'`; do
    notify-send "Applied Mouse Rotation"
    xinput set-prop $id "Coordinate Transformation Matrix" 0.9848 0.1736 0 -0.1736 0.9848 0 0 0 1
    sleep 1
done 
