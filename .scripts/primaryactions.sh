#!/bin/sh

# $1 : url
# $2 : path
# $3 : command options
ytdl() {
	cd "$2"
	notify-send -u low "$(echo -e "Download started to $2\n$1")"
	if [ -z "$3" ]
	then
		youtube-dl --restrict-filenames "$1"
	else
		echo "$3"
		youtube-dl --restrict-filenames $3 "$1"
	fi
	if [ $? -eq 0 ]
	then
		notify-send -u low "$(echo -e "Download finished\n$1")"
		mpv "$SCRIPTS/success.m4a" &
	else
		notify-send "Failed to download $1"
	fi
}

primary=$(xclip -o)
actions="copy\nqrencode"

[ -z $primary ] && notify-send 'Empty' && exit 0

echo "$primary" | egrep '^(https?:\/\/)?(www\.)?(youtube\.com\/watch|youtu.be)' && actions="$actions\nyoutube-dl\nyoutube-dl (audio)\nyoutube-dl (to music)"
echo "$primary" | egrep '^(https?:\/\/)?(www\.)?soundcloud\.com' && actions="$actions\nyoutube-dl (audio)\nyoutube-dl (to music)"

action=$(echo -e "$actions" | dmenu -i -p "$(echo $primary | colrm 30)")
case $action in
	'copy')
		echo "$primary" | xclip -i -selection clipboard
	;;
	'qrencode')
		qrencode "$primary" -s 20 -o /tmp/qr.png && sxiv /tmp/qr.png
	;;
	'youtube-dl')
		ytdl "$primary" "$HOME/vids" "--add-metadata" # --embed-thumbnail
	;;
	'youtube-dl (audio)')
		ytdl "$primary" "$HOME/disk" "-f bestaudio"
	;;
	'youtube-dl (to music)')
		playlist="$HOME/music/$(date +%Y_%m)"
		[ ! -d "$playlist" ] && mkdir "$playlist" && notify-send "Created new monthly playlist"
		ytdl "$primary" "$playlist" "--add-metadata -f bestaudio" # --embed-thumbnail
	;;
esac
