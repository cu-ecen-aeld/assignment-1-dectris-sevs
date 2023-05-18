#!/bin/bash

# Check if exactly two arguments are given
if [ $# -ne 2 ]; then
	>&2 echo 'This script accepts exactly two arguments. The first argument is a path to a directory on the filesystem. The second argument is a text string which will be searched within these files.'
	exit 1
fi

filesdir=$1
searchstr=$2

# Check if the directory $filesdir exist and exit with code 1 if not
if [ ! -d $filesdir ]; then
	>&2 echo "The directory '$filesdir' does not represent a directory on the filesystem."
	exit 1
fi

# Count how many files contain the $searchstr
x=$(grep --files-with-matches --recursive "$searchstr" "$filesdir" 2> /dev/null | wc --lines)
# Count how many lines are matching the $searchstr
y=$(grep --recursive "$searchstr" "$filesdir" 2> /dev/null | wc --lines)

# Print to stdout the results
echo "The number of files are $x and the number of matching lines are $y"

exit 0
