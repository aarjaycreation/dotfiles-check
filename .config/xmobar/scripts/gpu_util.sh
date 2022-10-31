#!/bin/sh

temp1=50
temp2=90

temp=$(nvidia-smi | grep 'Default' | awk '{print $13}' | sed 's/%//')

if [ "$temp" -ge "$temp2" ] ; then
    echo "Gpu: <fc=#C1514E>$temp</fc>%"
elif [ "$temp" -ge "$temp1" ] ; then
    echo "Gpu: <fc=#C1A24E>$temp</fc>%"
else
    echo "Gpu: <fc=#AAC0F0>$temp</fc>%"

fi
