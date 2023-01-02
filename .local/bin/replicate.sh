#!/bin/sh
# ./replicate [-i : in-place] file.json replace-what by-what

# [ $# -lt 4 ] && echo "usage: $0 [-i : in-place] file replace-what by-what" && exit 1

[ "$1" = "-i" ] && inplace=1 && shift 1
input="$1"
what="$2"
bywhat="$3"

echo "what: $what, bywhat: $bywhat"
[ "$what" = "$bywhat" ] && echo "what=bywhat, skipping" && exit 1

if [ -z $inplace ]
then
	output="${output_dir}$(echo ${input} | sed s/${what}/${bywhat}/g)"
	echo "output: ${output}"
	[ -e "${output}" ] && echo "output exists here, skipping" && exit 1
	sed "s/${what}/${bywhat}/g" "${input}" > "${output}"
else
	echo "in-place"
	sed -i "s/${what}/${bywhat}/g" "${input}"
fi
