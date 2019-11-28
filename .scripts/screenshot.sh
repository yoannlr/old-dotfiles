#!/bin/sh

file="$HOME/pics/screens/"

case ${1} in
	"f")
		file="${file}root_$(date +%s).png"
		import -window root "$file" && notify-send "$(echo -e "Screenshot saved\n$file")" && exit 0
		notify-send "Failed to take screenshot"
	;;
	"a")
		file="${file}area_$(date +%s).png"
		import "$file" && notify-send "$(echo -e "Screenshot saved\n$file")" && exit 0
		notify-send "Failed to take screenshot"
	;;
	"fc")
		import -window root png:- | xclip -selection clipboard -t image/png && notify-send "Screenshot saved to clipboard" && exit 0
		notify-send "Failed to take screenshot"
	;;
	"ac")
		import png:- | xclip -selection clipboard -t image/png && notify-send "Screenshot saved to clipboard" && exit 0
		notify-send "Failed to take screenshot"
	;;
esac
