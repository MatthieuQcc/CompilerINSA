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
%type <nb> tExpr tDivMul tTerme tAffect tDecla Cond tType
%start Compiler
%%

Compiler : tType tMAIN tPO tPF Body 
		| tType tMAIN tPO tType tPF tAO Body tAF
		
Body : tAO {up_scope();} Instructions tAF {removeSymbols();};

tType :	 tINT
		| tVOID

Instructions : Instruction
			|  Instruction Instructions
Instruction : Declaration 
			| Affectation 
			| BoucleWhile 
			| BoucleIf 
			| Calcul

Declaration :  tType tID tEGAL tNB tPV {addSymbol($2);};
			|  tType tID tPV {addSymbol($2);};

Affectation : tID tEGAL tNB tPV { printf("Affectation\n"); }

BoucleWhile :  tWHILE tPO Cond tPF tAO Instructions tAF { printf("Boucle While\n"); };

BoucleIf : tIF tPO Cond tPF tAO Instructions tAF { printf("Boucle if\n"); };
		|  tIF tPO Cond tPF tAO Instructions tAF Elseifs { printf("Boucle if\n"); };
		|  tIF tPO Cond tPF tAO Instructions tAF Else { printf("Boucle if\n"); };

Else : tELSE tAO Instructions tAF 

Elseifs : ElsIf 
		| ElsIf Elseifs 

ElsIf : tELSIF tPO Cond tPF tAO Instructions tAF

Calcul : tExpr
		| tID tEGAL tExpr { var[(int)$1] = $3; };

tExpr : tExpr tADD tDivMul { $$ = $1 + $3; };
		| tExpr tSOU tDivMul { $$ = $1 - $3; };
		| tDivMul { $$ = $1; };

tDivMul :	  tDivMul tMUL tTerme { $$ = $1 * $3; };
		| tDivMul tDIV tTerme { $$ = $1 / $3; };
		| tTerme { $$ = $1; } ;

tTerme :		  tPO tExpr tPF { $$ = $2; };
		| tID { $$ = var[$1]; };
		| tNB { $$ = $1; } ;

Cond : tID tEGAL tEGAL tID 
		| tID tINF tID
		| tID tSUP tID
		| tNB tEGAL tEGAL tNB

tAffect : 	tExpr tEGAL tID {$$ = $3}



%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Compiler\n"); // yydebug=1;
  yyparse();
  return 0;
}
