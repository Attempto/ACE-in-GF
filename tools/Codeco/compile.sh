
prefix=${HOME}/mywork/AceWiki/AceWiki/AceWiki/src/ch/uzh/ifi/attempto/codeco/

validate_codeco=${prefix}/validate_codeco.pl
generate_dcg=${prefix}/generate_dcg.pl

swipl -s $validate_codeco -g "validate_codeco('grammar.pl')" -t halt
swipl -s $generate_dcg -g "generate_dcg('grammar.pl', 'grammar_dcg.pl')" -t halt
