#!/bin/bash

# @author Kaarel Kaljurand
# @version 2012-04-04

parser="Parser"

pgf="ACE-0_0_2.pgf"
#lang="TestAttemptoAce"
lang="ClexAce"
tests=tests

test_out="test_out.txt"
test_out_fail="test_out_fail.txt"

for dir in $(find $tests -maxdepth 1 -mindepth 1 -type d)
do
	echo "Testing: $dir"
	in="${dir}/sentences.txt"
	out="${dir}/${test_out}"

	time ./${parser} $pgf $lang < $in > $out

	echo -n "ok: "
	cat $out | grep "|OK" | wc -l

	echo -n "FAIL: "
	cat $out | grep "|FAIL" | wc -l

	cat $out | grep "|FAIL" | sed "s/^.*|FAIL //" | sort | uniq -c | sort -nr > ${dir}/${test_out_fail}
	echo
done
