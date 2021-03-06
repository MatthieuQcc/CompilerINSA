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
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tMAIN = 258,
    tSOU = 259,
    tADD = 260,
    tMUL = 261,
    tDIV = 262,
    tPO = 263,
    tPF = 264,
    tAO = 265,
    tAF = 266,
    tPV = 267,
    tVIR = 268,
    tNB = 269,
    tIF = 270,
    tINT = 271,
    tELSE = 272,
    tVOID = 273,
    tWHILE = 274,
    tPRINTF = 275,
    tEGAL = 276,
    tINF = 277,
    tSUP = 278,
    tID = 279
  };
#endif
/* Tokens.  */
#define tMAIN 258
#define tSOU 259
#define tADD 260
#define tMUL 261
#define tDIV 262
#define tPO 263
#define tPF 264
#define tAO 265
#define tAF 266
#define tPV 267
#define tVIR 268
#define tNB 269
#define tIF 270
#define tINT 271
#define tELSE 272
#define tVOID 273
#define tWHILE 274
#define tPRINTF 275
#define tEGAL 276
#define tINF 277
#define tSUP 278
#define tID 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "analyzer.y"
 int nb; char* var; char * type; char* str

#line 108 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
