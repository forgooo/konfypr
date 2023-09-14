#!/bin/bash
fname=$1
chmod 755 $fname
mv $fname ~/.local/bin
echo done
