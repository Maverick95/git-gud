#!/bin/bash
# Testing string slicing
NAME="This is a string"
echo ${NAME:1}
echo ${NAME:1:3}
# Preserves spaces
echo ${NAME:1:5}
echo ${NAME:1:11}

# Testing array slicing
ARRAY=("this" "is" "an" "array")
echo ${ARRAY[@]:1}
echo ${ARRAY[@]:1:2}
echo ${ARRAY[@]:1:4}
echo ${ARRAY[-1]}



