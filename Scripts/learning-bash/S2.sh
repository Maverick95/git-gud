#!/bin/bash
# Use array slicing to return distinct file types
ls -1 |
# Remove trailing * characters
sed -E 's/(.*)\*$/\1/' |
# Separate into arguments including file type at end
tr [=.=] " " |
(
    while read -a ARGS
    do
        echo ${ARGS[-1]}
    done
) |
sort |
uniq