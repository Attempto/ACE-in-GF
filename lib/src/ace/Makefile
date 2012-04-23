# Makefile for ACE Resource Grammar
# JJC

batch: *.gf
	gf --batch --path alltenses AllAce.gf

interactive: *.gf
	gf --path alltenses AllAce.gf

dg: *.gf
	echo "i --retain AllAce.gf \n dg " | gf --path alltenses
	dot -Tpng _gfdepgraph.dot > dg.png
	rm _gfdepgraph.dot
