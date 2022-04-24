#!/bin/sh
SLN_COUNT=0
# If an argument provided to this script, switch to this directory.
[ -n "$1" ] && cd $1
for i in ls -R
do
# Something in here???
done
echo "Total Solutions : $SLN_COUNT"