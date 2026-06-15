# Here's a shell script that finds a file by name starting from a given directory and then counts the total number of words in the file:

#!/bin/bash

FILE="$1"

awk '
{
    for (i = 1; i <= NF; i++) {
        a[NR,i] = $i
    }
    if (NF > max_nf) max_nf = NF
}
END {
    for (i = 1; i <= max_nf; i++) {
        for (j = 1; j <= NR; j++) {
            printf "%s%s", a[j,i], (j == NR ? ORS : OFS)
        }
    }
}' "$FILE"