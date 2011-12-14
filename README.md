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

### Knows problems

  * random generation sometimes gets stuck
  * JSGF produces zero-output with the error message `gf: mergeIdentical: Unknown_100_0`
