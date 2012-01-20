Tests
=====

Each subdirectory stands for an ACE subset.

Subsets
-------

### ace

Full ACE.

### acewiki_aceowl

Subset of ACE that is used in AceWiki. OWL-compatible.

# acewiki_aceowl_modif

Same as `acewiki_aceowl` but some sentences are excluded
for testing purposes.


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
