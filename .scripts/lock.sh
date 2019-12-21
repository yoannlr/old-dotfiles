#!/bin/sh
#i3lock -e -i "$HOME/pics/walls/lockscreen.png" -t --nofork

if [ "${1}" = "full" ]
then
	[ "$(audtool --playback-status)" = 'playing' ] && audacious --pause
	# yeah, apparently no other way to only pause, only behaviour is "toggle play/pause"

	$SCRIPTS/volume.sh mute
fi

i3lock-color --clock -t -i "$HOME/pics/walls/lockscreen.png" --datecolor=ffffffff --timecolor=ffffffff --datestr='%d %b %Y' --veriftext=''
