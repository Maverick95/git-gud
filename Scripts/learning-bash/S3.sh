#!/bin/bash
# Test conditional expressions
if [[ -n $1 ]]
then
    echo "You supplied \$1"
fi

if [[ -n $2 ]]
then
    echo "You supplied \$2"
fi

if [[ -n $1 ]] && [[ -n $2 ]]
then
    echo "You supplied both arguments"
fi

if [[ -n $1 ]] || [[ -n $2 ]]
then
    echo "You supplied either argument"
fi

# Test looping
for ARG in "$1 $2"
do
    echo "Argument: $ARG"
done