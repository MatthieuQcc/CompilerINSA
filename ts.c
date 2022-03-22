#include "ts.h"


int count = 0;

bool checkSymbol(char* name, char* type, symbol* symbTab){
    //bool find = false;
    // On parcourt la liste et on voit si le symbole est présent   
    if (name != NULL && type != NULL)

    for(int i=0; i<count; i++){

        if(strcmp(symbTab[i].name,name)==0) {
            return true;
        }
    }
    return false;
}


void addSymbol(char* name, char* type, symbol* symbTab){

    if (!(checkSymbol(name,type,symbTab))) {
        symbTab[count].name = strdup(name);
        symbTab[count].address = count;
        symbTab[count].type = strdup(type);
        symbTab[count].prof = 0;
        count++;
    }
}

void afficher (symbol* symbTab) {
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
/*int main(){
    addSymbol("aaa", "int");
    addSymbol("bbb", "int");
    addSymbol("ccc", "int");
    addSymbol("ddd", "int");
    afficher();
}*/
