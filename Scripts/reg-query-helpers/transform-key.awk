BEGIN {
    OFS = "|"
    REGENTRY_COPY = REGENTRY
    gsub(/[^\\]/, "", REGENTRY_COPY)
    SLASHES = 1 + length(REGENTRY_COPY)
} {
    for (i=0; i < SLASHES; i++)
    {
        sub(/^[^\\]*/, "")
        sub(/^\\/, "")
    }
    print REGENTRY,$0
}