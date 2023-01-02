export SCREENLAYOUTS="$HOME/.local/screenlayout"
export TERMINAL='mate-terminal'
export BROWSER='firefox'
export FILE='thunar'
export SYSINFO='mate-system-monitor'
export WALLPAPERS="$HOME/pics/Wallpapers/"
export XDG_CURRENT_DESKTOP='X-Generic'

# get a dmenu prompt when an app asks for password
export SUDO_ASKPASS='dmenupass'

# allow tweaking of qt application via qt5ct
export QT_QPA_PLATFORMTHEME='qt5ct'

# configure devices
nvidia-modprobe
xinput set-prop 'DELL086F:00 06CB:7E92 Touchpad' 'libinput Tapping Enabled' 1
backlight 36000

# configure monitors
batstatus=$(cat /sys/class/power_supply/BAT0/status)
[ ! "$batstatus" = "Discharging" ] && xrandr | grep -E '\bconnected\b' | grep 'HDMI' &> /dev/null && $SCREENLAYOUTS/external.sh || $SCREENLAYOUTS/default
backlight 12000

# configure keyboard
setxkbmap fr
numlockx &

# configure lock screen
xset dpms 0 0 300
exec xss-lock --transfer-sleep-lock -- slock &

# audio
exec pipewire &
exec pipewire-pulse &
exec wireplumber &
exec mpd &

# graphical environment
exec sxhkd -m 1 &
exec redshift -l 48:2 -t 6500:3000 &
setwall -r &
exec xcompmgr &
exec /usr/lib/xfce4/notifyd/xfce4-notifyd &
exec thunar --daemon &
exec skippy-xd --start-daemon &

# applets
exec nm-applet &
exec cbatticon &
exec pasystray &
exec xpad &
exec flameshot &
exec blueman-applet &

# reminders
remind | xargs -I {} notify-send {}

# launch desktop selected in .profile
case "$CHOSEN_DE" in
	i3)
		exec i3
	;;
	dwm)
		exec dwm
	;;
	*)
		exec tint2 &
		exec openbox
	;;
esac
