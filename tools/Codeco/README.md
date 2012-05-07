Codeco parser in DCG
====================

Status
------

Works but tokenization should be improved:

  - split off punctuation
  - don't be affected by trailing whitespace (the current work-around is to pipe the input through `sed "s/ *$//"`)

Files
-----

  - `grammar.pl`: parser in Codeco format (incl. a small test vocabulary), comes from the AceWiki distribution, but modified
  - `grammar_dcg.pl`: parser in DCG (automatically generated, do not edit!)
  - `compile.sh`: converts `grammar.pl` into `grammar_dcg.pl`, only needed if you modify `grammar.pl`
  - `parse.pl`: parses STDIN using `grammar_dcg.pl`
  - `sentences.txt`: example input for `parse.pl`


Modifications to grammar.pl
---------------------------

Add support for:

  - `isn't`
  - `aren't`
  - `don't`
  - `doesn't`


Usage
-----

The output (STDOUT) shows for each input sentence on a separate line
its tokenization (where two spaces mark the token border) and a prefix
`OK` or `FAIL` depending on whether parsing succeeded or not.

> echo "Mary is a friend of Mary ." | swipl -f parse.pl -g main -t halt -q

	OK: Mary  is  a  friend of  Mary  .

> cat sentences.txt | swipl -f parse.pl -g main -t halt -q

	OK: Mary  asks  Mary  .
	OK: Mary  is  a  friend of  at least  2  women  .  Mary  asks  Mary  .
	FAIL: this  sentence  should  fail  to  parse
	OK: everybody  asks  somebody  .
	...

Parsing the complete test set (19k sentences):

> time cat ../../tests/acewiki_aceowl/sentences.txt | sed "s/ *$//" | swipl -f parse.pl -g main -t halt -q > out.txt

	real	0m21.224s
	user	0m21.097s
	sys	0m0.144s
	
**Warnings**

To hide all the warnings generated you can redirect STDERR, e.g. by appending:  `2> /dev/null`

