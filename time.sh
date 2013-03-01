#!/bin/sh
shift  # get rid of the '-c' supplied by make.
time -f "%C\n%E real, %U user, %S sys" -o time.log -a sh -c "$*"
