#include "ts.h"


int count = 0;

bool checkSymbol(char* name, char* type){
    bool find = false;
    // On parcourt la liste et on voit si le symbole est présent
    for(int i=0; i< count; i++){
        if(!(find) && (strcmp(symbTab[i].name,name))) {
            find = true;
        }
    }
    return find;
}


void addSymbol(char* name, char* type){
    if (!(checkSymbol(name,type))) {
        printf("dans checksymbol\n");
        symbTab[count].name = strdup(name);
        symbTab[count].address = count;
        symbTab[count].type = strdup(type);
        symbTab[count].prof = 0;
        count++;
    }
}

void afficher () {
    for (int i = 0 ; i < 29 ; i++) {
        printf("-");
    }
    printf("\n");
    for(int i=0; i< count; i++){
        printf("| @%02i | %8s | %8s | \n",i, symbTab[i].name,symbTab[i].type);
    }

    for (int i = 0 ; i < 29 ; i++) {
        printf("-");
    }
    printf("\n");
    printf("\n");
    
}
int main(){
    addSymbol("aaa", "int");
    printf("%i\n",count);
    addSymbol("bbb", "int2");
    printf("%i\n",count);
    addSymbol("ccc", "int");
    printf("%i\n",count);
    addSymbol("ddd", "int");
    afficher();
}
