#! /usr/bin/env python

# Outputs the length of each input sentence.
#
# Author: Kaarel Kaljurand
# Version: 2012-05-25
#
#
import sys
import argparse
import re

# TODO: complete this set
punctuation = re.compile(r"""
	(?P<PUNCT>[,.?!])
""", re.VERBOSE)


def process_lines():
	"""
	"""
	for line in sys.stdin:
		line = line.strip()
		if re.match('^\s*$', line):
			continue
		process_line(line)


def process_line(line):
	tokens = get_tokens(modify_line(line))
	serialize_tokens(tokens)


def modify_line(string):
	"""
	"""
	return punctuation.sub(' \g<PUNCT>', string)


def get_tokens(string):
	"""
	"""
	return re.split('\s+', string)


def serialize_tokens(tokens):
	print '{:}'.format(str(len(tokens)))


parser = argparse.ArgumentParser(description='Length of ACE sentences')

parser.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')

args = parser.parse_args()

process_lines()
