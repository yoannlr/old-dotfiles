#!/bin/sh
action=$(echo -e 'cancel\nquit i3\npoweroff\nreboot\nsuspend' | dmenu -p 'power options')

[ -z $action ] && exit 0

case $action in
	'poweroff')
		systemctl poweroff
	;;
	'reboot')
		systemctl reboot
	;;
	'suspend')
		$SCRIPTS/lock.sh &
		systemctl 'suspend'
	;;
	'quit i3')
		i3-msg exit
	;;
	*)
		exit 0
esac
