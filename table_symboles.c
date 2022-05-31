#include "table_symboles.h"
#define TAILLE_MAX 1024


typedef struct symbol {
    char *name;
    char *type;
    int address;
    int scope; 
} symbol;

// On crée la table des symboles ayant pour taille TAILLE_MAX
symbol symbols_tab[TAILLE_MAX];

// On initialise une profondeur à 0
int scope = 0;

// On initialise une variable correspondant à l'index du tableau
int index_tab = -1;

void up_scope(){
    scope++;
}

void down_scope(){
    scope--;
}

void addSymbol(char* name){
    index_tab++;
    symbol new_symb = {
        new_symb.name = name, 
        new_symb.type = NULL, 
        new_symb.address = index_tab, 
        new_symb.scope = scope };
    symbols_tab[index_tab] = new_symb;
}

void removeSymbols(){
    // on vérifie qu'on ait des symboles à l'ancien scope et qu'il y ait toujours des éléments dans le tableau
    while (symbols_tab[index_tab].scope == scope && index_tab >= 0){
        index_tab--;
    }
    scope--;
}

void afficheSymbole(symbol symb){
    printf("Name = %s, Type = %s, Addresse = %d, Scope = %d\n",
    symb.name, symb.type, symb.address, symb.scope);
}


void printSymbols() {
    // On parcout la table des symboles
    for (int i = 0; i <= index_tab; i++){
        // On affiche le symbole
        afficheSymbole(symbols_tab[i]);
    }    
}


int get_address(char* name){
    int index = 0;
    while (index <= index_tab){
        if (strcmp(name, symbols_tab[index].name) == 0){
            return symbols_tab[index].address;
        }
        index++;
    }
    printf("La variable n'a pas été déclarée.\n");
    return -1;
}