# Makefile - various shorcuts for common testing tasks
# Can undoubtedly be made nicer, but anyway
# JJC

# time.sh is a wrapper for 'sh', which just measures and logs the target's runtime
SHELL=./time.sh

attempto = Attempto

# Paths to things
p = grammars/acewiki_aceowl:lib/src/ace:lib/src/api
# path_base is deprecated
path_base = present:grammars/acewiki_aceowl:words/acewiki_aceowl:lib/src/ace:lib/src/api
path = $(path_base)
path = $(GF_EST_SRC)/estonian:$(GF_EST_SRC)/api:$(path_base)
grammars = grammars/acewiki_aceowl

words = words/acewiki_aceowl
words_onto = words/ontograph_40

tests = tests/
tests_onto = tests/ontograph_40
tests_onto_ext = tests/ontograph_ext

# Words
Geography = Geography
Simple = Simple
Words300 = Words300

# Start category of the grammar.
# This is explicitly provided for the PGF-compiler in order
# not to rely on the guessing of it, which in some cases
# seems to fail.
startcat = ACEText

# Language list
languages = Ace Ape Bul Cat Dan Dut Eng Est Fin Fre Ger Gre Ita Lav Nor Pol Ron Rus Spa Swe Urd

#langs_Geography = Ace Ape Dut Fin Ger Ita Spa
langs_Geography = Ace Ape Ger Spa
# Tracking the regression of these languages
langs_Geography_track = Ace Ape Ger Spa
langs_Simple = Ace

# The Words300 grammar uses a subset of the RGL lexicon.
# We try to include all the RGL languages here, i.e. also some
# that are not included in the above languages lists.
# This list intentionally lacks Ape and Eng.
# TODO: rename 'Ace' to 'Eng' because the RGL English lexicon is not technically an ACE lexicon,
# as it contains "words with spaces".
# TODO: include also Afrikaans, Japanese (currently did not compile), Nepalese, Punjabi, Sindhi.
langs_Words300 = Ace Bul Cat Chi Dan Dut Fin Fre Ger Gre Hin Ita Lav Mlt Nor Pol Ron Rus Spa Swe Tha Urd

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
	gf --make --path=$(path) --startcat=$(startcat) --optimize-pgf --mk-index $(foreach lang,$(languages),$(words)/TestAttempto$(lang).gf)

pgf_acewiki_aceowl_old_comp:
	gf --old-comp --make --path=$(path) --startcat=$(startcat) --optimize-pgf --mk-index $(foreach lang,$(languages),$(words)/TestAttempto$(lang).gf)

pgf_ontograph_40:
	gf --make --path=$(path) --startcat=$(startcat) --optimize-pgf --mk-index $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf)

pgf_Geography:
	gf --make --path=$(path) --startcat=$(startcat) --optimize-pgf --mk-index $(foreach lang,$(langs_Geography),words/$(Geography)/$(Geography)$(lang).gf)

# Compile Geography with Sentence as startcat.
# This gives a smaller PGF (with optimized compilation).
# TODO: investigate: 'pg -funs' still returns all the functions, even those that cannot be used
pgf_Geography_Sentence:
	gf --make --path=$(path) --startcat=Sentence --optimize-pgf --mk-index $(foreach lang,$(langs_Geography),words/$(Geography)/$(Geography)$(lang).gf)

pgf_Geography_evaluation: modify_Geography pgf_Geography_Sentence restore_Geography

# Removes some functions from the grammar and stores the result into words/Geography/
# so that the compiler sees it first there.
modify_Geography:
	fgrep -vf grammars/exclude/evaluation.fgrep grammars/acewiki_aceowl/$(attempto).gf > words/Geography/$(attempto).gf
	fgrep -vf grammars/exclude/evaluation.fgrep grammars/acewiki_aceowl/$(attempto)I.gf > words/Geography/$(attempto)I.gf

restore_Geography:
	rm -f words/Geography/$(attempto).gf
	rm -f words/Geography/$(attempto)I.gf

pgf_Simple:
	gf --make --path=$(path) --startcat=$(startcat) --optimize-pgf --mk-index $(foreach lang,$(langs_Simple),words/$(Simple)/$(Simple)$(lang).gf)

pgf_Words300:
	gf --make --path=$(path) --startcat=$(startcat) --optimize-pgf --mk-index $(foreach lang,$(langs_Words300),words/$(Words300)/$(Words300)$(lang).gf)

