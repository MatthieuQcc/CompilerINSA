%{
#include <stdlib.h>
#include <stdio.h>
#include "table_symboles.h"
#include "table_instructions.h"

int var[26];
int yylex();
void yyerror(char *s);
%}
%union { int nb; char var; }
%token tIF tELSE tELSIF tWHILE tMAIN tVOID tCONST tINT tPRINTF tRETURN TVOID tEGAL tSOU tADD tMUL tDIV tINF tSUP tPO tPF tAO tAF tPV tVIR tFL tERROR
%token <nb> tNB
%token <var> tID
%type <nb> tTerme Condition tType
%start Compiler
%%

Compiler : tType tMAIN tPO Parametres tPF Body 
		| tType tMAIN tPO tType tPF tAO Body tAF

tType :	 tINT
		| tVOID

Parametres : Parametre
		| 	 Parametre tVIR Parametres
Parametre : tINT tID {addSymbol($2);};
		|	;

Body : tAO {up_scope();} Instructions tAF {removeSymbols();};

Instructions : Instruction
			|  Instruction Instructions

Instruction : Declaration 
			| Affectation 
			| BoucleWhile 
			| BoucleIf 
			| Print

// Possibilité de declarer plusieurs variables à la suite
IDs : tID {addSymbol($1);};
	| tID tVIR tID {addSymbol($1);};


Declaration : tType IDs tPV  
			| tType IDs tEGAL Calcul tPV


Affectation : tID tEGAL Calcul tPV
			| tID tEGAL tID tPV
			| tID tEGAL tNB tPV 


Calcul : Calcul tADD DivMul
		| Calcul tSOU DivMul
		| DivMul;


DivMul : DivMul tMUL tTerme
		| DivMul tDIV tTerme
		| tTerme;

tTerme : tPO Calcul tPF
		| tID
		| tNB


BoucleWhile :  tWHILE tPO Condition tPF Body


BoucleIf : tIF tPO Condition tPF Body 
		|  tIF tPO Condition tPF Body Elseifs 
		|  tIF tPO Condition tPF Body Else 

Elseifs : ElsIf 
		| ElsIf Elseifs 

ElsIf : tELSIF tPO Condition tPF Body

Else : tELSE Body

// Condition assez simple, égalité, supériorité, et infériorité
Condition : tTerme tEGAL tEGAL tTerme 
	|  tTerme tINF tTerme
	|  tTerme tSUP tTerme


Print : tPRINTF tPO tID tPF tPV

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Compiler\n");
  
  yydebug=1;
  yyparse();
  return 0;
}
