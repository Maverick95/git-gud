#!/bin/sh
git log | csplit -f "./Files/commit" -n 3 -z - '/^commit [0-9a-f]\{40\}$/' '{*}' > /dev/null

