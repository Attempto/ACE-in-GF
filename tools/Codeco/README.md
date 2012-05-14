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

1. Add support for:

  - `isn't`
  - `aren't`
  - `don't`
  - `doesn't`

2. Every `of`-noun is also a noun and vice versa. This reflects better ACE
where there is no explicit `of`-noun category.

3. Add support for `nothing but`, because this construct is used in the
Ontograph testset.

4. `it_is_false that` now takes `simple_sentence_1` as its argument (was: `simple_sentence_2`),
i.e. `it is false that there is ...` is now possible, as well as
`it is false that it is false that ...`.


Usage
-----

The output (STDOUT) shows for each input sentence on a separate line
its tokenization (where two spaces mark the token border) and a prefix
`OK` or `FAIL` depending on whether parsing succeeded or not.

> echo "Mary is a friend of Mary ." | sh run.sh

	OK: Mary  is  a  friend of  Mary  .

> cat sentences.txt | sh run.sh

	OK: Mary  asks  Mary  .
	OK: Mary  is  a  friend of  at least  2  women  .  Mary  asks  Mary  .
	FAIL: this  sentence  should  fail  to  parse
	OK: everybody  asks  somebody  .
	...

Parsing the complete test set (19k sentences):

> time cat ../../tests/acewiki_aceowl/sentences.txt | sh run.sh > out.txt

	real	0m21.224s
	user	0m21.097s
	sys	0m0.144s
