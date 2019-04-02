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
	struct assembly_instruction_list* assem_op_list = NULL;
	struct Stack* stack = NULL;
%}

%union { int nb ; char * var ; }

%token tMAIN tRETURN tPRINT tIF tWHILE tINT tFLOAT tDOUBLE tCONST tACC_L tACC_R tOR tAND tEQUALS tDIFF tPLUS tMINUS tMULT tDIV tAFFECT tPAR_L tPAR_R tCOMA tBRK_PT 
%token <var> tID
%token <nb> tNUMBER

%type <nb> expression

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
								the_next_address++; } facult_assignement tCOMA ids
						| tID {	sym_node_struct node; 
								init_node(the_type, $1, the_next_address, the_depth, 1);
								the_next_address++; } facult_assignement ;

facult_assignement		: tAFFECT expression { affectation_int ($2, &assem_op_table); } 
						| ;

instructions			: instruction instructions | ;
instruction				: calculus | print | /*appel_fonction*/ ;

expression				: tPAR_L expression tPAR_R
						| expression tPLUS	expression  // {addition_int_int(		$1, $3, stack, assem_op_table, &the_next_address);}
						| expression tMINUS	expression  // {soustraction_int_int(	$1, $3, stack, assem_op_table, &the_next_address);}
						| expression tMULT	expression  // {multiplication_int_int($1, $3, stack, assem_op_table, &the_next_address);}
						| expression tDIV	expression  // {division_int_int(		$1, $3, stack, assem_op_table, &the_next_address);}
						| tID {	
								sym_node_struct node;
								init_node(the_type, "#temp", the_next_address, the_depth, 1);
								memory_allocation($1, the_next_address);
								the_next_address++ ;
								
							  }
						| tNUMBER 
							{
								sym_node_struct node;
								init_node(the_type, "#temp", the_next_address, the_depth, 1);
								memory_allocation($1, the_next_address);
								the_next_address++ ;
							};

calculus				: tID {} tAFFECT expression tBRK_PT;
print					: tPRINT tPAR_L expression tPAR_R tBRK_PT;


%%
int main(){
	yydebug = 0;

	init_assem_list(assem_op_list);

	stack = createStack(100);

	yyparse();
	 
}


