AceWiki ACE OWL
===============

Testing the AceWiki-supported OWL-compatible subset of ACE.


Generating the testset
----------------------

`sentences.txt` comes from
<https://github.com/AceWiki/AceWiki/tree/master/src/ch/uzh/ifi/attempto/acewiki/aceowl/test/sentences.txt>.
but it is filtered in order to:

  - remove sentences that contain the deprecated `such that`

To generate the testset, simply run:

> sh make_sentences.sh

Note that two spaces in `sentences.txt` mark the token border, while a single space
is a token-internal space.


Testing
-------

The test results are based on the acewiki_aceowl-grammar, i.e.

> bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,}.gf"
> bash run-test.bash tests/acewiki_aceowl/sentences.txt
