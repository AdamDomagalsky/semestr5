all: flex compile test

flex: simple.rules
	flex simple.rules
compile: lex.yy.c
	gcc lex.yy.c -lfl
test: a.out example.cpp
	./a.out < example.cpp

