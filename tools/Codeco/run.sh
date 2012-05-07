#!/bin/sh
# Simply pipe STDIN to script into the parser, and abstract over command line arguments to swiprolog
cat | swipl --nodebug -f parse.pl -g main -t halt -q 2>/dev/null
