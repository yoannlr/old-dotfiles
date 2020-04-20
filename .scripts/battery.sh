#!/bin/sh

# $1 : power source (usually BAT0)
# $2 : demay between each check
# $3 : low battery treshold

statfile="/sys/class/power_supply/$1/status"
capfile="/sys/class/power_supply/$1/capacity"

delay=$2
treshold=$3
notified=0
stat=$(cat "$statfile")
cap=$(cat "$capfile")

while /bin/true
do
	stat=$(cat "$statfile")
	if [ "$stat" = "Discharging" ]
	then
		cap=$(cat "$capfile")
		if [ $cap -lt $treshold ] && [ ! $notified -eq 1 ]
		then
			notify-send -u critical 'Low battery'
			mpv $SCRIPTS/lowbattery.m4a &
			notified=1
		fi
	else
		notified=0
	fi
	sleep $delay
done
