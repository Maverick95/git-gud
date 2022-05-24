#!/bin/sh
# This works but seems horribly slow.
echo "$1" | \
tr -t "[:upper:]" "[:lower:]" | \
(
  read INPUT
  if [ ! `expr "$INPUT" : '[0-9a-f]\{8\}\-[0-9a-f]\{4\}\-[0-9a-f]\{4\}\-[0-9a-f]\{4\}\-[0-9a-f]\{12\}'` -eq 36 ]; then
    echo "GUID must be supplied"
    exit 1
  fi
  echo "$INPUT"
) | tr -d "-" | xxd -p -r | base64