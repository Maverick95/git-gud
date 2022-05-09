#!/bin/sh
PROCESS_REGEX="$1"
ps -sW | tail -n +2 | cut -c 3-7,26- | grep "${PROCESS_REGEX:?"Please supply a Regex pattern for processes."}" | cut -f 1 -d " " | sort -n