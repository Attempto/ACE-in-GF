#!/bin/bash

path="present"

stack_size="K100M"

build=build

grammar="TestAttempto"

# More languages can be plugged in here, maybe apart from
# Fin which takes too long to compile.
grammars="TestAttemptoEng.gf TestAttemptoGer.gf"

# Do not edit from here on
dir_pgf=${build}/pgf/
dir_gr=${build}/gr/
dir_jsgf=${build}/jsgf/

echo "Making output directories"
mkdir -p ${dir_pgf}
mkdir -p ${dir_gr}
mkdir -p ${dir_jsgf}

dir=attempto

cd $dir

echo "Building PGF..."
gf +RTS -${stack_size} -RTS --preproc=mkPresent --make --optimize-pgf --mk-index --path $path $grammars

cd ..

mv ${dir}/${grammar}.pgf ${dir_pgf}

echo "Generating JSGF...";
gf -make --output-format=jsgf --output-dir ${dir_jsgf} ${dir_pgf}/${grammar}.pgf

echo "Generating random examples...";
echo "gr -number=10 -depth=7 | l -treebank -bind" | gf --run ${dir_pgf}/${grammar}.pgf > ${dir_gr}/${grammar}.txt

echo "done."
