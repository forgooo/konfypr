#!/bin/bash
fline=$(head -n 1 $1)
fchar=${fline:0:1}
if [ "$fchar" = "/" ] || [ "$fchar" = "#" ]; then
	echo "Comment on first line"
else
	echo "No comment on first line"
fi
