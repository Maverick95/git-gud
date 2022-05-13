#!/bin/sh
# This feels like a dangerous idea.
# Basically want to look for all the commits that were NOT made
# against the ideal user name/email,
# and re-commit from the earliest point onward.
# Generate a new commit, maybe this combines with the commit-msg hook
# idea that checks for a valid name / email.