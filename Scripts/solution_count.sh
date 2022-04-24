#!/bin/sh
SLN_COUNT=0
solution_count()
{
  [ -n "$1" -a -d "$1" ] && \
    cd "$1"
  # Count the solutions in the current folder
  for i in *.sln
  do
    if [ "$i" != "*.sln" ]; then
      echo "Solution found : $i"
      SLN_COUNT=`expr $SLN_COUNT + 1`
    fi
  done
  # Recurse through each of the sub-folders
  for i in *
  do
    [ -d "$i" ] && \
      solution_count $i
  done
  cd ..
}
# If an argument provided to this script, switch to this directory.
[ -n "$1" ] && cd $1
solution_count
echo "Total Solutions : $SLN_COUNT"