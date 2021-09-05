url='https://raw.github.com/Attempto/APE/master/prolog/lexicon/clex_lexicon.pl'
filename='clex.pl'

ace="../../lib/src/ace/"
api="../../lib/src/api/"
grammar="../../grammars/ace/:../../grammars/acewiki_aceowl/"

curl -L https://raw.github.com/Attempto/APE/master/prolog/lexicon/clex_lexicon.pl > clex.pl

path="present:${grammar}:${ace}:${api}"

swipl -f none -g "main('${url}', '${filename}')" -t halt -s download_clex.pl

gf +RTS -K100M -RTS --preproc=mkPresent --make --optimize-pgf --path $path Clex*.gf
