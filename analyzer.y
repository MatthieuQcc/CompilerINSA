%{
#include <stdlib.h>
#include <stdio.h>
int var[26];
int yylex();
void yyerror(char *s);
%}
%union { int nb; char var; }
%token gtIF tIF tELSE tWHILE tMAIN tVOID tCONST tINT tPRINTF tRETURN tEGAL tSOU tADD tMUL tDIV tPO tPF tAO tAF tPV tVIR tFL tERROR
%token <nb> tNB
%token <var> tID
%type <nb> tExpr tDivMul tTerme tAffect tDecla tCond tCondIf tBoucleWhile tType
%start Compiler
%%
Compiler : tType tMAIN tPO tPF tAO BODY tAF
BODY : Instruction  { printf("Instruction"); }
Instruction : Declaration { printf("Declaration"); }
		| Affectation { printf("Affectation"); }
		| BoucleWhile { printf("Boucle While"); }
		| BoucleIf { printf("Boucle if"); }
Declaration :  tType tID tEGAL tNB tPV { printf("Declaration"); } 
		| tType tID tPV { printf("Declaration"); } 
Affectation : tID tEGAL tNB tPV { printf("Affectation"); }
BoucleWhile :  tWHILE tPO tCond tPF tAO Instruction tAF
BoucleIf : tIF tPO tCond tPF tAO Instruction tAF
tType : tINT { printf("Type int"); }
Calcul :	  tExpr tFL { printf("> %d\n", $1); }
		| tID tEGAL tExpr tFL { var[(int)$1] = $3; } ;
tExpr :		  tExpr tADD tDivMul { $$ = $1 + $3; }
		| tExpr tSOU tDivMul { $$ = $1 - $3; }
		| tDivMul { $$ = $1; } ;
tDivMul :	  tDivMul tMUL tTerme { $$ = $1 * $3; }
		| tDivMul tDIV tTerme { $$ = $1 / $3; }
		| tTerme { $$ = $1; } ;
tTerme :		  tPO tExpr tPF { $$ = $2; }
		| tID { $$ = var[$1]; }
		| tNB { $$ = $1; } ;
tCond : tPO tID tEGAL tID tPF 
tCondIf : tIF tCond tAO 
tAffect : 	tExpr tEGAL tID {$$ = $3}


%%
void yyerror(char *s) { fprintf(stderr, "%s\n", s); }
int main(void) {
  printf("Compiler\n"); // yydebug=1;
  yyparse();
  return 0;
}
