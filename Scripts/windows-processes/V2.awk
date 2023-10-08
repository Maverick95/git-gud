BEGIN {
    RS = ""
    FS = "(\n|(: *))"
}
$6 != "N/A" {
    for (i = 6; i <= NF; i++)
        print $i, $2
}