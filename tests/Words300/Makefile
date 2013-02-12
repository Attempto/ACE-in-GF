
sentences = sentences.txt

sentences:
	cat ../ontograph_ext/$(sentences) | sed -f s.sed > $(sentences)

check:
	cat lin.txt | grep Words300Ace | sed "s/^Words300Ace: //" > tmp.lin.txt
	diff $(sentences) tmp.lin.txt
