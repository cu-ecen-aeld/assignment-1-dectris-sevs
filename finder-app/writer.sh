#!/bin/bash

# Check if exactly two arguments are given
if [ $# -ne 2 ]; then
	>&2 echo 'This script accepts exactly two arguments. The first argument is a full path to a file on the filesystem. The second argument is a text string which will be written within this file.'
	exit 1
fi

writefile=$1
writestr=$2

# Create directory if it does not yes exist
if [ ! -d $(dirname "$writefile") ]; then
	mkdir -p $(dirname "$writefile")
fi

# Write $writestr to $writefile
echo "$writestr" > "$writefile"

exit 0
