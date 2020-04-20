#!/bin/sh
loc=$(dmenu -i -l 20 < $SCRIPTS/bookmarks)
[ ! -z "$loc" ] && cd "$loc" && ${1}
