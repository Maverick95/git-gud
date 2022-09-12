#!/bin/sh
ps -sW |
sed -n '1p;/svchost.exe$/p'