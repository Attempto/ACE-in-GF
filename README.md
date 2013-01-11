Attempto Controlled English in Grammatical Framework
====================================================

Introduction
------------

This project implements the syntax of Attempto Controlled English (ACE)
(version 6.6) in Grammatical Framework (GF) and ports it to
additional natural languages (see the Makefile for the currently supported
languages).
Note that this project does not implement
the mapping of ACE sentences to discourse representation structures.


Requirements
------------

### Coverage

The grammar should cover a reasonably large and interesting subset of ACE,
specifically the OWL-compatible subset that is supported by AceWiki.
Ideally, the grammar should cover the full ACE.

### Correctness

The grammar should not overgenerate, i.e. it should be possible to use the
grammar in a look-ahead editor (which explicitly exposes the coverage
of the grammar to the user).

### Multilinguality

The grammar should allow for bidirectional translations
between ACE and a number of other controlled natural languages
(_ACE-like_ German, Italian, Finnish, etc.).


Reference implementations
-------------------------

  * The reference ACE parser (APE) can be obtained from <https://github.com/Attempto/APE>. There is a web-based demo at <http://attempto.ifi.uzh.ch/ape/>.

  * The reference AceWiki grammar can be found at <https://github.com/AceWiki/AceWiki/tree/master/src/ch/uzh/ifi/attempto/acewiki/aceowl/>. There is a web-based demo at <http://attempto.ifi.uzh.ch/acewiki/>.


First commit
------------

This project started out as a port of an existing ACE-in-GF implementation.
The first commit was based on the 2011-12-14 version of
the GF darcs repository `examples/attempto/`-directory implemented
by the GF developers in 2009 targeting ACE v6.0. See also the publication:

	K. Angelov and A. Ranta.
	Implementing Controlled Languages in GF.
	N. Fuchs (ed.), CNL-2009 Controlled Natural Languages, LNCS/LNAI 5972, 2010.

This version does not completely match ACE v6.6,
i.e. some ACE constructs are not supported, e.g.
(__(F)__ marks things that the current version has already fixed)

  * __(F)__ transitive adjectives: `mad-about` (`mad about` does not seem to work either)
  * __(F)__ exactly
  * __(F)__ less than
  * __(F)__ everybody
  * __(F)__ everybody X
  * __(F)__ everything
  * __(F)__ somebody X
  * __(F)__ (some|every|no)body who
  * __(F)__ Mary who
  * `which` as a question pronoun
  * __(F)__ `is not` and `isn't` are not equivalent
    * __(F)__ `a woman is not a man .` fails
    * __(F)__ `a woman isn't a man .` succeeds
    * __(F)__ `a woman is not every man .` succeeds
    * __(F)__ `a woman isn't every man .` succeeds
  * __(F)__ `are not` and `aren't` are not equivalent
  * __(F)__ `does not` and `doesn't` are not equivalent
  * __(F)__ `do not` and `don't` are not equivalent
  * __(F)__ `who` (instead of `whom`) in object relative clauses (`a woman who a man sees`)
  * dative shift (`John gives Mary an apple`)
  * __(F)__ `does wait` (as alternative to `waits`)
  * adjective coordination
    - a rich and lucky man waits .
    - John is rich and lucky .
  * John is more rich. (`John is richer` works)
  * John always runs. (`John runs always` works)
  * VP coordination (of both positive and negative VPs) (Note that GF RGL common API supports Conj only with AP, Adv, NP, RS, and S; but there is support for VP coordination in ExtraEng.)
  * __(F)__ negated relative clauses (`that is not`, `that does not`, `that CN is not`)
  * __(F)__ negated WH-questions (`who does not like Mary?`)
  * __(F)__ WH-word in object position (`who does Mary not like ?`)
  * reflexive pronouns (e.g. `itself`)
  * strings and string concatenation
  * lists and sets

