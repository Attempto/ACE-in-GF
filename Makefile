# Makefile - various shorcuts for common testing tasks
# Can undoubtedly be made nicer, but anyway
# JJC

# Paths to things
path = present:grammars/acewiki_aceowl:words/acewiki_aceowl:lib/src/ace:lib/src/api
grammars = grammars/acewiki_aceowl
words = words/acewiki_aceowl
words_onto = words/ontograph_40

# Language list. Urdu was giving problems, so we ignore it :(
languages = Ace Eng Fin Fre Ger Ita Swe


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

# Compile application grammars in all languages
all_grammars:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(grammars)/Attempto$(lang).gf)

# Compile test grammars in all languages
all_test:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(words)/TestAttempto$(lang).gf)

# Parse ontograph_40 and linearise into all languages
lin_ontograph_40:
	echo "rf -lines -file=tests/ontograph_40/sentences.txt | p -lang=Ace -cat=ACEText | l -treebank" | \
	gf --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf)
#	gf --run --path=$(path) $(words_onto)/TestAttempto???.gf \


interactive_acewiki_aceowl:
	gf --path=$(path) $(words)/TestAttemptoAce.gf

batch_acewiki_aceowl:
	clear
	gf --batch --path=$(path) $(words)/TestAttemptoAce.gf

clean:
	find -name *.gfo | xargs rm

test_precision:
	bash run-precision-test.bash 100
