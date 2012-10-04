#! /usr/bin/env python

# Author: Kaarel Kaljurand
# Version: 2012-05-21
#
# Examples:
#
# python make_lang.py --lang Abc --dir grammars/acewiki_aceowl/ --wdir words/ontograph_40/
#
import sys
import argparse
import os
import re
from string import Template

template_lex = Template("""instance LexAttempto${lang} of LexAttempto =
  open
   Syntax${lang},
   Paradigms${lang},
   ConstructX,
   (E = Extra${lang}),
   (L = Lang${lang})
   in {

flags coding=utf8 ;

oper
  false_A = mkA "false" ;

  adj_thatCl : A -> S -> Cl = \\a,s -> mkCl (mkVP (mkAP (mkAP a) s)) ;

  exactly_AdN = ConstructX.mkAdN "exactly" ;

} ;
""")

template_conc = Template("""--# -path=.:present

concrete Attempto${lang} of Attempto = SymbolsC, Numeral${lang}, NullVPS ** AttemptoI with
  (Syntax = Syntax${lang}),
  (Symbolic = Symbolic${lang}),
  (LexAttempto = LexAttempto${lang}) ** {

  oper S2QS : Syntax.S -> Syntax.QS = \s -> lin QS {s = \\\\_ => s.s} ; -- TODO
       
  lin ipNPQ ip = lin NP ( ip ** { } ) ; -- TODO

} ;
""")


template_words = Template("""--# -path=.:present

concrete TestAttempto${lang} of TestAttempto = Attempto${lang} **
  open Syntax${lang}, Paradigms${lang}, (L=Lexicon${lang}) in {

flags coding=utf8;

lin officer_N = mkCN (mkN "officer") ;
lin traveler_N = mkCN (mkN "traveler") ;
lin woman_N = mkCN L.woman_N ;
lin man_N = mkCN L.man_N ;
lin golfer_N = mkCN (mkN "golf" "player") ;
lin present_N = mkCN (mkN "present") ;
lin aquarium_N = mkCN (mkN "aquarium") ;
lin picture_N = mkCN (mkN "picture") ;
lin person_N = mkCN L.person_N ;

lin mary_PN = mkPN "Mary" ;
lin tom_PN = mkPN "Tom" ;
lin lisa_PN = mkPN "Lisa" ;
lin john_PN = mkPN "John" ;
lin sue_PN = mkPN "Sue" ;
lin bill_PN = mkPN "Bill" ;

lin see_V2 = L.see_V2;
lin buy_V2 = L.buy_V2;
lin help_V2 = mkV2 (mkV "help") ;
lin admire_V2 = mkV2 (mkV "admire") ;
lin love_V2 = L.love_V2 ;
lin inspect_V2 = mkV2 (mkV "inspect") ;

} ;
""")


def write_file(dir, filename, content):
	"""
	"""
	path = os.path.join(dir, filename)
	print >> sys.stderr, 'Creating: ' + path
	f = open(path, 'w')
	f.write(content)
	f.close()


# Commandline arguments parsing
parser = argparse.ArgumentParser(description='Generates 2 GF modules for a given language')

parser.add_argument('-l', '--lang', type=str, action='store', dest='lang',
                   help='3-letter language code, e.g. Eng (OBLIGATORY)')

parser.add_argument('-d', '--dir', type=str, action='store', dest='dir',
                   default='.',
                   help='directory for the generated grammar files')

parser.add_argument('-w', '--wdir', type=str, action='store', dest='wdir',
                   default='.',
                   help='directory for the generated lexicon file')

parser.add_argument('-v', '--version', action='version', version='%(prog)s v0.1')

args = parser.parse_args()

if args.lang is None:
	print >> sys.stderr, 'ERROR: argument -l/--lang is not specified'
	exit()

write_file(args.dir, "Attempto" + args.lang + ".gf", template_conc.substitute(lang = args.lang))
write_file(args.dir, "LexAttempto" + args.lang + ".gf", template_lex.substitute(lang = args.lang))
write_file(args.wdir, "TestAttempto" + args.lang + ".gf", template_words.substitute(lang = args.lang))
