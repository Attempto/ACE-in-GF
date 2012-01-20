s="../acewiki_aceowl/sentences.txt"
cat $s | grep -v "mad-about" | sed -f simplify.sed | sort | uniq > sentences.txt
