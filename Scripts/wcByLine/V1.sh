#!/bin/sh
while read LINE
do
    echo $LINE | wc -cmwl
done