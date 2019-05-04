xinput set-prop 'DELL086F:00 06CB:7E92 Touchpad' 'libinput Tapping Enabled' 1
numlockx &
xrandr --output eDP-1 --brightness 0.5
exec compton --opacity-rule '80:class_g="st-256color"' &
export $(dbus-launch)
export SUDO_ASKPASS=$HOME/.scripts/sudoaskpass.sh
export TERMINAL=st
export BROWSER=firefox
exec i3
