#!/bin/sh
# This will list the name of a .exe if it exists in your path.
echo "$PATH" |
tr [=:=] "\n" |
xargs -I "{}" ls -1 --color=no --file-type "{}" |
grep -i "$1.exe$" |
sort