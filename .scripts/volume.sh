#!/bin/sh

case ${1} in
	"inc")
		pactl set-sink-volume @DEFAULT_SINK@ +10% && canberra-gtk-play -i audio-volume-change &
	;;
	"dec")
		pactl set-sink-volume @DEFAULT_SINK@ -10% && canberra-gtk-play -i audio-volume-change &
	;;
	"mute")
		pactl set-sink-mute @DEFAULT_SINK@ toggle && canberra-gtk-play -i audio-volume-change &
	;;
	"mutemic")
		pactl set-source-mute @DEFAULT_SOURCE@ toggle
	;;
esac
