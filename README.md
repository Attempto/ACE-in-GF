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
between ACE and a number of other controlled natural languages, i.e.
_ACE-like_ German, Italian, Finnish, etc.


Reference implementations
-------------------------

  * The reference ACE parser (APE) can be obtained from <https://github.com/Attempto/APE>. There is a web-based demo at <http://attempto.ifi.uzh.ch/ape/>.

  * The reference AceWiki grammar can be found at <https://github.com/AceWiki/AceWiki/tree/master/src/ch/uzh/ifi/attempto/acewiki/aceowl/>. There is a web-based demo at <http://attempto.ifi.uzh.ch/acewiki/>.


Building
--------

_Note: based on GF darcs version: 2013-03-15 18:13:25 CET_

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

  * ~/.cabal/share/gf-3.4/lib/present/
  * ~/.cabal/share/gf-3.4/lib/prelude/

and they should correspond to the GF version listed above (as the GF darcs push
timestamp).


Running
-------

Example of translating an ACE sentence to other languages.

	$ make pgf_Words300
	$ gf Words300.pgf
	Words300> p -lang=Ace -cat=Text "it is false that X is read by nothing but computers that Y does not see ." | l -treebank
	Words300: sText (falseS ... see_V2))))))
	Words300Ace: it is false that X is read by nothing but computers that Y doesn't see .
	Words300Cat: és fals que X està llegit per nomÈs ordinadors que Y no veu .
	Words300Dan: det er falsk at X bliver læst af kun datamaskiner som Y ikke ser .
	Words300Dut: 't is onwaar dat X door slechts computers die Y niet ziet gelezen wordt .
	Words300Fin: on epätotta että X luetaan vain tietokoneiden joita Y ei näe toimesta .
	Words300Fre: il est faux que X est lu par seulement des ordinateurs qu' Y ne voit pas .
	Words300Ger: es ist falsch dass X durch nur Rechner die Y nicht sieht gelesen wird .
	Words300Ita: è falso che X viene letto da soltanto computer che Y non vede .
	Words300Lav: ir tiesa , ka X lasa tikai datorus , ko Y neredz .
	Words300Nor: det er falsk at X blir lest av kun datamaskiner som Y ikke ser .
	Words300Pol: jest źle , że X przez tylko komputery , których nie widzi Y jest czytane .
	Words300Ron: este fals cã X este citit de către doar nişte calculatoare pe care nu le vede Y .
	Words300Rus: неверно , что X читается с помощью единственных компьютеров , которые Y не видит .
	Words300Spa: es falso que X está leído por solamente computadoras que Y no ve .
	Words300Swe: det är falskt att X blir läst av bara datorer som Y inte ser .


Testing
-------

### Requirements

Some tools need to be installed and available on the PATH:

  - GF-Utils, <https://github.com/Kaljurand/GF-Utils>

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

### Coverage of tree generators

  - `coverage_acewiki_aceowl_save`
  - `coverage_ontograph_ext_save`

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

Different domain vocabularies, most of which are automatically generated
from existing external terminologies.


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


Papers
------

  - [MOLTO project Deliverable D11.1](http://www.molto-project.eu/biblio/deliverable/ace-grammar-library)
