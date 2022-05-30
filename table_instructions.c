#include "table_instructions.h"

#define MAX_INSTR 2000

my_instr tabInstr [MAX_INSTR];
int tab_index = 0;



void addtoTable(enum operation op, int r0, int r1, int r2){
    my_instr new_instr = {op, r0, r1, r2};
    tabInstr[tab_index] = new_instr;
    tab_index++;
}
