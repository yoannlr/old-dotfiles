#!/bin/sh

[ $# -lt 1 ] && exit 1

for img in $@
do
	currentsize=$(identify -format '%[fx:w]x%[fx:h]' "$img")
	newsize=$(zenity --title 'Resize image' --text "Resize ${img}\nCurrent size is ${currentsize}px" --entry)
	[ ! -z $newsize ] && convert -resize "$newsize" "$img" "${img%.*}_${newsize}.${img##*.}" || notify-send "$(echo -e "Resize failed\n$img $newsize")"
done
