#!/bin/sh
# Just list all commit identifiers.
# git log | \
# awk '/^commit [0-9a-f]{40}$/'

# Count the number of lines in a file
awk 'BEGIN { word = "Number of lines :" } { lines ++ } END { print word, lines }' ./testfile.txt
# Compare this to
(
  wc -l | \
  (
    read INPUT
    echo "Number of lines : $INPUT"
  )
) < ./testfile.txt