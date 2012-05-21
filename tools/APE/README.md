Generating with GF and parsing with APE
=======================================

Usage
-----

Set up the APE webservice:

> ape.exe -httpserver -port 8000

Set up the PGF:

> make pgf_acewiki_aceowl

Generate and parse:

> bash generate-and-check.bash ../../TestAttempto.pgf
