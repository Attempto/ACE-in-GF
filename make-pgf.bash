#!/bin/bash

# Builds the PGF file from the given source files.
#
# There are two optional arguments:
#
# 1. directory that contains the grammar implementation
# 2. file list pattern (must be in quotes),
#    referencing the vocabulary files in multiple languages
#
# Usage examples:
#
# bash make-pgf.bash grammars/acewiki_aceowl/ "words/ontograph_40/TestAttempto{Ace,}.gf"

# ACE RG files
ace="lib/src/ace/"
api="lib/src/api/"

# Full ACE grammar
grammar_ace="grammars/ace/"
grammar_acewiki_aceowl="grammars/acewiki_aceowl/"

# Clex lexicon (ACE-only)
words="words/clex/ClexAce.gf"

if [ $# -eq 2 ]
then
	grammar=$1
	words=$2
fi


path="present:${grammar_ace}:${grammar_acewiki_aceowl}:${words}:${ace}:${api}"

stack_size="K100M"

build=build

# GF does not like dots in the filename,
# so we use underscores.
name="ACE-0_0_2"

# Start category of the grammar.
# This is explicitly provided for the PGF-compiler in order
# not to rely on the guessing of it, which in some cases
# seems to fail.
startcat="ACEText"

# Do not edit from here on
dir_gr=${build}/gr/
dir_jsgf=${build}/jsgf/

echo "Making output directories (if needed)"
mkdir -p ${dir_gr}
mkdir -p ${dir_jsgf}

echo "Building PGF from:"
eval echo ${words}
# TODO: for some reason the output-dir parameter has no influence,
# so we don't use it, and the PGF is dropped into the current directory.
# Note: optimize-pgf seems to give much better performance,
# startcat is needed to make sure that the PGF compiler finds the start cat.
gf +RTS -${stack_size} -RTS --preproc=mkPresent --make --startcat=${startcat} --optimize-pgf --mk-index --name $name --path $path `eval echo ${words}`

# Commented out because always creates empty output.
# It would be cool though to find out some day if ACE can be converted into a
# speech recognition grammar.
#echo "Generating JSGF into ${dir_jsgf} ...";
#gf --make --output-format=jsgf --name ${name} --output-dir ${dir_jsgf} ${name}.pgf

# Commented out because takes too long or loops.
# Random generation should have its own test script anyway.
#echo "Generating random examples into ${dir_gr} ... (press Ctrl-C if it takes too long)";
#echo "gr -cat=Text -number=1000 -depth=10 | l -treebank -bind" | gf --run ${name}.pgf > ${dir_gr}/${name}.txt

echo "done."