and it supports some constructs which in ACE do not exist, have been
deprecated or should be avoided (i.e. create a warning), e.g.

  * relative clause can be attached to any NP using a comma between the NP and the relative clause (in ACE: relative clauses can be used only for nouns, indefinite pronouns and proper names)
  * `he waits .` (and other unresolvable personal pronouns)
  * `the man waits .` (gives a warning in APE)
  * a man X is the man Y .
  * __(F)__ not more than, not at least, ...
  * numbers larger than 12 as words, e.g. `one hundred and thirty`
  * __(F)__ whom
  * __(F)__ such that
  * `- ( X + X ) waits .` (minus sign should be followed by a number)
  * `1 = - -1 .` (`-1` is a built-in GF integer)
  * __(F)__ `nothing except` (instead of `nothing but`)
  * __(F)__ multiple variables in apposition (`a man X X X Y ...`)
  * __(F)__ `there is/are` can take any NP as an argument
  * ...


Building
--------

_Note: based on GF darcs version: 2013-01-11 16:43:32 CET_

The ACE-in-GF grammar can be turned into a PGF file in various ways
depending on

  - if the AceWiki-subset grammar or the full ACE grammar (experimental) is desired;
  - which vocabulary is included;
  - which languages are included.

Several targets are available in the Makefile, which start with the
`pgf_` prefix. To build the grammar execute e.g.

	make pgf_acewiki_aceowl # AceWiki grammar, ACE only, tiny test vocabulary
	make pgf_ontograph_40 # AceWiki grammar, all languages, small test vocabulary

To build the full ACE grammar (ACE-only) with a lexicon of ~1000 general words,
run

	bash make-pgf.bash

(Note that it is important that you use `bash`.)

The building should not take more than a minute.
The GF libraries are expected to be found in a system-wide location, e.g.:

  * ~/.cabal/share/gf-3.3/lib/present/
  * ~/.cabal/share/gf-3.3/lib/prelude/

and they should correspond to the GF version listed above (as the GF darcs push
timestamp).


Running
-------

Examples of translating an ACE sentence to other languages.

Using the PGF generated by `bash make-pgf.bash`:

	TestAttempto> p -lang=Ace "John gives an apple to a woman who John sees ." | l -treebank
	TestAttempto: baseText (sText (vpS (pnNP john_PN)
						(v3VP give_V3 (aNP apple_N)
							(aNP (relCN woman_N (slashRS which_RP (pnNP john_PN) see_V2))))))
	TestAttemptoAce: John gives an apple to a woman who John sees .
	TestAttemptoEng: John gives an apple to a woman whom John sees .
	TestAttemptoFre: John donne une pomme à une femme que John voit .
	TestAttemptoGer: John gibt einen Apfel einer Frau die John sieht .
	TestAttemptoIta: John da una mela ad una donna che John veda .
	TestAttemptoSwe: John ger ett äpple till en kvinna som John ser .

Using the PGF generated by `make pgf_ontograph_40`:

	TestAttempto> p -lang=Ace -cat=Text "it is false that Mary is helped by nothing but travelers who X admires ." | l
	it is false that Mary is helped by nothing but travelers who X admires .
	és fals que Mary és ajudat per nomÈs viatgers que X admira .
	't is onwaar dat Mary door slechts reizigers die X bewondert gehelpt wordt .
	it is false that Mary is helped by nothing but travelers who X admires .
	on epätotta että Mary autetaan vain matkustajien jotka X ihailee toimesta .
	il est faux que Mary est aidé par seulement des voyageurs que X admire .
	es ist falsch dass Mary durch nur Reisenden die X bewundert geholfen wird .
	è falso che Mary viene aiutato da soltanto viaggiatori che X ammira .
	es falso que Mary es ayudado por solamente viajeros que X admira .
	det är falskt att Mary blir assisterad av bara resenärar som X beundrar .
	GlT كہ Mary صرف مسافر جن X کی تعریفتا ہے سے متا ہے ہے


Testing
-------

### Parsing ACE sentences

