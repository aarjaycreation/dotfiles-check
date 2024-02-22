#!/bin/bash

#test if output of command is 0.0000

current_value=$(yabai -m config menubar_opacity)
if [ "$current_value" == "0.0000" ]; then
    yabai -m config menubar_opacity 1.0
else
    yabai -m config menubar_opacity 0.0
fi
