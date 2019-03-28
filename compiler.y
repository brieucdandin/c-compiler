%{
	#include <stdio.h>

	#include "sym_table.h"
	#include "assem_table.h"

	int yylex(void);
	void yyerror(char*);

	//			Déclaration variables globales
	char *the_type;
	int the_depth = 0;
	int the_next_address = 0;

	//			Déclaration structure
	struct assembly_instruction* assem_op_table = NULL;
	struct Stack* stack = NULL;
%}

%union { int nb ; char * var ; }

%token tMAIN tRETURN tPRINT tIF tWHILE tINT tFLOAT tDOUBLE tCONST tACC_L tACC_R tOR tAND tEQUALS tDIFF tPLUS tMINUS tMULT tDIV tAFFECT tPAR_L tPAR_R tCOMA tBRK_PT 
%token <var> tID
%token <nb> tNUMBER

%left tMINUS tPLUS
%left tMULT tDIV

%start start

%%

start					: tMAIN tPAR_L tPAR_R tACC_L { the_depth++; } content return tACC_R { the_depth--; };
return  				: tRETURN expression tBRK_PT;
content					: declarations_variables instructions;

/*
 * Déclarations supportées :
 *		int a;
 *		int a = 1;
 *		int a, b;
 *		int a, b = 1;
 *		int a, b = 2, c , d = 4, e; // à ajouter
 */
declarations_variables	: declaration_variable declarations_variables | ;
declaration_variable	: facult_const type ids tBRK_PT;

facult_const			: tCONST | ;
type					: tINT { the_type = "int"; } | tFLOAT { the_type = "float"; } | tDOUBLE { the_type = "double"; };
ids						: tID {	sym_node_struct node;
								init_node(the_type, $1, the_next_address, the_depth, 1);
								the_next_addr++; } facult_assignement tCOMA ids
						| tID {	sym_node_struct node; 
								init_node(the_type, $1, the_next_address, the_depth, 1);
								the_next_address++; } facult_assignement ;

facult_assignement		: tAFFECT expression | ;

instructions			: instruction instructions | ;
instruction				: calculus | print | appelfonction ;

expression				: tPAR_L expression tPAR_R
						| expression tPLUS	expression
						| expression tMINUS	expression
						| expression tMULT	expression
						| expression tDIV	expression
						| tID {}
						| tNUMBER;

calculus				: tID {} tAFFECT expression tBRK_PT;
print					: tPRINT tPAR_L expression tPAR_R tBRK_PT;


%%
int main(){
	yydebug = 0;

	assem_op_table = create_assem_table();

	stack = createStack(100);

	yyparse();
	 
}


