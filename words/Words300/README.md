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

To generate with probabilities pick a file from the `probs`-directory and
add `-probs=probs/filename.probs` as an argument to `gr`.


TODO
----

  - think about Ace, Ape, Eng
  - `question_N` and `reason_N` missing in some languages (`pg -missing`)
  - think about adding
    - N2, N3, V2Q, etc.
    - A2 (supported by ACE-in-GF)
    - A and V (supported by ACE-to-OWL)
  - document where do these words come from
