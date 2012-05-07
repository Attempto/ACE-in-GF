#!/bin/sh
# Test precision by generating a bunch of trees and seeing how many of them are accepted by the Codeco parser
# [JJC]

name=ACE-0_0_2
dir_gr=build/gr
test_file=test_precision_out.txt
if [ $# -eq 1 ]
then
    gr_number=$1
else
    echo "You need to specify how many trees to generate"
    exit
fi

echo "Generating ${gr_number} trees..."
echo "gr -cat=Text -number=${gr_number} -depth=10 | l -lang=Ace -bind" | gf --run ${name}.pgf > ${dir_gr}/${name}.txt

echo "Parsing..."
cat ${dir_gr}/${name}.txt | grep -E ".+" | swipl --nodebug -f tools/Codeco/parse.pl -g main -t halt -q 2>/dev/null 1>${test_file}
echo "Output is in ${test_file}"

total=`cat ${test_file} | wc --lines`
parsed=`cat ${test_file} | grep "OK:" | wc --lines`
failed=`cat ${test_file} | grep "FAIL:" | wc --lines`
echo "Parsed: ${parsed}/${failed}"
echo "Precision:" $((parsed*100/total))"%"

