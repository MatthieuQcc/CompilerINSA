%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
#include "table_symboles.h"
%}

%option noyywrap
%%


[ \n\t]+ {};
[0-9]+	{ yylval.nb = atoi(yytext); return tNB; }

if { return tIF; }
else {return tELSE; }
while { return tWHILE; }
main { return tMAIN; }
void { return tVOID; }
int { return tINT; }
printf { return tPRINTF; }
void { return tVOID; }

"="	{ return tEGAL; }
"-"	{ return tSOU; }
"+"	{ return tADD; }
"*"	{ return tMUL; }
"/"	{ return tDIV; }
"("	{ return tPO; }
")"	{ return tPF; }
"{" { return tAO; }
"}" { return tAF; }
";" { return tPV; }
"," { return tVIR; }
"<" { return tINF; }
">" { return tSUP; }

[a-z]+	{ yylval.var=strdup(yytext); return tID;}

