# If you want to find all files with a given name pattern and count the total number of words in each file found, you can use:

#!/bin/bash

# Usage: ./count_words_in_found_files.sh <start_directory> <file_pattern>

START_DIR="$1"
PATTERN="$2"

if [ $# -ne 2 ]; then
    echo "Usage: $0 <start_directory> <file_pattern>"
    exit 1
fi

find "$START_DIR" -type f -name "$PATTERN" | while read -r FILE
do
    WORD_COUNT=$(wc -w < "$FILE")
    echo "$FILE : $WORD_COUNT words"
done

# If you want to count the occurrences of each word (e.g., the = 15, file = 8) instead of just the total word count, use:

tr -cs '[:alnum:]' '\n' < "$FILE_PATH" |
tr '[:upper:]' '[:lower:]' |
sort |
uniq -c |
sort -nr