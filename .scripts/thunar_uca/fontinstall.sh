#!/bin/sh

FONTSDIR="$HOME/.local/share/fonts"

[ ! -d "$FONTSDIR" ] && mkdir "$FONTSDIR"

for arg in $@
do
	cp "$arg" "$FONTSDIR/"
done

notify-send 'Fonts installed'
