#!/bin/bash

selected=$(ls ~/projects/ | rofi -dmenu -p "Open: ")
alacritty -e fish -c "cd ~/projects/$selected; nvim . ;fish"
