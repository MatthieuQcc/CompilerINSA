#include "table_instructions.h"

#define MAX_INSTR 2000

my_instr tabInstr [MAX_INSTR];
int tab_index = 0;

//Instructions : ADD, MUL, SOU, DIV, COP, AFC, JMP, JMF, INF, SUP, EQU, PRI

void addInstrToTable( char* operation, int r0, int r1, int r2){
    
    my_instr instruction = {.operation="operation",.r0=r0,.r1=r1,.r2=r2};
    
    if (strcmp(operation, "ADD")==0) {
        instruction.code_ope = 1;
    } else if (strcmp(operation, "MUL")==0) {
        instruction.code_ope = 2;
    } else if (strcmp(operation, "SOU")==0) {
        instruction.code_ope = 3;
    } else if (strcmp(operation, "DIV")==0) {
        instruction.code_ope = 4;
    } else if (strcmp(operation, "COP")==0) {
        instruction.code_ope = 5;
    } else if (strcmp(operation, "AFC")==0) {
        instruction.code_ope = 6;
    } else if (strcmp(operation, "JMP")==0) {
        instruction.code_ope = 7;
    } else if (strcmp(operation, "JMF")==0) {
        instruction.code_ope = 8;
    } else if (strcmp(operation, "INF")==0) {
        instruction.code_ope = 9;
    } else if (strcmp(operation, "SUP")==0) {
        instruction.code_ope = 0xA ;
    } else if (strcmp(operation, "EQU")==0) {
        instruction.code_ope = 0xB;
    } else if (strcmp(operation, "PRI")==0) {
        instruction.code_ope = 0xC;
    } 
    
    tabInstr[tab_index] = instruction;
    tab_index ++;

}

int get_index_last_instr() {
    return tab_index;
}



void print_table (FILE* file, my_instr tabinstr) {
    fprintf(file, "|%s|%d|%d|%d|%d|\n",tabinstr.operation, tabinstr.r0, tabinstr.r1, tabinstr.r2);
}


