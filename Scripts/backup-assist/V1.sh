#!/bin/sh
# For Windows backups, you can't tell it to ignore
# backing up node_modules folders inside npm package projects,
# which makes it take f***ing ages.
# This is designed to delete all those folders.
find "c:/users/nick/documents/programming" -name "package.json" |
sed "s/\(.*\)\/package.json$/\1\/node_modules/;" |
xargs -I "{}" [ -d "{}" ] && rm -fiR "{}"
