#!/bin/sh
# Transforms the contents of the registry
# responsible for performance DLL Counter info
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Perflib\009" -f "Counter" -e -v |
# These commands clear out unnecessary lines and whitespace
head -n -2 |
tail -n +2 |
sed -E 's/^ *(.*) *$/\1/' |
awk 'BEGIN { RS = "\n\n"; FS = "(\n)|(   *)"; OFS = "|" } { print $1,$2,$3,$4 }' |
awk 'BEGIN { FS = "|" } { print $4 }' |
sed -E 's/\\0/\n/g'
