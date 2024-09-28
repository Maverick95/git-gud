#!/bin/bash
REG_QUERY="HKLM\System\CurrentControlSet\Services"
NUM_SLASHES=$(( 1 + $(
    echo -n "$REG_QUERY" |
    sed -E 's/[^\\]//g' |
    wc -m
) ))
SED_REPLACE="([^\\\\]*\\\\){$NUM_SLASHES}"

reg query "$REG_QUERY" -f "*" -k -s |
tail -n +2 |
head -n -1 |
sed -E "s/$SED_REPLACE//"
