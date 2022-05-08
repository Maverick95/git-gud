#!/bin/sh
# This is a script that finds all PIDs of svchost.exe
# Only problem... it doesn't work, because spaces in the path of a process mean the loop breaks.
INDEX=1
for i in `ps -fW`
do
    if [ $INDEX -eq 2 ]
    then
        PID=$i
    elif [ $INDEX -eq 6 ]
    then
        echo "$i has PID $PID"
    fi
    if [ $INDEX -eq 6 ]
    then
        INDEX=1
    else
        INDEX=`expr $INDEX + 1`   
    fi
done