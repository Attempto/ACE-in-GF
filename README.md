Attempto Controlled English in Grammatical Framework
====================================================

Introduction
------------

This project implements the Attempto Controlled English (ACE)
grammar in Grammatical Framework (GF) and ports it to
additional natural languages (Ger, Ita, ...).


First commit
------------

The first commit was based on the 2011-12-14 version of
the GF darcs repository `examples/attempto`-directory implemented
by the GF developers (in 2009).

This version does not completely match (the latest version of) ACE,
i.e. some ACE constructs are not supported, e.g.

  * transitive adjectives: `mad-about` (`mad about` does not seem to work either)
  * exactly
  * everybody
  * somebody X
  * somebody does
  * somebody who
  * Mary who
  * X who
  * `which` as a question pronoun
  * `is not` and `isn't` are not equivalent
    * `a woman is not a man .` fails
    * `a woman isn't a man .` succeeds
  * `are not` and `aren't` are not equivalent
  * `does not` and `doesn't` are not equivalent
  * `do not` and `don't` are not equivalent
  * ...

and it supports some constructs which in ACE do not exist, have been
deprecated or should be avoided (i.e. create a warning), e.g.

  * he waits .
  * a man X is the man Y .
  * ...


Building
--------

_Note: only Eng and Ger are currently supported_

In order to build the PGF-file execute:

> ant clean

> bash make-pgf.bash

The GF libraries are expected to be found in a system-wide location, e.g.:

  * ~/.cabal/share/gf-3.3/lib/present/
  * ~/.cabal/share/gf-3.3/lib/prelude/

In addition to building the PGF-file the `make-pgf.bash` also
generates some random example sentences and converts the grammar
into JSGF. Both these outputs are only for testing purposes.

### Known problems

  * random generation sometimes gets stuck
  * JSGF produces zero-output with the error message `gf: mergeIdentical: Unknown_100_0`


Testing
-------

> ghc --make -o Parser Parser.hs

> cat examples/ace.txt | ./Parser build/pgf/TestAttempto.pgf

or

> ./run_test.sh examples/ace.txt

which creates two files

  * test_out.txt
  * test_out_fail.txt


Status
------

Status of this project in terms of ACE-compliance of the GF grammars
measured in different ways. We look at:

  * various ACE subsets
  * GF parsing
  * GF generation
  * GF translation correctness (?)

### AceWiki supported fragment of ACE OWL

AceWiki test set obtained by exhaustive generation with the Codeco grammar.
Content words: ask, Mary, woman, friend, mad-about.

  * Total: 19718
  * Parsed: 5609
  * NOT parsed: 14109
  * Runtime: ~39 sec

Examples of parsed:

  * for every woman it is false that a woman is the woman .
    * für jede Frau ist es falsch daß eine Frau die Frau ist .

A few reasons (i.e. words and phrases) that cause the parse to fail:

  * mad-about (`mad about' does not seem to work either)
  * somebody X
  * somebody does
  * somebody who
  * Mary who
  * X who
  * is/are not
  * does/do not
  * which (as a question pronoun)


### ACE Editor

_Work in progress_


### Full ACE

_Work in progress_

Since there is no generator, we use the APE regression test set.


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
