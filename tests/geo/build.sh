convert_acewiki="${HOME}/mywork/AceWiki/AceWiki/AceWiki/tools/convert_acewiki.py"
data="geo.acewikidata"

python ${convert_acewiki} -i $data -f sentences > sentences.txt
