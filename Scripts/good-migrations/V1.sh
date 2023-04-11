#!/bin/sh
# Underneath a given directory, find all .cs files that are under a Migrations folder.
# Files must obey the Entity format.
[ ! -d "$1" ] && exit 1
