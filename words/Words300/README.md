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


TODO
----

  - add: all the other supported languages
  - think about Ace, Ape, Eng
  - report: `question_N` and `reason_N` missing in LexiconSpa
  - think about adding: N2, N3, V2Q, etc.
