#!/bin/sh
# This is a git commit-msg hook, checks if you have the right name/email
check_user_details()
{
  # Set the correct details here
  YOUR_NAME="${1:?"Name must be supplied"}"
  YOUR_EMAIL="${2:?"Email must be supplied"}"
  # Get the current user details
  CURRENT_NAME=`git config user.name`
  CURRENT_EMAIL=`git config user.email`
  # Check they match, if not prompt
  [ "$CURRENT_NAME" = "$YOUR_NAME" -a "$CURRENT_EMAIL" = "$YOUR_EMAIL" ] && \
    (
      echo "Correct user details found, committing..."
      exit 0
    ) ||
    (
      echo "Hey dude, your user details looks incorrect."
      exit 1
    )
}

check_user_details "Nick Emmerson" "nickemmerson619@hotmail.com"
