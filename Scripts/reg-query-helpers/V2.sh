#!/bin/bash
REG_QUERY="HKLM\System\CurrentControlSet\Services"

getopts "c:" "ARG_CATEGORY"
if [ $ARG_CATEGORY = "?" ]
then
    exit 1
else
    ARG_CATEGORY=$OPTARG
fi

getopts "d:" "ARG_DATA"
if [ $ARG_DATA = "?" ]
then
    ARG_DATA=""
else
    ARG_DATA=$OPTARG
fi

# Need to work out how to write the next line
if [ $ARG_CATEGORY = "k" ]
then
    NUM_SLASHES=$(( 1 + $(
        echo -n "$REG_QUERY" |
        sed -E 's/[^\\]//g' |
        wc -m
    ) ))
    SED_REPLACE="([^\\\\]*\\\\){$NUM_SLASHES}"

    reg query "$REG_QUERY" -f "*" -k |
    tail -n +2 |
    head -n -1 |
    sed -E "s/$SED_REPLACE//"
else
    exit 1
fi
