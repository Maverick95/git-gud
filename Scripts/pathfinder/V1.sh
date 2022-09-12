#!/bin/sh

SED_FIND="\
\(.*\)\
"
SED_REPLACE="\
[ -d \"\1\" ] \
\&\& \
echo \"\1\"\
"

echo "$PATH" |
tr [=:=] "\n" |
sed "s/$SED_FIND/$SED_REPLACE/;e" |
grep ".\+" |
xargs -I "{}" ls -1 --color=no --file-type "{}" |
grep -i "$1.exe$" |
sort