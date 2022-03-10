%{
#include <stdlib.h>
#include <stdio.h>
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
Compiler : tType tMAIN tPO tPF tAO Body tAF
		| tType tMAIN tPO tType tPF tAO Body tAF
Body : Instructions tRETURN tINT { printf("Body of the function\n"); }
		|Instructions { printf("Body of the function\n"); }

Instructions : Instruction
		| Instruction Instructions
Instruction : Declaration 
		| Calcul
		| Affectation 
		| BoucleWhile 
		| BoucleIf 

Declaration :  tType tID tEGAL tNB tPV { printf("Declaration\n"); } 
		| tType tID tPV { printf("Declaration\n"); } 
		| tType Calcul { printf("Declaration\n"); } 

Affectation : tID tEGAL tNB tPV { printf("Affectation\n"); }

BoucleWhile :  tWHILE tPO Cond tPF tAO Instructions tAF { printf("Boucle While\n"); }

BoucleIf : tIF tPO Cond tPF tAO Instructions tAF { printf("Boucle if\n"); }
		| tIF tPO Cond tPF tAO Instructions tAF Elseifs { printf("Boucle if\n"); }
		| tIF tPO Cond tPF tAO Instructions tAF Else { printf("Boucle if\n"); }

Else : tELSE tAO Instructions tAF 

Elseifs : ElsIf 
		| ElsIf Elseifs 

ElsIf : tELSIF tPO Cond tPF tAO Instructions tAF


tType : tINT
		| tVOID

Calcul :	  tExpr tPV { printf("Calcul\n"); }
		| tID tEGAL tExpr tPV { var[(int)$1] = $3; printf("Calcul\n");}

tExpr :		  tExpr tADD tDivMul { $$ = $1 + $3; }
		| tExpr tSOU tDivMul { $$ = $1 - $3; }
		| tDivMul { $$ = $1; } ;

tDivMul :	  tDivMul tMUL tTerme { $$ = $1 * $3; }
		| tDivMul tDIV tTerme { $$ = $1 / $3; }
		| tTerme { $$ = $1; } ;

tTerme :		  tPO tExpr tPF { $$ = $2; }
		| tID { $$ = var[$1]; }
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
