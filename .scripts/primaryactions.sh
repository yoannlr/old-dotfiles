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
		cd "$HOME/vids"
		notify-send -u low "$(echo -e "Download started to vids\n$primary")"
		youtube-dl --restrict-filenames "$primary"
		if [ $? -eq 0 ]
		then
			notify-send -u low "$(echo -e "Download finished\n$primary")"
			mpv "$SCRIPTS/success.m4a" &
		else
			notify-send "An error occured while downloading $primary"
		fi
	;;
	'youtube-dl (audio)')
		cd "$HOME/disk"
		notify-send -u low "$(echo -e "Download started to disk\n$primary")"
		youtube-dl -f bestaudio --restrict-filenames "$primary"
		if [ $? -eq 0 ]
		then
			notify-send -u low "$(echo -e "Download finished\n$primary")"
			mpv "$SCRIPTS/success.m4a" &
		else
			notify-send "An error occured while downloading $primary"
		fi
	;;
	'youtube-dl (to music)')
		playlist="$HOME/music/$(date +%Y_%m)"
		[ ! -d "$playlist" ] && mkdir "$playlist" && notify-send "Created new monthly playlist"
		cd "$playlist"
		notify-send -u low "$(echo -e "Download started to music\n$primary")"
		youtube-dl -f bestaudio --restrict-filenames "$primary"
		if [ $? -eq 0 ]
		then
			notify-send -u low "$(echo -e "Download finished\n$primary")"
			mpv "$SCRIPTS/success.m4a" &
		else
			notify-send "An error occured while downloading $primary"
		fi
	;;
esac
