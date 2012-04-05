ace="../../lib/src/ace/"
api="../../lib/src/api/"
grammar="../../grammars/attempto/"

path="present:${grammar}:${ace}:${api}"


swipl -f none -g main -t halt -s clex_to_gf.pl

gf --batch --path $path Clex*.gf
