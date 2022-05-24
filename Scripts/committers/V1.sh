#!/bin/sh
git log --grep="^(.* )?#$1( .*)?$" -E --oneline | \
cut -f 1 -d " " | \
(
  while read INPUT
  do
    git diff-tree --no-commit-id --name-only -r "$INPUT"
  done
 ) | \
sort -u