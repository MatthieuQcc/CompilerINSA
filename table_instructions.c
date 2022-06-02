#include "table_instructions.h"

#define MAX_INSTR 2000

my_instr tabInstr [MAX_INSTR];
int tab_index = 0;
int last_index = 0;
int varTempIndex = 999;

// pour l'interpreteur
int registre[2000];

// renvoie l'adresse à laquelle ça rajoute l'instruction
int addInstrToTable( char* operation, int r0, int r1, int r2){
    
    my_instr instruction = {.operation=operation,.r0=r0,.r1=r1,.r2=r2};
    
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
    tab_index++;
    return(tab_index-1);
}

//index de la derniere instruction
int getLastInstr() {
    return tab_index;
}


//Gere les sauts - gère à la fois les JMF et les JMP
// JMP : [là où on saute, -1 ,-1]
// JMF : [CONDITION, là où on saute, -1] - si la condition est FAUSSE on saute

int patchJump (int oldAdd, int newAdd, char* ope) {
    if (strcmp(ope,"JMP") == 0) {
        tabInstr[oldAdd].r0 = newAdd;
    } else if (strcmp(ope,"JMF") == 0) {
        tabInstr[oldAdd].r1 = newAdd;
    } else {
        return -1;
    }
    return 0;
}


int addressVarTemp(){
    varTempIndex++;
    return varTempIndex;
}


void print_instruction_table(){
    FILE* fichier;
    fichier = fopen("./Print_Instruction_Table", "w+");
    for (int i = 0; i < tab_index; i++){
        fprintf(fichier, "%s %d %d %d", tabInstr[i].operation, tabInstr[i].r0, tabInstr[i].r1, tabInstr[i].r2);
        fprintf(fichier, "\n");
    }
}



void interpreter_asm(){
    int r0, r1, r2;
    int index_courrant = 0;

    while(index_courrant < tab_index){
        my_instr instruction_courrante = tabInstr[index_courrant];
        char * operation = instruction_courrante.operation;
        r0 = instruction_courrante.r0;
        r1 = instruction_courrante.r1;
        r2 = instruction_courrante.r2;
        if(strcmp(operation, "COP") == 0){
            registre[r0] = r1;
        }
        if(strcmp(operation, "AFC") == 0){
            registre[r0] = registre[r1];
        }
        if(strcmp(operation, "ADD") == 0){
            registre[r0] = registre[r1]+registre[r2];
        }
        if(strcmp(operation, "SOU") == 0){
            registre[r0] = registre[r1]-registre[r2];
        }
        if(strcmp(operation, "MUL") == 0){
            registre[r0] = registre[r1]*registre[r2];
        }
        if(strcmp(operation, "DIV") == 0){
            registre[r0] = registre[r1]/registre[r2];
        }
        if(strcmp(operation, "PRI") == 0){
            printf("%d\n", registre[r0]);
        }   
        if(strcmp(operation, "JMF") == 0){
            if(registre[r0] == 0){
                // -2 car problème indice et incrémentation
                index_courrant = r1-2;
            }
        }  
        if(strcmp(operation, "JMP") == 0){
            index_courrant = r0-2;
        }  
        if(strcmp(operation, "SUP") == 0){
            registre[r0] = (registre[r1]>registre[r2]);
        }
        if(strcmp(operation, "INF") == 0){
            registre[r0] = (registre[r1]<registre[r2]);
        }
        if(strcmp(operation, "EQU") == 0){
            registre[r0] = (registre[r1] == registre[r2]);
        }
          
        index_courrant++;  
    }
}


/*
void removeVarTemp () {
    if (varTempIndex > 1000 ) {
        varTempIndex--;
    } else {
        printf("Données temporaires empietent sur les autres données\n");
    }
}
*/