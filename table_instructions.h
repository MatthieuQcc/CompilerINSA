#ifndef ASMH
#define ASMH

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

typedef struct
{
    char* operation;
    int r0;
    int r1;
    int r2;
    int code_ope;
} my_instr;


// Ajoute une instruction à la table des instructions
int addInstrToTable(char* operation, int r0, int r1, int r2);

//Retourne l'index de la derniere instruction dans le tableau des instructions 
int getLastInstr();

int patchJump (int oldAdd, int newAdd, char* ope);

int addressVarTemp();

/* void removeVarTemp(); */

void print_instruction_table();


void interpreter_asm();

#endif