#!/bin/bash
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | sed -En 's/Mute: (.)/\1/p')
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]*%' | sed -En 's/(.)\%/\1/p' | head -n1)

if [ "$MUTE" = "yes" ]; then
    echo "<fc=#696B71><fn=3>婢</fn></fc>"
elif [ "$VOLUME" -le 20 ]; then
    echo "<fc=#DFDFDF><fn=3>奔</fn><fn=2> $VOLUME</fn></fc>"
else
    echo "<fc=#DFDFDF><fn=3>墳</fn><fn=2> $VOLUME</fn></fc>"
fi
