convert_acewiki="${HOME}/mywork/AceWiki/AceWiki/AceWiki/tools/convert_acewiki.py"
data="../../tests/geo/geo.acewikidata"
name="Geo"
grammar="../../grammars/acewiki_aceowl/"

python ${convert_acewiki} -i $data -f gfabs -n $name > ${name}.gf
python ${convert_acewiki} -i $data -f gfconc -n $name > ${name}Eng.gf

gf --make --optimize-pgf --mk-index --path "present:${grammar}" ${name}Eng.gf

# TODO: run a test against the wiki content
