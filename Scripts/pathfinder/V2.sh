#!/bin/sh
echo "$PATH" |
tr [=:=] '\n' |
sed -E 's/(.*)/[ -d "\1" ] \&\& echo "\1"/;e' |
xargs -i find {} -maxdepth 1 -name "$1.exe" |
sort