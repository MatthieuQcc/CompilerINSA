%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%



[ \n\t]+ {};
[0-9]+	{ return tNB; }

if { return tIF; }
else {return tELSE; }
elsif { return tELSIF; }
while { return tWHILE; }
main { return tMAIN; }
void { return tVOID; }
const { return tCONST; }
int { return tINT; }
printf { return tPRINTF; }
return { return tRETURN; }
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

[a-z]+	{ return tID; }

\n	{ return tFL; }
.	{ return tERROR; }
