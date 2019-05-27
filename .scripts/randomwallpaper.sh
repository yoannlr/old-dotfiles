#!/bin/sh
feh --bg-fill $(du -a $HOME/Pictures/Backgrounds/ | sort -R | head -1 | awk '{print $2}') &
