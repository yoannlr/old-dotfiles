#!/bin/sh

wall=${1}
if [ -z $wall ]
then
	setsid -f sxiv -t $HOME/pics/walls/*.{jpg,jpeg,png}
else
	ln -s -f "$wall" "$HOME/pics/walls/wall"
	mode=$(echo -e 'Extend to all monitors\nSame on each monitor' | dmenu -p 'Wallpaper options')
	if [ "$mode" = "Same on each monitor" ]
	then
		xwallpaper --zoom $HOME/pics/walls/wall
	else
		xwallpaper --no-randr --zoom $HOME/pics/walls/wall
	fi
	wal -c
	wal -qtn -i $HOME/pics/walls/wall
fi
