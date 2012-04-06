Tests
=====

Each subdirectory stands for an ACE subset.

Subsets
-------

### ace

Full ACE.

Since there is no generator, we use the APE regression test set.
We take all the snippets that APE parsed correctly into a non-empty DRS.
Some normalization is performed, e.g.

  * sentence-initial function words are lowercased
  * punctuation marks are separated from the words

Results with the large Clex as the lexicon:

  * Parsed: 1212
  * NOT parsed: 1560
  * Runtime: ~10 minutes (large lexicon slows GF down)


### acewiki_aceowl

__AceWiki-supported fragment of ACE OWL__

AceWiki test set obtained by exhaustive generation with the Codeco grammar.
Content words: ask, Mary, woman, friend, mad-about.

  * Total: 19718
  * Runtime: ~39 sec

A few reasons (i.e. words and phrases) that cause the parse to fail:

  * mad-about (`mad about` does not seem to work either)
  * somebody X
  * somebody does
  * somebody who
  * Mary who
  * X who
  * is/are not
  * does/do not
  * which (as a question pronoun)


### acewiki_aceowl_modif

Same as `acewiki_aceowl` but some sentences are excluded.
These sentences feature constructs which are probably easy to fix.
Result: ~60% parsed.

### aceeditor

_Work in progress_

The ACE Editor subset is between AceWiki ACEOWL and full ACE.


Test files
----------

Each directory contains the following files.

### sentences.txt

Input sentences for the test.

### test_out.txt

Output of the test on the test sentences.
Each sentence is classified as __OK__ or __FAIL__.
In the latter case, the successfully parsed beginning of the sentence
is also provided.

### test_out_fail.txt

Frequency ranking of beginnings of sentences the parsing of which
failed (after the beginning).
This file helps to find the most common problem for the failure.
