#!/bin/bash

i3status | while :
do
	read line
	echo $(free -h | awk '/^Mem:/{print "U: " $3 " F: " $7}') "| $line" || exit 1
done
