#!/bin/bash

if [ "${1}" == "rgb" ]
then
	echo "$(grabc 2>&1 > /dev/null)" | tr -d '\n' | sed s/','/', '/g | xclip -i -selection "clipboard"
	notify-send "$(xclip -o -selection 'clipboard') copied to clipboard"
else
	echo "$(grabc 2>/dev/null)" | tr -d '\n' | xclip -i -selection "clipboard"
	notify-send "$(xclip -o -selection 'clipboard') copied to clipboard"
fi
