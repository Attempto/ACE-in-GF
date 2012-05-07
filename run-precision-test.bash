#!/bin/sh
# Test precision by generating a bunch of trees and seeing how many of them are accepted by the Codeco parser
# [JJC]

# Usage:
#   bash run-precision-test.bash [ NUMBER | TREES_FILE ]

pgf=ACE-0_0_2.pgf
trees_file=build/gr/precision-test.txt
test_file=test_precision_out.txt

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
cat ${trees_file} | grep -E ".+" | tools/Codeco/run.sh 1>${test_file}
echo "Output is in ${test_file}"

total=`cat ${test_file} | wc --lines`
parsed=`cat ${test_file} | grep "OK:" | wc --lines`
failed=`cat ${test_file} | grep "FAIL:" | wc --lines`
echo "Parsed: ${parsed}/${failed}"
echo "Precision:" $((parsed*100/total))"%"

