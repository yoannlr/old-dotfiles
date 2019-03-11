xinput set-prop 'DELL086F:00 06CB:7E92 Touchpad' 'libinput Tapping Enabled' 1
numlockx &
xrandr --output eDP-1 --brightness 0.5
xrdb $HOME/.Xresources
export $(dbus-launch)
export SUDO_ASKPASS=$HOME/.scripts/sudoaskpass.sh
exec i3
