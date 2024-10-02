#!/bin/bash
# First draft of your registry helper script

DIR=$(echo "${0%/*}")
OPT_DATA=
ARGS_PROCESSED=0
ARG_REGENTRY=
ARG_CATEGORY=
RECURSIVE=0

while [[ $# -gt 0 ]]
do
    case "$1" in
        (-f)
            OPT_DATA="$2"
            shift 2
            ;;
        (-s)
            RECURSIVE=1
            shift
            ;;
        (-k|-v|-d)
            if [[ -n "$ARG_CATEGORY" ]]
            then
                echo "Only supply one category" >&2
                exit 1
            fi
            ARG_CATEGORY="$1"
            shift
            ;;
        (*)
            case $ARGS_PROCESSED in
                (0)
                    ARG_REGENTRY="$1"
                    ;;
                (*)
                    echo "Too many arguments supplied" >&2
                    exit 1
                    ;;
            esac
            ARGS_PROCESSED=$(( $ARGS_PROCESSED + 1 ))
            shift
            ;;
        esac
done

[[ -z "$OPT_DATA" ]] && ( OPT_DATA="*" )

# AWK has trouble with single backslashes where regex is concerned
ARG_REGENTRY_AWK=$(echo "$ARG_REGENTRY" | sed -E 's/\\/\\\\/g')

case "$ARG_CATEGORY" in
    (-k)
        if [[ RECURSIVE -eq 1 ]]
        then
            reg query "$ARG_REGENTRY" -s -f "$OPT_DATA" -k |
            tail -n +2 |
            head -n -1 |
            awk -f "$DIR/transform-key.awk" -v REGENTRY="$ARG_REGENTRY_AWK"
        else
            reg query "$ARG_REGENTRY" -f "$OPT_DATA" -k |
            tail -n +2 |
            head -n -1 |
            awk -f "$DIR/transform-key.awk" -v REGENTRY="$ARG_REGENTRY_AWK"
        fi
        ;;
    (-v)
        if [[ RECURSIVE -eq 1 ]]
        then
            reg query "$ARG_REGENTRY" -s -f "$OPTDATA" -v |
            tail -n +2 |
            head -n -2 |
            awk -f "$DIR/transform-value-or-data.awk" -v REGENTRY="$ARG_REGENTRY_AWK"
        else
            reg query "$ARG_REGENTRY" -f "$OPTDATA" -v |
            tail -n +2 |
            head -n -2 |
            awk -f "$DIR/transform-value-or-data.awk" -v REGENTRY="$ARG_REGENTRY_AWK"
        fi
        ;;
    (-d)
        if [[ RECURSIVE -eq 1 ]]
        then
            reg query "$ARG_REGENTRY" -s -f "$OPTDATA" -d |
            tail -n +2 |
            head -n -2 |
            awk -f "$DIR/transform-value-or-data.awk" -v REGENTRY="$ARG_REGENTRY_AWK"
        else
            reg query "$ARG_REGENTRY" -f "$OPTDATA" -d |
            tail -n +2 |
            head -n -2 |
            awk -f "$DIR/transform-value-or-data.awk" -v REGENTRY="$ARG_REGENTRY_AWK"
        fi
        ;;
    (*)
        echo "Invalid arguments" >&2
        exit 1
        ;;
esac