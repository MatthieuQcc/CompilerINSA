#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>


typedef struct
{
    char* instruction;
    int r0;
    int r1;
    int r2;
} my_instr;


enum operation{
    ADD, SOU, MUL, DIV, COP, AFC, JMP, JMF, INF, SUP, EQU, PRI
};


// Ajoute une instruction à la table des instructions
void addtoTable(enum operation op, int r0, int r1, int r2);


