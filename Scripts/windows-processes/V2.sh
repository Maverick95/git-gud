#!/bin/sh
# Use tasklist and awk to find processes that use services,
# print all of these.
# This version prints the service name first in sorted order.
# Looks like there are no dupes of service across processes.
tasklist -svc -fo "list" |
awk -f './V2.awk' |
# A bit hacky
sed -E 's/^\s+//' |
sort