#!/bin/sh
ps -sW | awk '/svchost.exe$/ { print $1 }' | sort -n