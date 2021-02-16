#!/bin/sh

openlink() {
	url=$(echo $1 | cut -d'@' -f2)
	$BROWSER "$url"
}

openfolder() {
	cd $1 && $FILE
}

openterminal() {
	cd $1 && $TERMINAL
}

loc=$(dmenu -i -l 20 -p "$2" < "$1")
[ ! -z "$loc" ] && "${3}" "$loc"
