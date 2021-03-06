GRM=analyzer.y
LEX=analyzer.l
BIN=analyzer

CC=gcc
CFLAGS=-Wall -g

OBJ=y.tab.o lex.yy.o #main.o  

all: $(BIN)

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

y.tab.c: $(GRM)
	yacc -d -v -t $<

lex.yy.c: $(LEX)
	flex $<

$(BIN): $(OBJ)
	$(CC) $(CFLAGS) $(CPPFLAGS) table_symboles.c table_instructions.c $^ -o $@

clean:
	rm $(OBJ) y.tab.c y.tab.h lex.yy.c