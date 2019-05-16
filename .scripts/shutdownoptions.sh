#!/bin/bash

res=$(echo -e "Lock\\nShutdown\\nQuit i3\\nReboot\\nSuspend" | dmenu -p "Options")
case $res in
	"Lock")
		$HOME/.scripts/lock.sh
		;;
	"Shutdown")
		systemctl poweroff
		;;
	"Reboot")
		systemctl reboot
		;;
	"Suspend")
		systemctl suspend
		;;
	"Quit i3")
		i3-msg exit
		;;
esac
