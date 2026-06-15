# To transpose a file (convert rows into columns and columns into rows) in a shell script, you can use awk.

# using as a shell command.

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
}' data.txt