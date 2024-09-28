#!/bin/sh
# Use tasklist and awk to find processes that use services,
# print all of the unique services.
tasklist -svc -fo "list" |
awk -f './V3.awk' |
# A bit hacky but hey this is what we're using now I guess
sed -E 's/^\s+//' |
uniq |
sort
