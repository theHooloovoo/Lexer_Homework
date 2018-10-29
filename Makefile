
file: zjs.lex lex.yy.c
	flex zjs.lex ; clang lex.yy.c -lfl -o $@.out

clean:
	rm *.out
