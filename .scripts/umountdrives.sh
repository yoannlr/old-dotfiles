#!/bin/bash

[ -z $SUDO_ASKPASS ] && export SUDO_ASKPASS="${SCRIPTS}/sudoaskpass.sh"

mounts=$(lsblk -nro type,mountpoint | awk '{if($1=="part" && $2!="" && $2!="/" && $2!="/boot"){print $2}}')

if [ ! $(echo "$mounts" | wc -l) -gt 0 ]
then
	notify-send 'No drives mounted'
	exit 0
else
	mount=$(echo "$mounts" | dmenu -p 'Umount')
	if [ ! -z $mount ]
	then
		sudo -A umount $mount && notify-send "$mount unmounted"
	fi
fi

