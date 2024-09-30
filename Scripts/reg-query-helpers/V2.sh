#!/bin/bash
# First draft of your registry helper script

# Deal with parameters and options
OPT_DATA=
ARGS_PROCESSED=0
ARG_REGENTRY=
ARG_CATEGORY=

while [[ $# -gt 0 ]]
do
    case "$1" in
        (-f)
            OPT_DATA="$2"
            shift 2
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

NUM_SLASHES_IN_SUBKEY=$(( 1 + $(
    echo -n "$ARG_REGENTRY" |
    sed -E 's/[^\\]//g' |
    wc -m
) ))
SED_REPLACE_FOR_SUBKEY="([^\\\\]*\\\\){$NUM_SLASHES_IN_SUBKEY}"

case "$ARG_CATEGORY" in
    (-k)
        reg query "$ARG_REGENTRY" -f "$OPT_DATA" -k |
        tail -n +2 |
        head -n -1 |
        sed -E "s/$SED_REPLACE_FOR_SUBKEY//"
        ;;
    (*)
        echo "Invalid arguments" >&2
        exit 1
        ;;
esac