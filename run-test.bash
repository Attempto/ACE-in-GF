#!/bin/bash

# @author Kaarel Kaljurand
# @version 2012-04-04

prog="Parser"
testset="tests/ace/sentences.txt"
pgf="ACE-0_0_2.pgf"
#lang="ClexAce"
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

parsed=`cat $out | grep "|OK" | wc -l`
parsed_unambig=`cat $out | grep "|OK (1)" | wc -l`
failed=`cat $out | grep "|FAIL" | wc -l`
total=`cat $out | wc -l`

echo "Parsed:"
parsed_pc=`echo "scale=2;${parsed}*100/${total}" | bc -l`
unambig_pc=`echo "scale=2;${parsed_unambig}*100/${parsed}" | bc -l`
echo "${parsed} (${parsed_pc}%) - (${unambig_pc}% unambiguous)"

echo "NOT parsed:"
failed_pc=`echo "scale=2;${failed}*100/${total}" | bc -l`
echo "${failed} (${failed_pc}%)"

echo "Creating ${out_fail}"
cat $out | grep "|FAIL" | sed "s/^.*|FAIL //" | sort | uniq -c | sort -nr > ${out_fail}
