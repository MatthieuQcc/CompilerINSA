%{
#include <stdlib.h>
#include <stdio.h>
#include "table_symboles.h"
#include "table_instructions.h"

symbol symbTab[TAILLE_MAX] = { NULL };

int var[26];
int yylex();
void yyerror(char *s);
%}
%union { int nb; char var; }
%token tIF tELSE tELSIF tWHILE tMAIN tVOID tCONST tINT tPRINTF tRETURN TVOID tEGAL tSOU tADD tMUL tDIV tINF tSUP tPO tPF tAO tAF tPV tVIR tFL tERROR
%token <nb> tNB
%token <var> tID
%type <nb> tExpr tTerme tDecla Cond tType
%start Compiler
%%

Compiler : tType tMAIN tPO Parametres tPF Body 
		| tType tMAIN tPO tType tPF tAO Body tAF

tType :	 tINT
		| tVOID

Parametres : Parametre
		| 	 Parametre tVIR Parametres
Parametre : tINT tID {addSymbol($2);};

Body : tAO {up_scope();} Instructions tAF {removeSymbols();};

Instructions : Instruction
			|  Instruction Instructions

Instruction : Declaration 
			| Affectation 
			| BoucleWhile 
			| BoucleIf 
			| Print

// Possibilité de declarer plusieurs variables à la suite
IDs : tID {addSymbol($1);}
	| tID tVIR tID {addSymbol($1);};


Declaration : tType IDs tPV {addSymbol($2);};  
			| tType tID tEGAL tNB tPV {addSymbol($2);};


Affectation : tID tEGAL Calcul tPV
			| tID tEGAL tID tPV
			| tID tEGAL tNB tPV 


Calcul : Calcul tADD DivMul
		| Calcul tSOU DivMul
		| DivMul;


DivMul : DivMul tMUL tTerme
		| DivMul tDIV tTerme
		| tTerme;

tTerme : tPO tExpr tPF
		| tID
		| tNB

tExpr : tExpr tADD DivMul
		| tExpr tSOU DivMul 
		| DivMul;

BoucleWhile :  tWHILE tPO Cond tPF tAO Instructions tAF


BoucleIf : tIF tPO Cond tPF tAO Instructions tAF 
		|  tIF tPO Cond tPF tAO Instructions tAF Elseifs 
		|  tIF tPO Cond tPF tAO Instructions tAF Else 
Else : tELSE tAO Instructions tAF 
Elseifs : ElsIf 
		| ElsIf Elseifs 
ElsIf : tELSIF tPO Cond tPF tAO Instructions tAF


Cond : tTerme tEGAL tEGAL tTerme 
	|  tTerme tINF tTerme
	|  tTerme tSUP tTerme


Print : tPRINTF tPO tID tPF tPV

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Compiler\n"); // yydebug=1;
  yyparse();
  return 0;
}
