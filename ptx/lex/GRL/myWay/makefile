all: flex yacc compile test

flex: plex.l
	flex plex.l
yacc: grammarParser.y
	yacc -d $^
compile: lex.yy.c y.tab.c
	gcc lex.yy.c y.tab.c -o run.out
test: run.out example4lexNyaccDi
	./run.out < example4lexNyaccDi

clean: 
	rm lex.yy.c run.out y.tab.c y.tab.h 