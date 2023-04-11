#!/bin/sh
# Underneath a given directory, find all migration code files.
[ ! -d "$1" ] && exit 1
find "$1" -regextype 'posix-egrep' -iregex '.*/migrations/[0-9]{14,15}_.*\.cs' -not -ipath '*/bin/*'
# Would be a good time to look at awk.
