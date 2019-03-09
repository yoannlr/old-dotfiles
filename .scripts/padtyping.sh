#!/bin/bash

[ ! -e $HOME/.scripts/trackpadstate ] && echo 0 > $HOME/.scripts/trackpadstate

padTyping=$(cat $HOME/.scripts/trackpadstate)

if [ $padTyping == "0" ]
then
	echo 1 > $HOME/.scripts/trackpadstate
	xinput --set-prop 12 304 1
	notify-send 'Pad disabled while typing'
else
	echo 0 > $HOME/.scripts/trackpadstate
	xinput --set-prop 12 304 0
	notify-send 'Pad enabled while typing'
fi

