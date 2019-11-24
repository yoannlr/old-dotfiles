primary=$(xclip -o)
actions='copy'

[ -z $primary ] && notify-send 'Empty' && exit 0

echo "$primary" | egrep '^(https?:\/\/)?(www\.)?(youtube\.com\/watch|youtu.be)' && actions="$actions\nyoutube-dl\nyoutube-dl (audio)\nyoutube-dl (to music)"
echo "$primary" | egrep '^(https?:\/\/)?(www\.)?soundcloud\.com' && actions="$actions\nyoutube-dl (audio)\nyoutube-dl (to music)"

action=$(echo -e "$actions" | dmenu -i -p "$(echo $primary | colrm 30)")
case $action in
	'copy')
		echo "$primary" | xclip -i -selection clipboard
	;;
	'youtube-dl')
		cd "$HOME/vids"
		notify-send -u low "$(echo -e "Download started to ~/vids\n$primary")"
		youtube-dl --restrict-filenames "$primary" && notify-send -u low "$(echo -e "Download finished\n$primary")"
	;;
	'youtube-dl (audio)')
		cd "$HOME/disk"
		notify-send -u low "$(echo -e "Download started to ~/disk\n$primary")"
		youtube-dl -f bestaudio --restrict-filenames "$primary" && notify-send -u low "$(echo -e "Download finished\n$primary")"
	;;
	'youtube-dl (to music)')
		cd "$HOME/music"
		notify-send -u low "$(echo -e "Download started to ~/music\n$primary")"
		youtube-dl -f bestaudio --restrict-filenames "$primary" && notify-send -u low "$(echo -e "Download finished\n$primary")"
	;;
esac
