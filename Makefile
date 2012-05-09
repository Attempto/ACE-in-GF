# Makefile - various shorcuts for common testing tasks
# Can undoubtedly be made nicer, but anyway
# JJC

# Paths to things
path = present:grammars/acewiki_aceowl:words/acewiki_aceowl:lib/src/ace:lib/src/api
grammars = grammars/acewiki_aceowl
words = words/acewiki_aceowl
words_onto = words/ontograph_40
tests_onto = tests/ontograph_40

# Language list. Urdu was giving problems, so we ignore it :(
languages = Ace Eng Fin Fre Ger Ita Swe

# Compile application grammars in all languages
all_grammars:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(grammars)/Attempto$(lang).gf)

# Compile acewiki-aceowl test grammars in all languages
all_test:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(words)/TestAttempto$(lang).gf)

# Compile ontograph test grammars in all languages
all_ontograph_40:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf)

# Parse ontograph_40 sentences and linearise into all languages
lin_ontograph_40:
	echo "rf -lines -file=$(tests_onto)/sentences.txt | p -lang=Ace -cat=ACEText | l -treebank" | \
	gf --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf)

lin_ontograph_40_save:
	echo "rf -lines -file=$(tests_onto)/sentences.txt | p -lang=Ace -cat=ACEText | l -treebank" | \
	gf --run --verbose=0 --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf) > $(tests_onto)/lin.txt

# Build the test grammar, as a batch or keeping the GF shell open
build_test_batch:
	clear
	gf --batch --path=$(path) $(words)/TestAttemptoAce.gf
build_test_interactive:
	gf --path=$(path) $(words)/TestAttemptoAce.gf

# Clean all gfo files everywhere
clean:
	find -name *.gfo | xargs rm

# Test the syntactic coverage and ambiguity of Ace against the codeco test-set
test_acewiki_aceowl:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,}.gf"
	bash run-test.bash tests/acewiki_aceowl/sentences.txt

test_acewiki_aceowl_with_diff:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,}.gf"
	bash run-test.bash tests/acewiki_aceowl/sentences.txt
	diff tests/acewiki_aceowl/test_out.txt test_out.txt

# Test the syntactic coverage and ambiguity of Ace against the ontograph test-set
test_ontograph_40:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/ontograph_40/TestAttempto{Ace,}.gf"
	bash run-test.bash tests/ontograph_40/sentences.txt

# Test the precision by generating random trees and parsing them with Codeco
test_precision:
	bash run-precision-test.bash 1000
#	bash run-precision-test.bash
