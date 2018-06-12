all: flex yacc compile test ps

flex: plex.l
	flex $^
yacc: grammarParser.y
	yacc -d $^
compile: lex.yy.c y.tab.c
	gcc lex.yy.c y.tab.c -o run.out
test: run.out example
	./run.out < example | tee mygraph.dot
ps: mygraph.dot
	dot -Tps mygraph.dot -o mygraph.ps

clean: 
	rm lex.yy.c run.out y.tab.c y.tab.h mygraph.ps mygraph.dot
