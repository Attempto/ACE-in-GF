Probabilities
=============

Probabilities of the functions in the grammar.

Currently for testing purposes, e.g. use them in random generation:

	echo "gr -cat=S -number=10 -probs=probs.probs" | gf --run Words300.pgf


Files
-----

  - `exclude_for_every.probs`: switch off "for every" which causes very long (infinite?) generation times when generating `S`, due to some unknown bug
