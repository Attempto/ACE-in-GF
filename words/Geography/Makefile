name = Geography
csv = $(name).csv

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
	$(csv_to_grammar) --file $(csv)

build: fetch_csv make_gf
