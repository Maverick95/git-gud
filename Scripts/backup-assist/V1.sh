#!/bin/sh
# For Windows backups, you can't tell it to ignore
# backing up node_modules folders inside npm package projects,
# which makes it take f***ing ages.
# This is designed to delete all those folders.
find "$1" -name "package.json" |
sed "s/\(.*\)\/package.json$/\1\/node_modules/" |
rm -fdR