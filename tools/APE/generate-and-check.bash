#!/bin/bash

# Generates sentences with GF using the given PGF file
# and parses them with the APE webservice.

# The APE webservice must be running on localhost.
# Set it up like this:
#
# ./ape.exe -httpserver -port 8000

# @author Kaarel Kaljurand
# @version 2012-05-18

cat="Text"
depth=7
number=100
# Exclude questions for the time being.
tree="(baseText (sText ?))"

sentences="sentences.txt"
pre_parse="../Codeco/pre_parse.sed"

if [ $# -ne 1 ]
then
	echo "Usage: generate-and-check.bash <pgf>"
	exit
fi

echo "Generating ${number} trees of shape ${tree} and depth ${depth} in category ${cat} ..."
echo "gr -cat=${cat} -depth=${depth} -number=${number} ${tree} | l -lang=Ace -bind" | gf --run $1 > ${sentences}

cat ${sentences} | sed -f ${pre_parse} | perl acetext_to_drs-get.perl
