#!/bin/sh
# Get the Regex right step-by-step
echo "$1" | \
tr -t "[:upper:]" "[:lower:]" | \
(
  read INPUT
  if [ ! `expr "$INPUT" : '[0-9a-f]\{8\}\-[0-9a-f]\{4\}\-[0-9a-f]\{4\}\-[0-9a-f]\{4\}\-[0-9a-f]\{12\}'` -eq 36 ]; then
    echo "GUID must be supplied"
    exit 1
  fi
  echo "$INPUT"
) | \
tr -d "-" | \
(
  read INPUT
  while [ -n "$INPUT" ]
  do
    echo "$INPUT" | cut -c 1-2
    INPUT=`echo "$INPUT" | cut -c 3-`
  done
)
