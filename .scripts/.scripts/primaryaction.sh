content=$(xclip -o)
[ -z $content ] && exit 0
#mail: egrep '[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]'
#url: egrep 'https?://[a-ZA-Z0-9]+\.[a-ZA-Z0-9]+/?'


action=$(echo "Search\\nMaps\\nFile" | dmenu -p "Clipboard action")
case $action in
	"Search")
		firefox --url "https://duckduckgo.com/?q=$content" &
		;;
	"Maps")
		firefox --url "https://maps.google.com/?q=$content" &
		;;
	"File")
		name=$(echo "clipboard-output" | dmenu -p "Output: ")
		[ ! -z $name ] && echo $content >> $name
		;;
	"*")
		exit 0
esac


