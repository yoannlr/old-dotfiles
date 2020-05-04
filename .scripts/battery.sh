#!/bin/sh

# $1 : power source (usually BAT0)
# $2 : delay between each check
# $3 : low battery treshold

if [ $# -lt 3 ]
then
	echo "Usage: $0 <power source (usually BAT0)> <delay between checks> <low battery treshold>"
	exit 1
fi

powersource=$1
[ ! -d "/sys/class/power_supply/$powersource" ] && powersource='BAT0'

statfile="/sys/class/power_supply/$powersource/status"
capfile="/sys/class/power_supply/$powersource/capacity"

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
