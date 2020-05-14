#!/bin/sh

# this script is called by vim when saving a *.todo file
# therefore, it requires some config in vimrc:
#
#	autocmd BufWritePost *.todo !sorttodo.sh %
#
# it will add the date and time for the completed tasks
# and put the completed tasks at the end of the file

todofile="$1"

sed -r -i "s/^# ([A-Za-z0-9])/# \[$(date '+%Y-%m-%d %H:%M')\] \1/g" "$todofile"
sort -r -o "$todofile" "$todofile"
