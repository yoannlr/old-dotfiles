#!/bin/bash

[ -z $SUDO_ASKPASS ] && export SUDO_ASKPASS="${HOME}/.scripts/sudoaskpass.sh"

blacklist='(^sdb)'

nbDrives=$(lsblk -ro name,type,size,mountpoint | awk '{if($2=="part" && $4==""){print $1 " (" $3 ")"}}' | egrep -v $blacklist | wc -l)
if test $nbDrives -eq 0
then
	notify-send 'Nothing to mount'
	exit 0
fi

chosenDisk=$(lsblk -ro name,type,size,mountpoint | awk '{if($2=="part" && $4==""){print $1 " (" $3 ")"}}' | egrep -v $blacklist | dmenu -p "Mount")
[ -z $chosenDisk ] && exit 0

identifier=$(echo $chosenDisk | awk '{print "/dev/"$1}')

for f in $(find /media -type d -name '*usb*' | sort)
do
	if ! mountpoint -q "$f";
	then
		sudo -A mount "$identifier" "$f"
		notify-send "Mounted $identifier on $f"
		exit 0
	fi
done
