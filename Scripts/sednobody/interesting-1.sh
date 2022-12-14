#!/bin/sh
# Prints each git commit in a specific format
git log |
# Flag and substitute commit hash lines
sed -E -l 0 's/^commit ([0-9a-f]{40})$/P1 \1/' |
# Flag and substitute date lines
sed -E -l 0 's/^Date:   (.*)$/P2 \1/' |
# Combine parts
sed -nE -l 0 '
    /^P1 /{
        s/^P1 (.*)$/\1/
        h
    }
    /^P2 /{
        s/^P2 (.*)$/\1/
        H
        g
        l
    }
'
