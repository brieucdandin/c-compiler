/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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
    tRETURN = 259,
    tPRINT = 260,
    tIF = 261,
    tWHILE = 262,
    tINT = 263,
    tFLOAT = 264,
    tDOUBLE = 265,
    tCONST = 266,
    tACC_L = 267,
    tACC_R = 268,
    tOR = 269,
    tAND = 270,
    tEQUALS = 271,
    tDIFF = 272,
    tPLUS = 273,
    tMINUS = 274,
    tMULT = 275,
    tDIV = 276,
    tAFFECT = 277,
    tPAR_L = 278,
    tPAR_R = 279,
    tCOMA = 280,
    tBRK_PT = 281,
    tID = 282,
    tNUMBER = 283
  };
#endif
/* Tokens.  */
#define tMAIN 258
#define tRETURN 259
#define tPRINT 260
#define tIF 261
#define tWHILE 262
#define tINT 263
#define tFLOAT 264
#define tDOUBLE 265
#define tCONST 266
#define tACC_L 267
#define tACC_R 268
#define tOR 269
#define tAND 270
#define tEQUALS 271
#define tDIFF 272
#define tPLUS 273
#define tMINUS 274
#define tMULT 275
#define tDIV 276
#define tAFFECT 277
#define tPAR_L 278
#define tPAR_R 279
#define tCOMA 280
#define tBRK_PT 281
#define tID 282
#define tNUMBER 283

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 20 "compiler.y" /* yacc.c:1909  */
 int nb ; char * var ; 

#line 113 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
