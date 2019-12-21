primary=$(xclip -o)
actions=''

[ -z $primary ] && notify-send 'Wola ton presse papier est rempli de vacuité mon con' && exit 0

echo "$primary" | egrep '^(https?:\/\/)?(www\.)?(youtube\.com\/watch|youtu.be)' && actions="youtube-dl\nyoutube-dl (audio)\nyoutube-dl (to music)"
echo "$primary" | egrep '^(https?:\/\/)?(www\.)?soundcloud\.com' && actions="youtube-dl (audio)\nyoutube-dl (to music)"

action=$(echo -e "$actions" | dmenu -i -p "$(echo $primary | colrm 30)")
case $action in
	'copy')
		echo "$primary" | xclip -i -selection clipboard
	;;
	'youtube-dl')
		cd "$HOME/vids"
		notify-send -u low "$(echo -e "Download started to vids\n$primary")"
		youtube-dl --restrict-filenames "$primary" && notify-send -u low "$(echo -e "Download finished\n$primary")" && exit 0
		notify-send "An error occured while downloading $primary"
	;;
	'youtube-dl (audio)')
		cd "$HOME/disk"
		notify-send -u low "$(echo -e "Download started to disk\n$primary")"
		youtube-dl -f bestaudio --restrict-filenames "$primary" && notify-send -u low "$(echo -e "Download finished\n$primary")" && exit 0
		notify-send "An error occured while downloading $primary"
	;;
	'youtube-dl (to music)')
		[ ! -d "$HOME/music/$(date +%Y_%M)" ] && mkdir "$HOME/music/$(date +%Y_%m)"
		cd "$HOME/music/$(date +%Y_%m)"
		notify-send -u low "$(echo -e "Download started to music\n$primary")"
		youtube-dl -f bestaudio --restrict-filenames "$primary" && notify-send -u low "$(echo -e "Download finished\n$primary")" && exit 0
		notify-send "An error occured while downloading $primary"
	;;
esac
