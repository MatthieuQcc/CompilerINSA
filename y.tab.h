/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    gtIF = 258,
    tIF = 259,
    tELSE = 260,
    tWHILE = 261,
    tMAIN = 262,
    tVOID = 263,
    tCONST = 264,
    tINT = 265,
    tPRINTF = 266,
    tRETURN = 267,
    tEGAL = 268,
    tSOU = 269,
    tADD = 270,
    tMUL = 271,
    tDIV = 272,
    tPO = 273,
    tPF = 274,
    tAO = 275,
    tAF = 276,
    tPV = 277,
    tVIR = 278,
    tFL = 279,
    tERROR = 280,
    tNB = 281,
    tID = 282
  };
#endif
/* Tokens.  */
#define gtIF 258
#define tIF 259
#define tELSE 260
#define tWHILE 261
#define tMAIN 262
#define tVOID 263
#define tCONST 264
#define tINT 265
#define tPRINTF 266
#define tRETURN 267
#define tEGAL 268
#define tSOU 269
#define tADD 270
#define tMUL 271
#define tDIV 272
#define tPO 273
#define tPF 274
#define tAO 275
#define tAF 276
#define tPV 277
#define tVIR 278
#define tFL 279
#define tERROR 280
#define tNB 281
#define tID 282

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 8 "analyzer.y"
 int nb; char var; 

#line 114 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
