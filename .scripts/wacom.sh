#!/bin/sh
id=$(xsetwacom list | grep 'STYLUS' | cut -f2 | cut -d' ' -f2)
if [ ! -z $id ]
then
	xsetwacom set "$id" MapToOutput 1920x1080+0+0
	xsetwacom set "$id" Rotate half
else
	notify-send 'No wacom tablet'
fi
