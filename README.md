Attempto Controlled English in Grammatical Framework
====================================================

Introduction
------------

This project implements the syntax of Attempto Controlled English (ACE)
(version 6.6) in Grammatical Framework (GF) and ports it to
additional natural languages (_Ger_, _Ita_, ...).
Note that this project does not implement the ACE interpretation
rules or the mapping of ACE sentences to discourse representation structures.


Requirements
------------

### Coverage

The grammar should cover a reasonably large and interesting subset of ACE,
specifically the OWL-compatible subset that is supported by AceWiki.
Ideally, the grammar should cover the full ACE.

### Correctness

The grammar should not overgenerate. Since the grammar is going to
be used in a look-ahead editor (which explicitly exposes the coverage
of the grammar to the user), it should not support forms that fall
outside of ACE.

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

The first commit was based on the 2011-12-14 version of
the GF darcs repository `examples/attempto/`-directory implemented
by the GF developers in 2009 targeting ACE v6.0. See also the publication:

	K. Angelov and A. Ranta.
	Implementing Controlled Languages in GF.
	N. Fuchs (ed.), CNL-2009 Controlled Natural Languages, LNCS/LNAI 5972, 2010.

This version does not completely match ACE v6.6,
i.e. some ACE constructs are not supported, e.g.
(__(F)__ marks things that the current version has already fixed)

  * transitive adjectives: `mad-about` (`mad about` does not seem to work either)
  * __(F)__ exactly
  * __(F)__ less than
  * __(F)__ everybody
  * somebody X
  * somebody who
  * Mary who
  * X who
  * `which` as a question pronoun
  * `is not` and `isn't` are not equivalent
    * `a woman is not a man .` fails
    * `a woman isn't a man .` succeeds
    * `a woman is not every man .` succeeds
    * `a woman isn't every man .` succeeds
  * `are not` and `aren't` are not equivalent
  * `does not` and `doesn't` are not equivalent
  * `do not` and `don't` are not equivalent
  * __(F)__ `who` (instead of `whom`) in object relative clauses (`a woman who a man sees`)
  * dative shift (`John gives Mary an apple`)
  * `does wait` (as alternative to `waits`)
  * adjective coordination
    - a rich and lucky man waits .
    - John is rich and lucky .
  * John is more rich. (`John is richer` works)
  * John always runs. (`John runs always` works)

and it supports some constructs which in ACE do not exist, have been
deprecated or should be avoided (i.e. create a warning), e.g.

  * `he waits .` (and other unresolvable personal pronouns)
  * `the man waits .` (gives a warning in APE)
  * a man X is the man Y .
  * __(F)__ not more than, not at least, ...
  * numbers larger than 12 as words, e.g. `one hundred and thirty`
  * __(F)__ whom
  * such that
  * `- ( X + X ) waits .` (minus sign should be followed by a number)
  * `1 = - -1 .` (`-1` is a built-in GF integer)
  * __(F)__ `nothing except` (instead of `nothing but`)
  * ...


Building
--------

_Note: Urd and Fin are currently not included_

In order to build the PGF-file execute:

> ant clean

> bash make-pgf.bash

(Note that it is important that you use `bash`.)

The building will take about a minute on i3 given that _Fin_ is included.
The GF libraries are expected to be found in a system-wide location, e.g.:

  * ~/.cabal/share/gf-3.3/lib/present/
  * ~/.cabal/share/gf-3.3/lib/prelude/

In addition to building the PGF-file (`ACE-0_0_2.pgf`), `make-pgf.bash`

  * generates some random example sentences and
  * converts the PGF into a speech recognition grammar format (JSGF).

Both these additional outputs are only for testing purposes, they
are saved into the `build`-directory.

### Known problems

  * File `MakeStructuralUrd.gf` does not exist (when trying to build with _Urd_ included)

  * Category Phr is not in scope (when trying to parse with _Fin_ included)

  * random generation often gets stuck

  * JSGF produces zero-output with the error message `gf: mergeIdentical: Unknown_100_0`

  * completion sometimes does not work (with numbers?)
	
	TestAttempto> p -lang=Eng "1 = 
	(  -  X  Y
	TestAttempto> p -lang=Eng "1 = 1 ."
	baseText (sText (formulaS (eq_Formula (int_Term 1) (int_Term 1))))


Running
-------

Example of translating an ACE sentence to other languages.

> gf ACE-0_0_2.pgf

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


Testing
-------

### Parsing with GF

Parsing ACE sentences with `ACE-0_0_2.pgf`.

> ghc --make -o Parser Parser.hs

> cat examples/ace.txt | ./Parser ACE-0_0_2.pgf TestAttemptoAce

or

> bash run-test.bash examples/ace.txt

which creates two files

  * test_out.txt
  * test_out_fail.txt

To run tests on all the test cases in the tests-directory

> bash run-all-tests.bash > tests/run-all-tests.out 2> tests/run-all-tests.err

The output files are created into the subdirectories of the tests-directory.

### Generating with GF and parsing with APE

See the scripts and instructions in the `tools`-directory.


Changing
--------

Changes to the ACE grammar can be done in various places.

### lib/src/

ACE resource grammar. Based on the English resource grammar. Describes
deviations from the English grammar, e.g. ACE uses `who` instead of `whom`.
Currently almost completely identical to the English resource grammar, will
be refactored later.

### grammars/

Implementation of different ACE subsets and their ports to other languages.
Contains the common interface AttemptoI.gf.


### words/

Different domain vocabularies. These files should rather be automatically
generated from existing terminology databases.


Status
------

Status of this project in terms of ACE-compliance of the GF grammars
measured in different ways. We look at:

  * various ACE subsets
  * GF parsing
  * GF generation
  * GF translation correctness (?)

_Note: So far we have only looked at how many known ACE sentences the GF parser can parse. See more in the `tests`-directory._


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

### Language-specific (e.g. Eng)

  * AttemptoEng
    * concrete AttemptoEng of Attempto = SymbolsC,NumeralEng ** AttemptoI ...
  * LexAttemptoEng
    * instance LexAttemptoEng of LexAttempto
  * TestAttemptoEng
    * concrete TestAttemptoEng of TestAttempto = AttemptoEng ** open SyntaxEng, ParadigmsEng, IrregEng ...
