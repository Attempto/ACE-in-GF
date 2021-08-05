clex='./clex_lexicon.pl'

ace="../../lib/src/ace/"
api="../../lib/src/api/"
grammar="../../grammars/ace/"

path="present:${grammar}:${ace}:${api}"


swipl -f none -g "main('$clex')" -t halt -s clex_to_gf.pl

gf +RTS -K100M -RTS --preproc=mkPresent --make --optimize-pgf --mk-index --path $path Clex*.gf
