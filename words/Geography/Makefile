name = Geography
csv = $(name).csv

languages = Ace Ape Ger Spa

#server = http://localhost:41296
server = http://attempto.ifi.uzh.ch:41297
#server = http://cloud.grammaticalframework.org

dir = /tmp/Geography/
#dir = /tmp/gfse.528744594/

includes_all = includes_all.txt

path = ../../grammars/acewiki_aceowl:../../lib/src/ace:../../lib/src/api

# This Google Apps Script returns the Geography spreadsheet in CSV
ws = "https://script.google.com/macros/s/AKfycbyMYJxM_qL7vS45r_NJJQC_4seepJk3faIkiw5zDIC3Lr9cGjE/exec"

# Assuming that csv_to_grammar.py is on the PATH.
csv_to_grammar = csv_to_grammar.py

help:
	@echo "Targets:"
	@echo "  - fetch_csv: gets the latest vocabulary"
	@echo "  - make_gf: converts the vocabulary into GF"
	@echo "  - build: fetch_csv + make_gf"

# -L is needed because Google does a redirect
fetch_csv:
	curl -L $(ws) > $(csv)

make_gf:
	$(csv_to_grammar) --file $(csv) --exclude delete > stdout.txt 2> stderr.txt
	cat stderr.txt | grep "Error"

make_gf_for_eval:
	$(csv_to_grammar) --file $(csv) --exclude delete,noeval > stdout.txt 2> stderr.txt
	cat stderr.txt | grep "Error"

build: fetch_csv make_gf

deploy:
	sh deploy.sh

includes_all:
	reachable-modules.py --path ${path} $(foreach lang,$(languages),$(name)$(lang).gf) | sed 's/$$/.gf/' > $(includes_all)

deploy_no_act: includes_all
	upload-grammar.py --server $(server) --dir $(dir) --ext "\.gf" --includes $(includes_all) --no-act . ../../lib/src/ ../../grammars/acewiki_aceowl/

deploy_yes_act: includes_all
	upload-grammar.py --server $(server) --dir $(dir) --ext "\.gf" --includes $(includes_all) . ../../lib/src/ ../../grammars/acewiki_aceowl/

cc:
	gf --path ../../grammars/acewiki_aceowl/
