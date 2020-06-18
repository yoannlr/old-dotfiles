#!/bin/sh

wall=${1}
if [ -z $wall ]
then
	setsid -f sxiv -t $HOME/pics/walls/*.{jpg,jpeg,png}
else
	ln -s -f "$wall" "$HOME/pics/walls/wall"
	xwallpaper --no-randr --zoom $HOME/pics/walls/wall
	wal -c
	wal -qtn -i $HOME/pics/walls/wall
fi
