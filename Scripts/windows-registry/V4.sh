#!/bin/sh
# Find services with a Group value, and print their name alongside it.
reg query "HKLM\SYSTEM\CurrentControlSet\Services" -s -f "Group" -e -v |
# These commands clear out unnecessary lines and whitespace
head -n -2 |
tail -n +2 |
sed -E 's/^ *(.*) *$/\1/' |
awk 'BEGIN { RS = "\n\n"; FS = "(\n)|(   *)"; OFS = "|" } { print $4,$1 }' |
sed -E 's/\|.*\\(.*)$/\|\1/' |
sort


