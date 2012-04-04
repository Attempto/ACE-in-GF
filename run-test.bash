#!/bin/bash

# @author Kaarel Kaljurand
# @version 2012-04-04

prog="Parser"
testset="tests/ace/sentences.txt"
pgf="ACE-0_0_2.pgf"
lang="TestAttemptoAce"


if [ $# -eq 2 ]
then
	testset=$1
	pgf=$2
elif [ $# -eq 1 ]
then
	testset=$1
else
	echo "Usage: run_test.sh <testset> (<pgf>)"
	exit
fi

out="test_out.txt"
out_fail="test_out_fail.txt"

time (cat $1 | ./${prog} $pgf $lang > $out)

echo "Parsed:"
cat $out | grep "|OK" | wc -l

echo "NOT parsed:"
cat $out | grep "|FAIL" | wc -l

echo "Creating ${out_fail}"
cat $out | grep "|FAIL" | sed "s/^.*|FAIL //" | sort | uniq -c | sort -nr > ${out_fail}
