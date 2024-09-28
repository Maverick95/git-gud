#!/bin/sh
# Find all the services under the database,
# that have a Parameters sub-key containing a ServiceDll value.
reg query "HKLM\SYSTEM\CurrentControlSet\Services" -s -v "ServiceDll" -f "Parameters" -k |
# Required for grep matching
tr -d '\r' |
grep -i '\\Parameters$' |
awk -F '\' '{ print $(NF-1) }' |
sort
