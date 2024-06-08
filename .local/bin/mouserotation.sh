#!/bin/sh
for id in `xinput --list | awk '/Razer Razer DeathAdder V3 Pro .*pointer/ {print $8}' | sed 's/id=\(.*\)/\1/'`; do
    notify-send "Applied Mouse Rotation"
    xinput set-prop $id "libinput Rotation Angle" 350 
    sleep 1
done 
