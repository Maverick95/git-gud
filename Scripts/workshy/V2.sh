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

while getopts "un:e:" OPT; do
    case "$OPT" in
        "u" )
            SET_USER="Y";;
        "n" )
            NAME="$OPTARG";;
        "e" )
            EMAIL="$OPTARG";;
    esac
done

shift `expr $OPTIND - 1`

if [ $# -eq 0 ]; then
    exit 1
fi

if [ "$SET_USER" ]; then
    git config --global user.name "$NAME"
    git config --global user.email "$EMAIL"
fi

HOOKS="$USERPROFILE"
while [ $# -gt 0 ]
do
    HOOKS="$HOOKS""\\""$1"
    [ ! -d "$HOOKS" ] && mkdir "$HOOKS"
    shift
done
git config --global core.hooksPath "$HOOKS"
(insert_vars "$NAME" "$EMAIL" > "$HOOKS\\commit-msg") < ./Scripts/workshy/commit-msg-base
