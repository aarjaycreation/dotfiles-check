#!/bin/sh

temp1=70
temp2=85
amd_or_intel=$(sensors | grep 'Package id 0:')


if [$amd_or_intel == ""]
then
	temp=$(sensors | grep 'AMD' | head -n 1 | grep -Po '\+\d+.+°C ' | sed -En 's/\+(.*)\..*°C/\1/p')
else
	temp=$(sensors | grep 'Package id 0:' | awk '{print $4}' | sed 's/+//'| sed 's/.0°C//')
fi

if [ "$temp" -ge "$temp2" ] ; then
    echo "<fn=6></fn> <fc=#C1514E>$temp</fc>°C"
elif [ "$temp" -ge "$temp1" ] ; then
    echo "<fn=6></fn> <fc=#C1A24E>$temp</fc>°C"
else
    echo "<fn=6></fn> <fc=#AAC0F0>$temp</fc>°C"

fi
