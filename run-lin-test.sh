# Measures the "parse ACE + linearize as X" time of the given PGF for every language X.
tests="tests/acewiki_aceowl"
languages="Cat Dut Eng Fin Fre Ger Ita Spa Swe Urd"

name="ACE-0_0_2"

# ACE-0_0_2.pgf is compiled with the AceWiki grammar and all the languages.
bash make-pgf.bash grammars/acewiki_aceowl/ "words/acewiki_aceowl/TestAttempto{Ace,Cat,Dut,Eng,Fin,Fre,Ger,Ita,Spa,Swe,Urd}.gf"

for lang in ${languages}; do
	echo "Translating to ${lang}" ;
	t1=`date +%s` ;
	cat ${tests}/sentences.txt | \
	./Translator ${name}.pgf ACEText TestAttemptoAce TestAttempto${lang} > out_${lang}.txt ;
	t2=`date +%s` ;
	t=`echo "scale=3; ($t2-$t1)/60" | bc`;
	echo "${lang}: $t minutes" ;
done
