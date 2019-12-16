#!/bin/sh

# this script is executed as source (in order to use the cd command), so I use return instead of exit

[ "${1}" == "list" ] && cat $SCRIPTS/bookmarks && return
[ "${1}" == "add" ] && echo "${2}" >> $SCRIPTS/bookmarks && return

loc=$(fzf --reverse --color bw < "$SCRIPTS/bookmarks")
[ ! -z "$loc" ] && cd "$loc"
