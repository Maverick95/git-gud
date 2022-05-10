#!/bin/sh
# This prints out all the PATH folders one after another line-by-line.
# However it prints very slow.
# Indicates there is a better way of doing this.
F_PATH="$PATH"
F_PATH_SEP_NEXT=`expr "$F_PATH" : '[^:]*'`
while [ $F_PATH_SEP_NEXT -gt 0 ]
do
  echo "$F_PATH" | cut -c -$F_PATH_SEP_NEXT
  F_PATH_BEGIN=`expr $F_PATH_SEP_NEXT + 2`
  F_PATH=`echo "$F_PATH" | cut -c $F_PATH_BEGIN-`
  F_PATH_SEP_NEXT=`expr "$F_PATH" : '[^:]*'`
done