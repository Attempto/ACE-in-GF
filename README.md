Attempto Controlled English in Grammatical Framework
====================================================

Introduction
------------

This project implements the Attempto Controlled English (ACE)
grammar in Grammatical Framework (GF) and ports it into
additional natural languages (Ger, Ita, ...).

First commit was based on the 2011-12-14 version of
the GF darcs repository `examples/attempto`-directory.


Building
--------

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

> ghc --make -o trans Translator.hs

> cat examples/ace.txt | ./trans build/pgf/TestAttempto.pgf


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
  * Parsed: 2773
  * NOT parsed: 16945

Examples of parsed:

  * for every woman it is false that a woman is the woman .
    * für jede Frau ist es falsch daß eine Frau die Frau ist .

A few reasons (i.e. words and phrases) that cause the parse to fail:

  * mad-about (`mad about' does not seem to work either)
  * exactly
  * which (as a question pronoun)
  * is everybody
  * everybody is
  * who (as a relative clause pronoun)


### ACE Editor

_Work in progress_


### Full ACE

_Work in progress_

Since there is no generator, we use the APE regression test set.
