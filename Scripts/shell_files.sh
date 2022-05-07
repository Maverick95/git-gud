#!/bin/sh
echo "## Echo each file in turn ##"
for i in *.sh
do
    echo "$i"
done
echo "## Echo all files at once ##"
echo *.sh
echo "## Echo hidden files ##"
echo .[!.]*