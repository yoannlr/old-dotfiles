res=$(echo "Lock\\nShutdown\\nReboot\\nSuspend\\nQuit i3" | dmenu -p "Options")
case $res in
	"Lock")
		$HOME/.scripts/lock.sh
		;;
	"Shutdown")
		systemctl poweroff
		;;
	"Reboot")
		systemctl reboot
		;;
	"Suspend")
		systemctl suspend
		;;
	"Quit i3")
		i3-msg exit
		;;
esac
