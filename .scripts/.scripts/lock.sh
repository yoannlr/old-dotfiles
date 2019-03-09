i3lock -i $(cat $HOME/.config/nitrogen/bg-saved.cfg | awk -F '=' '/^file/{print $2}')
