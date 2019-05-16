#!/bin/bash
message="${1}"
[ -z "$message" ] && message="Enter your password"
echo $(dmenu -p "$message" -sb "#a00000" -nf "#000000" -nb "#000000"<&-)
