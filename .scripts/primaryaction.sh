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
		search=$(echo -e "DDG\\nWikipedia\\nWikitionary" | dmenu -p "With")
		firefox --url $(cat $HOME/.scripts/urls | awk -v s="$search" '{if($1==s){print $2}}' | sed -e s/'_search_'/"$content"/g)
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


