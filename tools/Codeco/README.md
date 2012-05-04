Codeco parser in DCG
====================

Files
-----

  - `testgrammar.pl`: parser in Codeco format (incl. a small test vocabulary)
  - `testgrammar_dcg.pl`: parser in DCG (automatically generated, do not edit!)
  - `compile.sh`: converts `testgrammar.pl` into `testgrammar_dcg.pl`
  - `parse.pl`: parses STDIN using `testgrammar_dcg.pl`

Usage
-----

> echo "Mary is a friend of Mary ." | swipl -f parse.pl -g main -t halt -q

	OK: [Mary,is,a,friend of,Mary,.]