lin_Words300_save: pgf_Words300
	cat $(tests)$(Words300)/sentences.txt | sed -f tools/make_gf_parse_lin_command.sed | \
	gf --run Words300.pgf > tests/$(Words300)/lin.txt

# Parse ontograph_40 sentences and linearise into all languages
lin_ontograph_40:
	echo "rf -lines -file=$(tests_onto)/sentences.txt | p -lang=Ace -cat=ACEText | l -treebank" | \
	gf --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf)

lin_ontograph_40_save:
	echo "rf -lines -file=$(tests_onto)/sentences.txt | p -lang=Ace -cat=ACEText | l -treebank" | \
	gf --run --verbose=0 --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf) > $(tests_onto)/lin.txt

lin_ontograph_ext_save:
	echo "rf -lines -file=$(tests_onto_ext)/sentences.txt | p -lang=Ace -cat=ACEText | l -treebank" | \
	gf --run --verbose=0 --path=$(path) $(foreach lang,$(languages),$(words_onto)/TestAttempto$(lang).gf) > $(tests_onto_ext)/lin.txt

lin_Geography_save:
	for inputlang in $(langs_Geography_track); do \
		cat tests/$(Geography)/$$inputlang/sentences.txt | \
		python tools/make_gf_parse_lin_command.py --lang-in=$$inputlang --lang-out="$(langs_Geography_track)" --cat=ACEText | \
		gf --run --verbose=0 --path=$(p) $(foreach lang,$(langs_Geography),words/$(Geography)/$(Geography)$(lang).gf) > tests/$(Geography)/$$inputlang/lin.txt ; \
	done

# echo "pg -lang=Ger -words" | gf --run Geography.pgf | tr ' ' '\012'
words_Geography_save:
	for inputlang in $(langs_Geography_track); do \
		echo "pg -lang=$$inputlang -words" | \
		gf --run Geography.pgf | \
		tr ' ' '\012' > tests/$(Geography)/$$inputlang/words.txt ; \
	done

# This does not fail if one of the sentences fails (unlike "rf -lines | p")
# TODO: We assume that pgf_acewiki_aceowl produces TestAttempto.pgf with all the languages
lin_acewiki_aceowl_save: pgf_acewiki_aceowl
	cat $(tests)/acewiki_aceowl/sentences.txt | sed -f tools/make_gf_parse_lin_command.sed | \
	gf --run TestAttempto.pgf > $(tests)/acewiki_aceowl/lin.txt

# Print out the trees that correspond to the ontograph_40 test sentences
tree_ontograph_40: pgf_ontograph_40
	echo "rf -lines -file=$(tests_onto)/sentences.txt | p -lang=Ace -cat=ACEText" | \
	gf --run TestAttempto.pgf


# Build the test grammar, as a batch or keeping the GF shell open
build_test:
	clear
	gf --batch --path=$(path) $(words)/TestAttemptoAce.gf
interactive:
	gf --path=$(path) $(words)/TestAttemptoAce.gf

# Clean all gfo files everywhere
clean:
	find -name *.gfo | xargs rm -f

perf_compilation:
	for inputlang in $(languages); do \
		find -name *.gfo | xargs rm -f ; \
		time -f "%C\n%E real, %U user, %S sys" -o time.log -a gf --make --path=$(path) --startcat=$(startcat) --optimize-pgf --mk-index $(words)/TestAttempto$$inputlang.gf ; \
	done


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

# List all the functions in Words300
pg_funs_Words300: pgf_Words300
	echo "pg -funs" | gf --run Words300.pgf

# Test how generated trees cover the grammar functions
coverage_acewiki_aceowl_save:
	cat tests/acewiki_aceowl/lin.txt | grep "^TestAttempto: " | sed "s/^TestAttempto: //" | coverage.py -g TestAttempto.pgf > tests/acewiki_aceowl/coverage.txt

coverage_ontograph_ext_save:
	cat $(tests_onto_ext)/lin.txt | grep "^TestAttempto: " | sed "s/^TestAttempto: //" | coverage.py -g TestAttempto.pgf > $(tests_onto_ext)/coverage.txt

coverage_Words300_save:
	cat tests/$(Words300)/lin.txt | grep "^$(Words300): " | sed "s/^$(Words300): //" | coverage.py -g TestAttempto.pgf > tests/$(Words300)/coverage.txt

Parser: Parser.hs
	ghc --make -rtsopts -o Parser Parser.hs

Translator: Translator.hs
	ghc --make -o Translator Translator.hs
