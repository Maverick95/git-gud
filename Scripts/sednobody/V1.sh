#!/bin/sh
# Returns all ESTABLISHED netstat connections.
netstat |
sed -n '/Proto \+Local Address \+Foreign Address \+State/p;/ESTABLISHED$/p'