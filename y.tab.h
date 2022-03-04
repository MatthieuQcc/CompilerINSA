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
    TVOID = 268,
    tEGAL = 269,
    tSOU = 270,
    tADD = 271,
    tMUL = 272,
    tDIV = 273,
    tPO = 274,
    tPF = 275,
    tAO = 276,
    tAF = 277,
    tPV = 278,
    tVIR = 279,
    tFL = 280,
    tERROR = 281,
    tNB = 282,
    tID = 283
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
#define TVOID 268
#define tEGAL 269
#define tSOU 270
#define tADD 271
#define tMUL 272
#define tDIV 273
#define tPO 274
#define tPF 275
#define tAO 276
#define tAF 277
#define tPV 278
#define tVIR 279
#define tFL 280
#define tERROR 281
#define tNB 282
#define tID 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 8 "analyzer.y"
 int nb; char var; 

#line 116 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
