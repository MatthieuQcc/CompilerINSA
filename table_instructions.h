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
} my_instr;



// Ajoute une instruction à la table des instructions
void addInstrToTable(char* operation, int r0, int r1, int r2);

//Retourne l'index de la derniere instruction dans le tableau des instructions 
int get_index_last_instr ();

