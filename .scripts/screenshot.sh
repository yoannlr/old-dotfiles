#!/bin/sh

file="$HOME/pics/screens/"

case ${1} in
	"f")
		file="${file}root_$(date +%s).png"
		maim > "$file" && notify-send "Captured the whole screen to $file" || notify-send "Failed to take screenshot"
	;;
	"a")
		file="${file}area_$(date +%s).png"
		maim -s > "$file" && notify-send "Captured the area to $file" || notify-send "Failed to take screenshot"
	;;
	"fc")
		maim | xclip -selection clipboard -t image/png && notify-send "Captured the whole screen to the clipboard" || notify-send "Failed to take screenshot"
	;;
	"ac")
		maim -s | xclip -selection clipboard -t image/png && notify-send "Captured the area to the clipboard" || notify-send "Failed to take screenshot"
	;;
esac
