# Makefile - various shorcuts for common testing tasks
# Can undoubtedly be made nicer, but anyway
# JJC

path = present:grammars/acewiki_aceowl:words/acewiki_aceowl:lib/src/ace:lib/src/api
grammars = grammars/acewiki_aceowl
words = words/acewiki_aceowl
languages = Ace Eng Fin Fre Ger Ita Swe
# languages = Ace Eng Fin Fre Ger Ita Swe Urd # Urdu was giving problems, so we ignore it!

test_all:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,Eng}.gf"
	bash run-all-tests.bash

test_acewiki_aceowl:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,}.gf"
	bash run-test.bash tests/acewiki_aceowl/sentences.txt

test_acewiki_aceowl_with_diff:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,}.gf"
	bash run-test.bash tests/acewiki_aceowl/sentences.txt
	diff tests/acewiki_aceowl/test_out.txt test_out.txt

test_ontograph_40:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/ontograph_40/TestAttempto{Ace,}.gf"
	bash run-test.bash tests/ontograph_40/sentences.txt

all_grammars:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(grammars)/Attempto$(lang).gf)

all_test:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(words)/TestAttempto$(lang).gf)

interactive_acewiki_aceowl:
	gf --path=$(path) $(words)/TestAttemptoAce.gf

batch_acewiki_aceowl:
	clear
	gf --batch --path=$(path) $(words)/TestAttemptoAce.gf

clean:
	find -name *.gfo | xargs rm


name = ACE-0_0_2.pgf
dir_gr = build/gr
random:
	echo "gr -cat=Text -number=1000 -depth=10 | l -treebank -bind" | gf --run $(name).pgf > $(dir_gr)/$(name).txt
# TODO: parse them all with the codeco parser...
