#!/bin/bash

# @author Kaarel Kaljurand
# @version 2011-12-15

prog="Parser"

if [ $# -ne 1 ]
then
	echo "Usage: run_test.sh <testset>"
	exit
else
	echo "Testing: $1"
fi

out="test_out.txt"
out_fail="test_out_fail.txt"

ghc --make -o $prog ${prog}.hs

time (cat $1 | ./${prog} build/pgf/TestAttempto.pgf > $out)

echo "Parsed:"
cat $out | grep "|OK" | wc -l

echo "NOT parsed:"
cat $out | grep "|FAIL" | wc -l

echo "Creating ${out_fail}"
cat $out | grep "|FAIL" | sed "s/^.*|FAIL //" | sort | uniq -c | sort -nr > ${out_fail}
