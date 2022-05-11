#!/bin/sh
exit `expr "${1:?"Input is required"}" : '[0-9]*[^0-9]'`