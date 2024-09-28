#!/bin/sh
# Retrieve the running order for services starting
reg query "HKLM\SYSTEM\CurrentControlSet\Control\ServiceGroupOrder" -f "List" -v |
# These commands clear out unnecessary lines and whitespace
head -n -2 |
tail -n +2 |
sed -E 's/^ *(.*) *$/\1/' |
awk 'BEGIN { RS = "\n\n"; FS = "(\n)|(   *)"; OFS = "  " } { print $4 }' |
sed -E 's/\\0/\n/g'