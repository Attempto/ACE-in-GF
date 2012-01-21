#!/bin/bash

# Generates sentences with GF using the given PGF file
# and parses them with the APE webservice.

# The APE webservice must be running on localhost.
# Set it up like this:
#
# ./ape.exe -httpserver -port 8000

# @author Kaarel Kaljurand
# @version 2012-01-21

depth=10
number=10

if [ $# -ne 1 ]
then
	echo "Usage: generate-and-check.bash <pgf>"
	exit
else
	echo "Testing... (this shouldn't take long, use Ctrl-C to cancel)"
	echo
fi


echo "gr -depth=${depth} -number=${number} | l -lang=Eng" | gf --run $1 | perl acetext_to_drs-get.perl
