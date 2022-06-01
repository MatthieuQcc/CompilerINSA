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
%token tELSE tELSIF tWHILE tMAIN tVOID tCONST tINT tPRINTF tRETURN TVOID tEGAL tSOU tADD tMUL tDIV tINF tSUP tPO tPF tAO tAF tPV tVIR tFL tERROR
%token <nb> tNB tIF
%token <var> tID
%type <nb> tTerme Condition tType
%start Compiler
%%

Compiler : tType tMAIN tPO Parametres tPF Body 

tType :	 tINT
		| tVOID

Parametres : Parametre
		| 	 Parametre tVIR Parametres

Parametre : tINT tID {addSymbol($2);};
		|	;

Body : tAO {up_scope();} Instructions tAF {removeSymbols();};

Instructions : Instruction Instructions
			|  Instruction 
			| ;

Instruction : Declaration 
			| Affectation 
			| BoucleWhile 
			| BlockIf 
			| Print


// Possibilité de declarer plusieurs variables à la suite
IDs : tID {addSymbol($1);};
	| tID tVIR tID {addSymbol($1);addSymbol($3);};


Declaration : tType IDs tPV 


Affectation : tINT tID tEGAL tTerme tPV {addSymbol($2); addInstrToTable("COP", get_index_symb($2),$4,-1);};
			| tID tEGAL tTerme tPV {addSymbol($2); addInstrToTable("COP", get_index_symb($1),$3,-1);};


Calcul : Calcul tADD DivMul
		| Calcul tSOU DivMul
		| DivMul;

DivMul :  DivMul tMUL tTerme
		| DivMul tDIV tTerme
		| tTerme

tTerme :  tID
		| tNB


BoucleWhile :  tWHILE tPO Condition tPF Body


BlockIf : tIF {$1 = getLastInstr();} tPO Condition tPF Body {int endOfIf = getLastInstr(); addJM($1,endOfIf);};
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
