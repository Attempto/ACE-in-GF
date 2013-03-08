#! /usr/bin/env python

# Author: Kaarel Kaljurand
# Version: 2013-02-21
#
# Example:
#   $ echo "hallo" | python make_gf_parse_lin_command.py --lang=Ger --cat=Phrase
#   p -lang=Ger -cat=Phrase "hallo" | l -treebank

import sys
import argparse

def process_lines(lang_in, lang_out, cat):
	for line in sys.stdin:
		line = line.strip()
		process_line(lang_in, lang_out, cat, line)


def process_line(lang_in, lang_out, cat, line):
	serialize_command(lang_in, lang_out, cat, line)


# TODO: add escaping
def serialize_command(lang_in, lang_out, cat, line):
	print 'p -lang={:} -cat={:} "{:}" | l -lang={:} -treebank'.format(lang_in, cat, line, lang_out)


parser = argparse.ArgumentParser(description='Makes a GF parse + linearize command')

parser.add_argument('-l', '--lang-in',
	type=str, action='store', dest='lang_in',
	default='Ace',
	help='3-letter language code, e.g. Ger (defaults to Ace)')

parser.add_argument('--lang-out',
	type=str, action='store', dest='lang_out',
	help='3-letter language code, e.g. Ger (defaults to Ace)')

parser.add_argument('-c', '--cat',
	type=str, action='store', dest='cat',
	default='ACEText',
	help='start category (defaults to ACEText)')

parser.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')

args = parser.parse_args()

if args.lang_out is None:
	args.lang_out = ""
else:
	args.lang_out = args.lang_out.replace(' ', ',')

process_lines(args.lang_in, args.lang_out, args.cat)
