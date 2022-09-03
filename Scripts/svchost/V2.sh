#!/bin/sh
ps -sW | tail -n +2 | cut -c 3-7,26- | grep "svchost.exe$" | cut -f 1 -d " " | sort -n