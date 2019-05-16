#!/bin/bash

# this script is executed as source (in order to use the cd command), so I use return instead of exit

[ "${1}" == "list" ] && cat $HOME/.scripts/bookmarks && return
[ "${1}" == "add" ] && echo "${2}" >> $HOME/.scripts/bookmarks && return

cd $(cat $HOME/.scripts/bookmarks | fzy)
