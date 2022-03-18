/*
############################
#### Table des symboles ####
############################

main(){
    int a;
    int b;
    a=2;
    b=a+3;
}
Code en assembleur -> 
mov @a 2 [8, 4, 2]
mov 8 3      stock 3 en mémoire
add 8 8 4 on met dans 8 le résultat de ce qu'il y a dans @8 et @3 à savoir 3+2

A la compilation on fait le choix de l'organisation mémoire.
La structure de la TS va mapper l'orga mémoire.
On doit créer une pile.

Dec: Type tVar tPV
On empile

Paramètres:
nom | adresse | type | profondeur
 a  |    0    |  int | 0
 b  |    1    |  int | 0
    |         |      |

*/


#include <stdio.h>
#include <stdlib.h>

typedef struct {
    char *name;
    int address;
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

