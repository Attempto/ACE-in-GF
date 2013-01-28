Words 300
=========

Small multilingual vocabulary based on the GF resource grammar library
test lexicon.

Adding support for a new language is simple, just create a new file containing
a single line, e.g. for German:

	concrete Words300Ger of Words300 =
		AttemptoGer ** Words300I with
			(Syntax = SyntaxGer),
			(Lexicon = LexiconGer) ;

The Syntax-module is needed for the `mkCN` which converts the `N` category words
to `CN` needed by the multilingual ACE grammar.
The Lexicon-module contains all the words: simple nouns (~200), transitive verbs (~50)
and proper names (only 2).


Testing
-------

### Generating sentences

To randomly generate 10 trees corresponding to questions (category `QS`)
and linearize them to all the languages, use:

	echo "gr -cat=QS -number=10 | l -treebank -bind" | gf --run Words300.pgf

or generate trees of certain form (instead of category):

	echo "gr -number=10 (qsText ?) | l -treebank -bind" | gf --run Words300.pgf

Note that `cat=QS` should give the same result as `(qsText ?)`.

To generate declarative sentences use `S` instead of `QS` or
`(sText ?)` instead of `(qsText ?)`.

To generate with probabilities add `-probs=Words300.probs` as an argument to `gr`.


TODO
----

  - add: all the other supported languages
  - think about Ace, Ape, Eng
  - `question_N` and `reason_N` missing in LexiconSpa
  - think about adding
    - N2, N3, V2Q, etc.
    - A2 (supported by ACE-in-GF)
    - A and V (supported by ACE-to-OWL)
  - document where do these words come from
  - finalize: Words300.probs


Issues
------

Generating `S` without probabilities causes very long (or infinite?) runtimes.
Using, e.g. the probability file:

	man_CN 1
	play_V2 1
	john_PN 1

always results in a runtime error after a few successfully generated trees:

	echo "gr -cat=S -number=10 -probs=probs.probs" | gf --run Words300.pgf

	simpleS_as_S (neg_vpS (termNP (var_Term X_Var)) (v2_byVP play_V2 (indefPronNP everybody_IPron)))
	falseS (thereNP (indefTherePronVarNP somebody_IPron X_Var))
	simpleS_as_S (thereNP (aNP (cn_as_VarCN man_CN)))

	src/runtime/haskell/PGF/Generate.hs:(171,7)-(174,45): Non-exhaustive patterns in function hit
