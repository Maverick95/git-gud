#!/bin/sh
[ $# -eq 0 ] && exit 1
[ "$1" != "-n" ] && exit 1
shift
[ "$1" = "-e" ] && exit 1
NAME="$1"
shift
while [ $# -gt 0 -a "$1" != "-e" ]
do
    NAME="$NAME"" ""$1"
    shift
done
[ $# -eq 0 ] && exit 1
shift
EMAIL="$1"
shift
[ "$1" != "-h" ] && exit 1
shift
[ $# -eq 0 ] && exit 1
# At this point, remaining arguments are all hook folders.
# Update .gitconfig user file.
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
# For each remaining argument, check the folder exists within user directory, if not create it.
HOOKS="$USERPROFILE"
cd "$HOOKS"
while [ $# -gt 0 ]
do
    [ ! -d "$1" ] && mkdir "$1"
    cd "$1"
    HOOKS="$HOOKS""\\""$1"
    shift
done
git config --global core.hooksPath "$HOOKS"
SCRIPT_FILE=`date +%s`
# Nearly at the end now.
# Need to create the commit-msg file and copy to hooks folder.
# Didn't notice I changed directory above inside the script.
# Old script below
# cp -T ./Scripts/workshy/V1.sh "$USERPROFILE\\Git\\Hooks\\commit-msg"