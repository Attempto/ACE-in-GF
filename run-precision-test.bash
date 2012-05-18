#!/bin/sh
# Test precision by generating a bunch of trees and seeing how many of them are accepted by the Codeco parser
# [JJC]

# Usage:
#   bash run-precision-test.bash [ NUMBER [DEPTH] | TREES_FILE ]

pgf=ACE-0_0_2.pgf
trees_file=build/gr/precision-test.txt
out=test_precision_out.txt
out_fail=test_precision_out_fail.txt
cat="Text"
# At depth=7 gr can reliably generate 1000s of trees,
# at higher depths it seems to hang.
depth="7"
# Exclude questions for the time being.
tree="(baseText (sText ?))"

if [ $# -ge 1 ]; then
    if [[ $1 =~ ^[0-9]+$ ]]; then
        # First argument was a number, so we generate new trees
        gr_number=$1

        # Specified depth
        if [ $# -ge 2 ]; then depth=$2 ; fi

        echo "Generating ${gr_number} trees of depth ${depth} for category ${cat} ..."
        echo "gr -cat=${cat} -number=${gr_number} -depth=${depth} ${tree} | l -lang=Ace -bind" | gf --run ${pgf} > ${trees_file}
    else
        # Treat argument as a filename
        echo "Using trees file ${trees_file}"
        trees_file=$1
    fi
fi

echo "Parsing..."
egrep ".+" ${trees_file} | tools/Codeco/run.sh 1>${out}
echo "Output is in ${out}"

total=`cat ${out} | wc --lines`
parsed=`egrep "^OK:" ${out} | wc --lines`
failed=`egrep "^FAIL:" ${out} | wc --lines`
echo "Parsed: ${parsed}, Failed: ${failed}"
echo "Precision:" $((parsed*100/total))"%"

echo "Creating ${out_fail}"
egrep "^FAIL:" ${out} | sed "s/^FAIL: //" | sort | uniq > ${out_fail}
