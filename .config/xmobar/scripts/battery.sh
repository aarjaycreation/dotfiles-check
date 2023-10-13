#!/bin/bash

#Check if its laptop of pc with hostnamectl

pctype=$(hostnamectl | grep -Po '(Chassis: )(\w+)' | sed 's/Chassis: //')
if [ "$pctype" == "desktop" ];
then
    #Check if any connected device has a battery with upower
    xm3bat=$(upower -i /org/freedesktop/UPower/devices/headset_dev_94_DB_56_AB_B5_D4 | grep -Po '(percentage: *)(\d+)' | sed 's/\s*percentage: //' | xargs)
    if [ "$xm3bat" == 0 ];
    then
        echo ""
        exit 0
    fi
    echo "<fn=3>󰋋</fn><fc=#AAC0F0> $xm3bat%</fc>"
    exit 0
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
