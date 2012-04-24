# Makefile - various shorcuts for common testing tasks
# Can undoubtedly be made nicer, but anyway
# JJC

test_all:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,Eng}.gf"
	bash run-all-tests.bash

test_acewiki_aceowl:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,Eng}.gf"
	bash run-test.bash tests/acewiki_aceowl/sentences.txt

test_ontograph_40:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/ontograph_40/TestAttempto{Ace,}.gf"
	bash run-test.bash tests/ontograph_40/sentences.txt

interactive_acewiki_aceowl:
	gf --path=present:grammars/acewiki_aceowl:words/acewiki_aceowl:lib/src/ace:lib/src/api "words/acewiki_aceowl/TestAttemptoAce.gf"

batch_acewiki_aceowl:
	clear
	gf --batch --path=present:grammars/acewiki_aceowl:words/acewiki_aceowl:lib/src/ace:lib/src/api "words/acewiki_aceowl/TestAttemptoAce.gf"