The commands

	ghc --make -o Parser Parser.hs
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,}.gf"
	bash run-test.bash tests/acewiki_aceowl/sentences.txt

do the following:

  - compile a Haskell script that applies a PGF file to a text file,
  - compile a PGF file from a given GF source (grammar and vocabulary),
  - run a test on a given text file.

The test script creates two output files

  * `test_out.txt` all the sentences classified as OK or FAIL, with ambiguity shown in case of OK, and successfully parsed prefix in case of FAIL
  * `test_out_fail.txt`: frequency ranking of failed sentences

To run a test with the full ACE grammar and the 1000-word vocabulary on all the test cases in the tests-directory, execute:

	bash make-pgf.bash
	bash run-all-tests.bash > tests/run-all-tests.out 2> tests/run-all-tests.err

The output files are created into the subdirectories of the tests-directory.

Additional test-targets are provided by the Makefile.

### Translating from ACE to other languages

Use the following Makefile targets to generate and store the linearizations.

	lin_ontograph_40_save
	lin_ontograph_ext_save
	lin_Geography_save
	lin_acewiki_aceowl_save

All the linearizations except for `acewiki_aceowl` are also under version control.

### Generating with ACE-in-GF and parsing with Codeco

See the Makefile targets, that have the prefix `test_precision`.

### Analyzing tree round-tripping

	echo "gr -number=10" | gf --run TestAttempto.pgf | ./Roundtripper -f TestAttempto.pgf -l TestAttemptoAce | grep DIFF

	echo "rf -lines -file=tests/ontograph_ext/sentences.txt | p -lang=Ace -cat=ACEText" |\
	gf --run TestAttempto.pgf | ./Roundtripper -f TestAttempto.pgf -l TestAttemptoAce | grep DIFF

Currently this results in (TODO: fix these):

	Tom buys a picture  ->  Tom buys the picture (article changes, in Fin)
	Mary sees no man  ->  Mary doesn't see no man (negation added, several languages)
	if X sees somebody who sees Y ...  ->  if X sees somebody who Y sees ... (word order changes, in Ger and Dut)
	what does Tom buy ?  ->  what buys Tom ? (word order changes, all langs but ACE and Eng)


Changing
--------

Changes to the ACE grammar can be done in various places.

### lib/src/

ACE resource grammar. Based on the English resource grammar. Describes
deviations from the English grammar, e.g. ACE uses `who` instead of `whom`.

### grammars/

Implementation of different ACE subsets and their ports to other languages.
Contains the common interface AttemptoI.gf.

### words/

Different domain vocabularies. These files should rather be automatically
generated from existing terminology databases.


Status
------

We measure the status of this project in various ways, see more:

  - [Evaluation wiki](https://github.com/Attempto/ACE-in-GF/wiki/Evaluation)
  - [tests-directory](https://github.com/Attempto/ACE-in-GF/tree/master/tests)


Structure of the grammar
------------------------

### General

  * Attempto
    * abstract Attempto = Numeral, Symbols
  * Symbols
    * abstract Symbols
    * ACE formulas and expressions
  * SymbolsC
    * concrete SymbolsC of Symbols = open Precedence, Prelude
    * used by all languages
  * AttemptoI
    * incomplete concrete AttemptoI of Attempto = SymbolsC, Numeral ** open Syntax, Symbolic, Prelude, LexAttempto
  * LexAttempto
    * interface LexAttempto = open Syntax
    * things that are not part of the RGL
  * TestAttempto
    * abstract TestAttempto = Attempto
    * adds test vocabulary

### Language-specific (e.g. Ace)

  * AttemptoAce
    * concrete AttemptoAce of Attempto = SymbolsC,NumeralAce ** AttemptoI with ...
  * LexAttemptoAce
    * instance LexAttemptoAce of LexAttempto
  * TestAttemptoAce
    * concrete TestAttemptoAce of TestAttempto = AttemptoAce ** open SyntaxAce, ParadigmsAce, ...
