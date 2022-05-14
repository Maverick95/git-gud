#!/bin/sh

# Function for inserting lines into script
insert_vars()
{
    LINE=0
    while read NEXT
    do
        if [ $LINE -eq 1 ]; then
            echo "TARGET_NAME=\"$1\""
            echo "TARGET_EMAIL=\"$2\""
        fi
        echo $NEXT
        LINE=`expr $LINE + 1`
    done
}

# Main script
# Commands are required to be in the order [-u] -n NAME [OTHER_NAMES...] -e EMAIL [OTHER_EMAILS...] -h HOOKS

if [ "$1" = "-u" ]; then
    SET_USER="Y"
    shift
fi
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
# Update .gitconfig user file for user if required.
[ "$SET_USER" ] && (
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
)
# For each remaining argument, check the folder exists within user directory, if not create it.
HOOKS="$USERPROFILE"
while [ $# -gt 0 ]
do
    HOOKS="$HOOKS""\\""$1"
    [ ! -d "$HOOKS" ] && mkdir "$HOOKS"
    shift
done
git config --global core.hooksPath "$HOOKS"
cat ./Scripts/workshy/V1.sh | insert_vars "$NAME" "$EMAIL" >> "$HOOKS\\commit-msg"
