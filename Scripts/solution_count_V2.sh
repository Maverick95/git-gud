#!/bin/sh
# solution_count.sh can be expressed in 2 lines
[ -n "$1" ] && cd $1
ls -R | grep '\.sln$'
