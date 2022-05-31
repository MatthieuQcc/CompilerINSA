#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>


// On doit gérer les contraintes de profondeur des variables
// Augmente la profondeur
void up_scope();


// Diminue la profondeur
void down_scope();


// Ajoute un symbole dans la table
void addSymbol(char* name); 


//Enlève les variables de la table qui ne font plus partie du nouveau scope du code
void removeSymbols();


// affiche un symbole. Utile pour plus de clarté dans la fonction printSymbols
void afficheSymbole(symbol);


// Affiche la table des symboles
void printSymbols();


// utile pour la table des instructions
int get_address(char* name);