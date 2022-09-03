#!/bin/sh
git log --grep="^(.* )?#$1( .*)?$" -E --oneline | \
cut -f 1 -d " " | \
xargs -I "{}" git diff-tree --no-commit-id --name-only -r "{}" | \
sort -u