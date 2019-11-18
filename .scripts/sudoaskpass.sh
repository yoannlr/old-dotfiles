#!/bin/bash
message="${1}"
[ -z "$message" ] && message="Password"
echo $(dmenu -p "$message" -sb "#a00000" -nf "#000000" -nb "#000000"<&-)
