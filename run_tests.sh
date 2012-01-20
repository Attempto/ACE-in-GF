#!/bin/bash

# @author Kaarel Kaljurand
# @version 2012-01-20

parser="Parser"

pgf="build/pgf/TestAttempto.pgf"
tests=tests

test_out="test_out.txt"
test_out_fail="test_out_fail.txt"

ghc --make -o $parser ${parser}.hs

for dir in $(ls $tests)
do
	echo "Testing: $dir"
	in="${tests}/${dir}/sentences.txt"
	out="${tests}/${dir}/${test_out}"

	time ./${parser} $pgf < $in > $out

	echo -n "ok: "
	cat $out | grep "|OK" | wc -l

	echo -n "FAIL: "
	cat $out | grep "|FAIL" | wc -l

	cat $out | grep "|FAIL" | sed "s/^.*|FAIL //" | sort | uniq -c | sort -nr > ${tests}/${dir}/${test_out_fail}
	echo
done
