BEGIN {
    FS = "[ ]{4}"
    OFS = "|"
    REGENTRY_COPY = REGENTRY
    gsub(/[^\\]/, "", REGENTRY_COPY)
    SLASHES = 1 + length(REGENTRY_COPY)
    STATE = 1
    KEY = ""
} {
    if (STATE == 1)
    {
        KEY = $0
        for (i=0; i < SLASHES; i++)
        {
            sub(/^[^\\]*/, "", KEY)
            sub(/^\\/, "", KEY)
        }
        STATE = 2
    }
    else if (STATE == 2 && $0 == "")
    {
        STATE = 1
        KEY = ""
    }
    else
    {
        print REGENTRY,KEY,$2,$3,$4
    }
}