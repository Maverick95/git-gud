#!/bin/sh
INPUT="${1:?"Input must be supplied"}"
SEP_NEXT=`expr "$INPUT" : '[^:]*'`
while [ $SEP_NEXT -gt 0 ]
do
  echo "$INPUT" | cut -c -$SEP_NEXT
  INPUT_BEGIN=`expr $SEP_NEXT + 2`
  INPUT=`echo "$INPUT" | cut -c $INPUT_BEGIN-`
  SEP_NEXT=`expr "$INPUT" : '[^:]*'`
done