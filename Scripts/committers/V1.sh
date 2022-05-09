#!/bin/sh
git log -10 | csplit -f "commit" -n 3 -z - '/commit /' '{*}'