#!/bin/sh
# Use tasklist and awk to find processes that use services,
# print all of these.
tasklist -svc -fo "list" |
awk -f './V1.awk' |
sort