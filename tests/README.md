Tests
=====

Each subdirectory stands for a test, i.e. contains the test input (sentences)
and test output. The main tests are listed below.

### ace

_Full ACE_

Since there is no generator, we use the APE regression test set.
We take all the snippets that APE parsed correctly into a non-empty DRS.
Some normalization is performed, e.g.

  * sentence-initial function words are lowercased
  * punctuation marks are separated from the words

Results (somewhat older) with the large Clex as the lexicon:

  * Parsed: 1212
  * NOT parsed: 1560
  * Runtime: ~10 minutes (large lexicon slows GF down)


### acewiki_aceowl

_AceWiki-supported fragment of ACE OWL_

AceWiki test set obtained by exhaustive generation with the Codeco grammar.
Content words: ask, Mary, woman, friend, mad-about.

  * Total: 19422
  * Runtime: ~55 sec

Test using `test_acewiki_aceowl_with_diff`.


### ontograph_40

Sentences for the evaluation of translation correctness.

  - Coverage test: `test_ontograph_40`
  - Multilinguality test: `lin_ontograph_40_save`


Test files
----------

Each directory contains the following files.

### sentences.txt

Input sentences for the test.

### test_out.txt

Output of the test on the input sentences.
Each sentence is classified as __OK__ or __FAIL__, depending on
whether it was successfully parsed or not.
In case of __OK__, the ambiguity (number of corresponding abstract trees)
is shown in parentheses.
In case of __FAIL__, the successfully parsed beginning of the sentence is shown.

### test_out_fail.txt

Frequency ranking of beginnings of sentences the parsing of which
failed (after the beginning).
This file helps to find the most common problem for the failure.
