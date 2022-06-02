#include "table_symboles.h"
#define TAILLE_MAX 1000


// On crée la table des symboles ayant pour taille TAILLE_MAX
symbol symbols_tab[TAILLE_MAX];

// On initialise une profondeur à 0
int scope = 0;

// On initialise une variable correspondant à l'index du tableau
int index_tab = 0;

void up_scope(){
    scope++;
}

void down_scope(){
    scope--;
}

void addSymbol(char* name){
    symbol new_symb = {
        new_symb.name = name, 
        new_symb.type = NULL, 
        new_symb.address = index_tab, 
        new_symb.scope = scope };
    symbols_tab[index_tab] = new_symb;
    index_tab++;
}

void removeSymbols(){
    // on vérifie qu'on ait des symboles à l'ancien scope et qu'il y ait toujours des éléments dans le tableau
    while (symbols_tab[index_tab].scope == scope && index_tab >= 0){
        index_tab--;
    }
    down_scope();
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


int get_index_symb(char* name){
    int index1temp = 0;    
    bool notfound = true;
    while (index1temp<index_tab && notfound){
        if (strcmp(name, symbols_tab[index1temp].name) == 0){
            notfound = false;
        }
        index1temp++;
    }
    if (notfound) {
        return -1;
    } else {
        return index1temp-1;
    }  
}