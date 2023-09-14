#!/bin/bash
search_dir=$1
for entry in "$search_dir"/*
do
	if [ ! -s $entry ]; then
		echo $entry
	fi
done
