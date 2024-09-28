#!/bin/sh
# Prints out all of the database service sub-keys in the registry
SERVICES='HKLM\SYSTEM\CurrentControlSet\Services'
reg query "$SERVICES" |
grep '\\' |
awk -F '\' '{ print $NF }' |
sort
