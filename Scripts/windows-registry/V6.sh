#!/bin/sh
# Prints out the Start value of every service
reg query "HKLM\SYSTEM\CurrentControlSet\Services" -s -f "Start" -e -v |
# These commands clear out unnecessary lines and whitespace
head -n -2 |
tail -n +2 |
sed -E 's/^ *(.*) *$/\1/' |
awk 'BEGIN { RS = "\n\n"; FS = "(\n)|(   *)"; OFS = "|" } { print $1,$4 }' |
sed -E 's/^.*\\([^\\]*)\|(.*)$/\1\|\2/'