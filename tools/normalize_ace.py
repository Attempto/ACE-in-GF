#! /usr/bin/env python

# Normalizing ACE sentences by lowercasing function words and
# splitting punctuation off the words.
#
# Author: Kaarel Kaljurand
# Version: 2012-04-18
#
# Example:
#
# echo "Every man likes Mary." | python normalize_ace.py
# every man likes Mary .
#
import sys
import argparse
import re

# TODO: complete this set
punctuation = re.compile(r"""
	(?P<PUNCT>[,.?!])
""", re.VERBOSE)

# TODO: complete this set
function_words = frozenset([
'if',
'every',
'everything',
'no',
'nothing',
'nobody'
])


def process_lines():
	"""
	"""
	for line in sys.stdin:
		line = line.strip()
		process_line(line)


def process_line(line):
	tokens = get_tokens(line)
	ntokens = normalize_tokens(tokens)
	serialize_tokens(ntokens)


def get_tokens(string):
	"""
	"""
	return punctuation.sub(' \g<PUNCT>', string).split(' ')


def normalize_tokens(tokens):
	return list( map( (lambda x: normalize_token(x)), tokens) )


def normalize_token(token):
	if token.lower() in function_words:
		return token.lower()
	else:
		return token


def serialize_tokens(tokens):
	print '{:}'.format(' '.join(tokens).encode('utf8'))


parser = argparse.ArgumentParser(description='Normalize ACE sentences')

parser.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')

args = parser.parse_args()

process_lines()
