# Makefile - various shorcuts for common testing tasks
# Can undoubtedly be made nicer, but anyway
# JJC

# Paths to things
path = present:grammars/acewiki_aceowl:words/acewiki_aceowl:lib/src/ace:lib/src/api
grammars = grammars/acewiki_aceowl
words = words/acewiki_aceowl
tests = tests/acewiki_aceowl
words_onto = words/ontograph_40
tests_onto = tests/ontograph_40

# Language list
languages = Ace Cat Dut Eng Fin Fre Ger Ita Spa Swe Urd

# Compile application grammars in all languages
all_grammars:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(grammars)/Attempto$(lang).gf)

# Compile acewiki-aceowl test grammars in all languages
all_test:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(words)/TestAttempto$(lang).gf)

# Compile ontograph test grammars in all languages
all_ontograph_40:
	gf --batch --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf)

pgf_acewiki_aceowl:
	gf --make --path=$(path) $(foreach lang,$(languages),$(words)/TestAttempto$(lang).gf)

pgf_ontograph_40:
	gf --make --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf)

# Parse ontograph_40 sentences and linearise into all languages
lin_ontograph_40:
	echo "rf -lines -file=$(tests_onto)/sentences.txt | p -lang=Ace -cat=ACEText | l -treebank" | \
	gf --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf)

lin_ontograph_40_save:
	echo "rf -lines -file=$(tests_onto)/sentences.txt | p -lang=Ace -cat=ACEText | l -treebank" | \
	gf --run --verbose=0 --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf) > $(tests_onto)/lin.txt

# This does not fail if one of the sentences fails (unlike "rf -lines | p")
lin_acewiki_aceowl_save:
	cat $(tests)/sentences.txt | sed -f tools/make_gf_parse_lin_command.sed | \
	gf --run --verbose=0 --path=$(path) $(foreach lang,$(languages),$(words)/TestAttempto$(lang).gf) > $(tests)/lin.txt

# Build the test grammar, as a batch or keeping the GF shell open
build_test:
	clear
	gf --batch --path=$(path) $(words)/TestAttemptoAce.gf
interactive:
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
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,}.gf"
	bash run-precision-test.bash 100

test_precision_range:
	bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,}.gf"
	bash run-precision-test.bash 100 3
	bash run-precision-test.bash 100 4
	bash run-precision-test.bash 100 5
	bash run-precision-test.bash 100 6
	bash run-precision-test.bash 100 7
