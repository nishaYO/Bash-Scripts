#!/bin/bash
# script to search for a set of keywords in all the files in a dir
if [ $# -lt 2 ]; then
    echo "Usage: $0 <directory> <keyword1> [<keyword2> ...]"
    exit 1
fi

directory="$1"
shift

keywords=("$@")

# Find files and search for keywords
find "$directory" -type f -exec grep -H "${keywords[*]}" {} +

exit 0
