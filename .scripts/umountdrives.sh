#!/bin/bash

[ -z $SUDO_ASKPASS ] && export SUDO_ASKPASS="${HOME}/.scripts/sudoaskpass.sh"

nbMounts=$(lsblk -nro type,mountpoint | awk '{if($1=="part" && $2!=""){print $2}}' | grep '^/media' | wc -l)
if test $nbMounts -eq 0
then
	notify-send 'No mounts'
	exit 0
fi

mountpoint=$(lsblk -nro type,mountpoint | awk '{if($1=="part" && $2!=""){print $2}}' | egrep '^/media' | dmenu -p "Umount")
[ ! -z $mountpoint ] && sudo -A umount $mountpoint
