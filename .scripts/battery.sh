#!/bin/sh

notified=0
status=$(cat /sys/class/power_supply/BAT0/status)
charge_now=$(cat /sys/class/power_supply/BAT0/charge_now)
charge_full=$(cat /sys/class/power_supply/BAT0/charge_full)
percent=$((charge_now / charge_full))

while /bin/true
do
	status=$(cat /sys/class/power_supply/BAT0/status)
	if [ "$status" = "Discharging" ]
	then
		charge_now=$(cat /sys/class/power_supply/BAT0/charge_now)
		charge_full=$(cat /sys/class/power_supply/BAT0/charge_full)
		percent=$((charge_now * 100 / charge_full))
		echo $percent
		if [ $percent -lt 10 ] && [ ! $notified -eq 1 ]
		then
			notify-send -u critical 'Low battery'
			mpv $SCRIPTS/lowbattery.m4a &
			notified=1
		fi
	else
		notified=0
	fi
	sleep 10
done
