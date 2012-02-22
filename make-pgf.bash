#!/bin/bash

grammar="grammars/attempto/"
words="words/test/"

if [ $# -eq 2 ]
then
	grammar=$1
	words=$2
fi


path="present:${grammar}:${words}"

stack_size="K100M"

build=build

# GF does not like dots in the filename,
# so we use underscores.
name="ACE-0_0_2"

# Do not edit from here on
dir_gr=${build}/gr/
dir_jsgf=${build}/jsgf/

echo "Making output directories (if needed)"
mkdir -p ${dir_gr}
mkdir -p ${dir_jsgf}

# More languages can be plugged in here.
echo "Building PGF from ${words}/TestAttempto{Eng,Ger,Ita,Fre,Swe}.gf"
# TODO: for some reason the output-dir parameter has no influence,
# so we don't use it, and the PGF is dropped into the current directory.
gf +RTS -${stack_size} -RTS --preproc=mkPresent --make --optimize-pgf --mk-index --name $name --path $path ${words}/TestAttempto{Eng,Ger,Ita,Fre,Swe}.gf
#gf +RTS -${stack_size} -RTS --preproc=mkPresent --make --optimize-pgf --mk-index --name $name --path $path ${words}/TestAttemptoEng.gf

echo "Generating JSGF into ${dir_jsgf} ...";
gf --make --output-format=jsgf --name ${name} --output-dir ${dir_jsgf} ${name}.pgf

echo "Generating random examples into ${dir_gr} ...";
echo "gr -cat=Text -number=1000 -depth=10 | l -treebank -bind" | gf --run ${name}.pgf > ${dir_gr}/${name}.txt

echo "done."
