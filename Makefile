main: scanner.l
	flex  scanner.l
	gcc main.c lex.yy.c -o etapa1 -lfl

clean:
	rm -rf etapa1
