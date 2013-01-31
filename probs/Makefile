# Makefile for some tasks

combined = combined.probs

all: help

help:
	@echo Targets:
	@echo
	@echo "  combine:     concatenate all probs-files"
	@echo

combine:
	rm -f $(combined)
	cat *.probs | sort | uniq > $(combined)
