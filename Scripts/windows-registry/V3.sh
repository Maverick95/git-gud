#!/bin/sh
# Find all the services that run under service groups
# These SHOULD match to all the services from V2.sh
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" -f "*" -d |
# These commands clear out unnecessary lines and whitespace
head -n -2 |
tail -n +3 |
sed -E 's/^ *(.*) *$/\1/' |
awk 'BEGIN { FS="   *" } { print $3 }' |
sed -E 's/\\0/\n/g' |
uniq |
sort

