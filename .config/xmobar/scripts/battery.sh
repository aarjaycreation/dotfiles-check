#!/bin/bash

if [ "$(acpi)" == "No support for device type: power_supply" ]
then
    echo ""
fi

batLevel=$(acpi --battery | grep -Po '(\d+)\%' | sed 's/%//')

charging=$(acpi --ac-adapter | grep -Po '(off-line|on-line)')

if [ $batLevel -le 20 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂆 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	else
		echo "<fn=4>󰁻 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	fi
elif [ $batLevel -le 30 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂇 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	else
		echo "<fn=4>󰁼 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	fi
elif [ $batLevel -le 40 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂈 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	else
		echo "<fn=3>󰁽 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	fi
elif [ $batLevel -le 60 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂉 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	else
		echo "<fn=4>󰁿 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	fi
elif [ $batLevel -le 80 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂊 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	else
		echo "<fn=4>󰂁 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	fi
elif [ $batLevel -le 95 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂋 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	else
		echo "<fn=4>󰂂 </fn> <fc=#AAC0F0> $batLevel%</fc>"
	fi
else
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂅</fn> <fc=#AAC0F0> $batLevel%</fc>"
	else
		echo "<fn=4>󰁹</fn> <fc=#AAC0F0> $batLevel%</fc>"
	fi
fi
