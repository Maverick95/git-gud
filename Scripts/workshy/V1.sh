#!/bin/sh
[ -z "$TARGET_NAME" -o -z "$TARGET_EMAIL" ] && exit 1
CURRENT_NAME=`git config user.name`CURRENT_EMAIL=`git config user.email`
# Check they match, if not prompt
[ "$CURRENT_NAME" = "$TARGET_NAME" -a "$CURRENT_EMAIL" = "$TARGET_EMAIL" ] && \
  (
    echo "Correct user details found, committing..."
    exit 0
  ) ||
  (
    echo "Hey dude, your user details looks incorrect."
     exit 1
  )
