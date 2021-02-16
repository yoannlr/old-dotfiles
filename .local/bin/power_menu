#!/bin/sh
action=$(echo -e 'cancel\nquit i3\npoweroff\nreboot\nsuspend\nupdate and shutdown' | dmenu -p 'power options')

[ -z "$action" ] && exit 0

case $action in
	'poweroff')
		systemctl poweroff
	;;
	'reboot')
		systemctl reboot
	;;
	'suspend')
		systemctl 'suspend'
	;;
	'quit i3')
		i3-msg exit
	;;
	'update and shutdown')
		xfce4-terminal -e 'sudo pacman -Syu' -T "Updating system"
		systemctl poweroff
	;;
	*)
		exit 0
esac
