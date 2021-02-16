#!/bin/sh

file="$HOME/pics/screens/"
[ ! -d "$file" ] && mkdir "$file"
now="$(date '+%Y-%m-%d_%H%M%S')"

case ${1} in
	"f")
		file="${file}fullscreen_${now}.png"
		maim > "$file" && notify-send "📷 Captured the whole screen to $file" || notify-send "Failed to take screenshot"
	;;
	"a")
		file="${file}region_${now}.png"
		maim -su > "$file" && notify-send "📷 Captured the area to $file" || notify-send "Failed to take screenshot"
	;;
	"fc")
		maim | xclip -selection clipboard -t image/png && notify-send "📷 Captured the whole screen to the clipboard" || notify-send "Failed to take screenshot"
	;;
	"ac")
		maim -su | xclip -selection clipboard -t image/png && notify-send "📷 Captured the area to the clipboard" || notify-send "Failed to take screenshot"
	;;
esac
