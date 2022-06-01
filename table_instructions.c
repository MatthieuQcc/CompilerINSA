#include "table_instructions.h"

#define MAX_INSTR 2000

my_instr tabInstr [MAX_INSTR];
int tab_index = 0;

//Instructions : ADD, MUL, SOU, DIV, COP, AFC, JMP, JMF, INF, SUP, EQU, PRI

void addInstrToTable( char* operation, int r0, int r1, int r2){
    
    my_instr instruction = {.operation="operation",.r0=r0,.r1=r1,.r2=r2};
    tabInstr[tab_index] = instruction;
    tab_index ++;

}

int get_index_last_instr() {
    return tab_index;
}


