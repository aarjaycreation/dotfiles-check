#!/bin/bash


batLevel=$(acpi --battery | grep -Po '(\d+)\%' | sed 's/%//')

charging=$(acpi --ac-adapter | grep -Po '(off-line|on-line)')

if [ $batLevel -le 20 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂆 </fn>"
	else
		echo "<fn=4>󰁻 </fn>"
	fi
elif [ $batLevel -le 30 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂇 </fn>"
	else
		echo "<fn=4>󰁼 </fn>"
	fi
elif [ $batLevel -le 40 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂈 </fn>"
	else
		echo "<fn=3>󰁽 </fn>"
	fi
elif [ $batLevel -le 60 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂉 </fn>"
	else
		echo "<fn=4>󰁿 </fn>"
	fi
elif [ $batLevel -le 80 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂊 </fn>"
	else
		echo "<fn=4>󰂁 </fn>"
	fi
elif [ $batLevel -le 95 ];
then
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂋 </fn>"
	else
		echo "<fn=4>󰂂 </fn>"
	fi
else
	if [ $charging == "on-line" ];
	then
		echo "<fn=3>󰂅 </fn>"
	else
		echo "<fn=4>󰁹 </fn>"
	fi
fi
