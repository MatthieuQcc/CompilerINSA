#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char * var;
    int ind;
    char *type;
    int prof; 

} symbol;


typedef struct {
    symbol currentSymbol;
    symbList *next;
} symbList;

symbList newList;


void checkSymbol(symbol, symbList); // Regarde si un symbole existe

void addSymbol(); // Ajoute un symbole

