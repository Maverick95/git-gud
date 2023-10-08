BEGIN {
    RS = ""
    FS = "(\n|(: *))"
}
$6 != "N/A" {
    print $0
    print ""
}