# Here's a shell script that finds a file by name starting from a given directory and then counts the total number of words in the file:

#!/bin/bash

# Usage: ./find_and_count.sh <start_directory> <filename>

START_DIR="$1"
FILENAME="$2"

if [ $# -ne 2 ]; then
    echo "Usage: $0 <start_directory> <filename>"
    exit 1
fi

FILE_PATH=$(find "$START_DIR" -type f -name "$FILENAME" 2>/dev/null | head -n 1)

if [ -z "$FILE_PATH" ]; then
    echo "File '$FILENAME' not found."
    exit 1
fi

echo "Found file: $FILE_PATH"

WORD_COUNT=$(wc -w < "$FILE_PATH")
echo "Total words: $WORD_COUNT"