Ontograph 40
============

The goal of this test is to evaluate the multilingual representations
of the AceWiki sentences. These 40 sentences cover all the main
AceWiki sentence patterns and have a very clear set-theoretic meaning, e.g.

	Everything that is a traveler or that is an officer sees at most 1 aquarium.

means that the union of the sets `traveler` and `officer` is a subset of the
set of all instances that participate in the 1st argument position
in at most one `sees`-relation with an instance from the set `aquarium`.

The question is if this meaning is understood in the same way via all
the languages.

This testset can be used during development time to make sure that all these
sentences are parsed and translated in the desired way. The actual user
evaluation can be done using the
[Ontograph Framework](http://attempto.ifi.uzh.ch/site/docs/ontograph/) by
localizing the diagrams and
replacing ACE and MLL with the concrete languages described in this grammar.


Source
------

These are 40 sentences from the Ontograph experiments, see:

  - Tobias Kuhn's PhD thesis
  - <http://attempto.ifi.uzh.ch/site/docs/ontograph/>

Generated from the Ontograph testset like this:

> cat ?A.txt | grep ACE | grep "^[0-9]*a. " | sed "s/.*ACE: //" | normalize_ace.py


Notes
-----

  - Some OntoGraph sentence constructs are not in the AceWiki subset, e.g. `nothing but`
