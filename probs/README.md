Probabilities
=============

Probabilities of the functions in the grammar.

Currently for testing purposes, e.g. use them in random generation:

	echo "gr -lang=Words300Ace -cat=S -number=100 -probs=probs/combined.probs | l -treebank -bind" | gf --run Words300.pgf

Notes
-----

The lang-flag asks to generate only trees which are linearizable
in the given languages, if this flag is omitted then all languages
are expected to give linearizations, which can harm the coverage of the output
if some languages are only partially implemented.
Therefore use a single fully implemented language as a value of this flag.

An even better option is to generate a treebank using only abstract syntax,
and then linearize the treebank (see target ` gr_Words300_with_abstract`).

	echo "read_file -file=test.tb -lines -tree | l -treebank -bind" | gf --run Words300.pgf


Probability files
-----------------

  - [exclude_for_every](exclude_for_every.probs): switch off "for every" which causes very long (infinite?) generation times when generating `S`, due to some unknown bug
  - [exclude_refs](exclude_refs.probs): disable all the references (variables and definite noun phrases)
  - [exclude_body](exclude_body.probs): disable every/some/no-body
  - [combined](combined.probs): all probability files concatenated


Issues
------

  - make sure that the following are generated: gen. quantifiers
  - too much similar output, e.g. in post-processing remove trees that differ only by leaf-nodes
  - sometimes 0-probabilities seem to be ignored
  - sometimes generation "gets stuck"
