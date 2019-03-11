#!/bin/bash

content=$(xclip -o)

if [ $(echo $content | wc -c) -eq 0 ]
then
	notify-send 'Nothing selected'
	exit 0
fi

actions="Search\\nFile"
[ ! -z $(echo $content | egrep '[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]') ] && actions="Mail\\n${actions}"
[ ! -z $(echo $content | egrep 'https?://[a-ZA-Z0-9]+\.[a-ZA-Z0-9]+/?') ] && actions="Go\\n${actions}"

action=$(echo -e $actions | dmenu -p "Clipboard content")
case $action in
	"Search")
		search=$(cat $HOME/.scripts/urls | awk '{print $1}' | dmenu -p "With")
		[ ! -z $search ] && firefox --url $(cat $HOME/.scripts/urls | awk -v s="$search" -v what="$content" '{if($1==s){gsub("_search_", what, $2); gsub(" ", "+", $2); print $2}}')
		;;
	"File")
		name=$(echo "clipboard-output" | dmenu -p "Output: ")
		[ ! -z $name ] && echo $content >> $name
		;;
	"Mail")
		;;
	"Go")
		firefox --url $content
		;;
	"*")
		exit 0
esac
