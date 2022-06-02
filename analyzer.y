%{
#include <stdlib.h>
#include <stdio.h>
#include "table_symboles.h"
#include "table_instructions.h"
#include <string.h>

int var[40];
int yylex();
void yyerror(char *s);
extern FILE * yyin;

%}
%union { int nb; char* var; char * type; char* str}
%token tMAIN tSOU tADD tMUL tDIV  tPO tPF tAO tAF tPV tVIR
%token <nb> tNB tIF tINT tELSE tVOID tWHILE tPRINTF tEGAL tINF tSUP
%token <var> tID
%type <nb> Terme Condition tType Calcul DivMul Else BlockIf BoucleWhile 
%start Compiler
%%

Compiler : tType tMAIN tPO Parametres tPF Body ;

tType :	 tINT
		| tVOID;

Parametres : Parametre
		| 	 Parametre tVIR Parametres;

Parametre : tINT tID
		|	;

Body : tAO {up_scope();} Instructions tAF {down_scope();};

Instructions : Instruction Instructions
			| ;

Instruction : Declaration 
			| Affectation 
			| BoucleWhile 
			| BlockIf 
			| Print;


// Possibilité de declarer plusieurs variables à la suite
IDs : tID {addSymbol($1);}
	| tID tVIR IDs {addSymbol($1);};

Declaration : tType IDs tPV ;


Affectation : tINT tID tEGAL Calcul tPV {addSymbol($2); addInstrToTable("AFC", get_index_symb($2), $4,-1);}
			| tID tEGAL Calcul tPV {addInstrToTable("COP", get_index_symb($1), $3, -1);};


Calcul : Calcul tADD DivMul {int temp = addressVarTemp(); addInstrToTable("ADD", temp, $1, $3); $$=temp;}
		| Calcul tSOU DivMul {int temp = addressVarTemp(); addInstrToTable("SOU", temp, $1, $3); $$=temp;}
		| DivMul;

// Pour gérer la priorité de la mul et de la div (plus pas dans la hierarchie)
DivMul :  DivMul tMUL Terme {int temp = addressVarTemp(); addInstrToTable("MUL", temp, $1, $3); $$=temp;}
		| DivMul tDIV Terme {int temp = addressVarTemp(); addInstrToTable("DIV", temp, $1, $3); $$=temp;}
		| Terme;

Terme :  tID {$$ = get_index_symb($1);}
		| tNB {int temp = addressVarTemp(); addInstrToTable("COP", temp, $1, -1); $$=temp;};


// On donne l'adresse de l'instruction JMF à tIF ($1)
BlockIf : tIF tPO Condition {$1 = addInstrToTable("JMF", $3, -1, -1);} tPF Body {patchJump($1, getLastInstr()+1, "JMF");};


Else : tELSE {addInstrToTable("JMP",-1,-1,-1);} Body {int endOfElse = getLastInstr();patchJump($1,endOfElse,"JMP");};

BoucleWhile :  tWHILE {$1 = getLastInstr();} tPO Condition tPF {addInstrToTable("JMF",$4,-1,-1);} Body 
		{int endOfLoop = getLastInstr();addInstrToTable("JMP",$1,-1,-1);patchJump($1,endOfLoop+1,"JMF");};


// Condition assez simple, égalité, supériorité, et infériorité
Condition : Calcul tEGAL tEGAL Calcul {int temp = addressVarTemp(); addInstrToTable("EQU", temp, $1, $4); $$=temp;}
	| Calcul tINF Calcul {int temp = addressVarTemp(); addInstrToTable("INF", temp, $1, $3); $$=temp;}
	| Calcul tSUP Calcul {int temp = addressVarTemp(); addInstrToTable("SUP", temp, $1, $3); $$=temp;}
	| Calcul {$$=$1;};


Print : tPRINTF tPO Calcul tPF tPV {addInstrToTable("PRI", $3, -1, -1);};

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(int argc, char** argv) {
	printf("Compilo\n");
	if(argc != 2) { 
		fprintf(stderr, "Usage: %s <input file>\n", argv[0]); 
		exit(1); 
	} 
	FILE *f = fopen(argv[1], "r"); 
	if(f == NULL) { 
		fprintf(stderr, "Failed to open file \"%s\".\n", argv[1]); 
		exit(1); 
	} 
	yyin=f;
	//yydebug=1;
	yyparse();
	print_instruction_table();
	interpreter_asm();
	fclose(f);
	return 0;
}
