compiler: y.tab.c lex.yy.c
	gcc -o compiler y.tab.c lex.yy.c sym_table.c -ly -ll

lex.yy.c: analyseur_lexical
	flex analyseur_lexical

y.tab.c: compiler.y
	yacc -d -v -t compiler.y

test: compiler
	./compiler < test0.txt

clean:
	rm lex.yy.c y.tab.c y.tab.h
