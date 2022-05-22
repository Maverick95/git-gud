#!/bin/sh
HISTORY="$1"; TICKET="$2"
./Scripts/committers/IsInteger.sh "$HISTORY" && \
./Scripts/committers/IsInteger.sh "$TICKET" && \
(
  # [ -e ./Files/committers/commit000 ] && rm ./Files/committers/*
  # git log -$HISTORY | csplit -f "./Files/committers/commit" -n 3 -z - '/^commit [0-9a-f]\{40\}$/' '{*}' > /dev/null
  egrep -nH -d "recurse" "^(.* )?#$TICKET( .*)?$" ./Files/committers | \
  (
    while read INPUT
    do
      FILE=`echo "$INPUT" | cut -f 1 -d ":"`
      LINE=`echo "$INPUT" | cut -f 2 -d ":"`
      [ $LINE -gt 3 ] && echo "$FILE"
    done
  ) | \
  (
    while read INPUT
    do
      head -n 1 "$INPUT" | cut -f 2 -d " "
    done
  ) | \
  (
    while read INPUT
    do
      git diff-tree --no-commit-id --name-only -r "$INPUT"
    done
  ) | sort | \
  (
    PREVIOUS=
    while read INPUT
    do
      if [ "$INPUT" != "$PREVIOUS" ]; then
        echo "$INPUT"
        PREVIOUS="$INPUT"
      fi
    done
  )
)