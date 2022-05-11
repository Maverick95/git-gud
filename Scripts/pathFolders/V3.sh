#!/bin/sh
# This is a much tidier recursive pipe script.
# The lesson from the other two scripts is,
# if it feels wrong, it probably is.
next()
{
  read N_PATH F_PATH
  echo "$N_PATH"
  [ -n "$F_PATH" ] && ( echo "$F_PATH" | next )
}
INPUT="${1:?"Input must be supplied"}"
IFS="${2:?"Separator must be supplied"}"
echo "$INPUT" | next | sort