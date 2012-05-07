#!/bin/sh
# Abstract over command line arguments to swiprolog
# Can be called from anywhere, and will either read first argument or fall back to STDIN
# [JJC]

dir=`dirname $0`
if [ $# -eq 1 ]
then
    echo $1 | sed "s/ *$//" | swipl -f ${dir}/parse.pl -g main -t halt -q
else
    cat | sed "s/ *$//" | swipl -f ${dir}/parse.pl -g main -t halt -q
fi
