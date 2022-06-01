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
%token tELSE tELSIF tWHILE tMAIN tVOID tCONST tPRINTF tRETURN TVOID tEGAL tSOU tADD tMUL tDIV tINF tSUP tPO tPF tAO tAF tPV tVIR tFL tERROR
%token <nb> tNB tIF tID tINT
//%token <var> 
%type <nb> Terme Condition tType Calcul DivMul
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
	| tID tVIR IDs {addSymbol($1);};


Declaration : tType IDs tPV 


Affectation : tINT tID tEGAL Calcul tPV {addSymbol($2); addInstrToTable("COP", get_index_symb($2),$4,-1);removeVarTemp();};
			| tID tEGAL Calcul tPV {addInstrToTable("COP", get_index_symb($1),$3,-1);removeVarTemp();};


Calcul : Calcul tADD DivMul {int temp = addVarTemp();addInstrToTable("ADD",temp,$1,$3);};
		| Calcul tSOU DivMul {int temp = addVarTemp();addInstrToTable("SOU",temp,$1,$3);};
		| DivMul

DivMul :  DivMul tMUL Terme {int temp = addVarTemp();addInstrToTable("MUL",temp,$1,$3);};
		| DivMul tDIV Terme {int temp = addVarTemp();addInstrToTable("DIV",temp,$1,$3);};
		| Terme

Terme :  tID {int temp = addVarTemp();addInstrToTable("COP",temp,get_index_symb($1),-1);removeVarTemp();};
		| tNB {int temp = addVarTemp();addInstrToTable("AFC",temp,$1,-1);};


BoucleWhile :  tWHILE {$1 = getLastInstr();} tPO Condition tPF {addInstrToTable("JMF",$3,-1,-1);} Body 
						{int endOfLoop = getLastInstr(),addInstrToTable("JMP",$1,-1,-1);patchJump($1,endOfLoop-1,"JMF")}


BlockIf : tIF {$1 = getLastInstr();} tPO Condition tPF {addInstrToTable("JMF",$3,-1,-1);} Body {int endOfIf = getLastInstr(); patchJump($1,endOfIf+1,"JMF");};
		|  tIF {$1 = getLastInstr();}tPO Condition tPF {addInstrToTable("JMF",$3,-1,-1);} Body Else {int endOfIf = getLastInstr(); patchJump($1,endOfIf+1,"JMF");};

Else : tELSE {$1 = addInstrToTable("JMP",-1,-1,-1);} Body {int endOfElse = getLastInstr();patchJump($1,endOfElse,"JMP");};

// Condition assez simple, égalité, supériorité, et infériorité
Condition : Terme tEGAL tEGAL Terme 
	|  Terme tINF Terme
	|  Terme tSUP Terme


Print : tPRINTF tPO tID tPF tPV {addInstrToTable("PRI",$3,-1,-1);};

%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Compiler\n");
  
  yydebug=1;
  yyparse();
  return 0;
}
