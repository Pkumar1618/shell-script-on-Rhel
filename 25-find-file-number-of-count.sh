# find the file and count the each number of word in shell script
# If you want a shell script that finds a file and counts the occurrences of each word in that file, you can use:

#!/bin/bash

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE"
    exit 1
fi

tr -cs '[:alnum:]' '\n' < "$FILE" |
tr '[:upper:]' '[:lower:]' |
sort |
uniq -c |
sort -nr