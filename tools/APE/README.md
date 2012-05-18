Generating with GF and parsing with APE
=======================================

Set up the APE webservice:

> ape.exe -httpserver -port 8000

Generate and parse:

> bash generate-and-check.bash ../../TestAttempto.pgf

Output example:

	IN: 999 >= - ( - ( - 999 ) ) * X .
	OUT: drs([],[])

	IN: who is there ?
	OUT: drs([],[question(drs([A],[query(A,who)-1/1]))])
