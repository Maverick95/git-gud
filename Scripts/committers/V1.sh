#!/bin/sh
HISTORY="$1"; TICKET="$2"
./Scripts/committers/IsInteger.sh "$HISTORY" && \
./Scripts/committers/IsInteger.sh "$TICKET" && \
(
  [ -e ./Files/committers/commit000 ] && rm ./Files/committers/*
  git log -$HISTORY | csplit -f "./Files/committers/commit" -n 3 -z - '/^commit [0-9a-f]\{40\}$/' '{*}' > /dev/null
  # What next?
  # Probably something fancy with grep.
)