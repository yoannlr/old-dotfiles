#!/bin/bash

[ -z $SUDO_ASKPASS ] && export SUDO_ASKPASS="${SCRIPTS}/sudoaskpass.sh"

drives=$(lsblk -nro name,type,size,mountpoint | awk '{if($2=="part" && $4==""){print $1 " (" $3 ") "}}')

[ -z $drives ] && notify-send 'Nothing to mount' && exit 0

drive=$(echo "$drives" | dmenu -p 'Mount' | awk '{print $1}')
echo $drive
[ -z $drive ] && exit 0

[ ! -e "${HOME}/mnt/$drive" ] && mkdir -p "${HOME}/mnt/$drive"

if ! mountpoint -q "${HOME}/mnt/$drive"
then
	sudo -A mount "/dev/$drive" "${HOME}/mnt/$drive"
	notify-send "Mounted /dev/$drive to ${HOME}/mnt/$drive"
	exit 0
fi
