#!/bin/sh
# Test precision by generating a bunch of trees and seeing how many of them are accepted by the Codeco parser
# [JJC]

# Usage:
#   bash run-precision-test.bash [ NUMBER | TREES_FILE ]

pgf=ACE-0_0_2.pgf
trees_file=build/gr/precision-test.txt
out=test_precision_out.txt
out_fail=test_precision_out_fail.txt

if [ $# -eq 1 ]; then
    if [[ $1 =~ ^[0-9]+$ ]]; then
        # Argument was a number, so we generate new trees
        gr_number=$1
        echo "Generating ${gr_number} trees..."
        echo "gr -cat=Text -number=${gr_number} -depth=10 | l -lang=Ace -bind" | gf --run ${pgf} > ${trees_file}
    else
        # Treat argument as a filename
        trees_file=$1
    fi
fi

echo "Parsing..."
cat ${trees_file} | grep -E ".+" | tools/Codeco/run.sh 1>${out}
echo "Output is in ${out}"

total=`cat ${out} | wc --lines`
parsed=`egrep "^OK:" ${out} | wc --lines`
failed=`egrep "^FAIL:" ${out} | wc --lines`
echo "Parsed: ${parsed}/${failed}"
echo "Precision:" $((parsed*100/total))"%"

echo "Creating ${out_fail}"
egrep "^FAIL:" ${out} | sed "s/^FAIL: //" | sort | uniq > ${out_fail}
