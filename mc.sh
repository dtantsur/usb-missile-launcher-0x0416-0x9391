#!/bin/bash

DIR=$(ls -1d /sys/bus/usb/drivers/missilelauncher/*-*:*.* | head -n1)

if [ -z "$DIR" ]; then
    echo "Device not found, is the driver loaded?"
    exit 1
fi

cd $DIR

echo "Missile Control - press [w], [a], [s], [d] to move, [e] to stop and [q] to shoot. [ctrl+c to exit]"

while IFS= read -s -r -n1 char
do
	if [ "$char" == "w" ]; then
		$(echo 1 > up) 
	fi

	if [ "$char" == "a" ]; then
		$(echo 1 > left)
	fi

	if [ "$char" == "s" ]; then
		$(echo 1 > down) 
	fi

	if [ "$char" == "d" ]; then
		$(echo 1 > right) 
	fi

	if [ "$char" == "q" ]; then
		$(echo 1 > fire) 
	fi

	if [ "$char" == "e" ]; then
		$(echo 1 > stop) 
	fi
done
