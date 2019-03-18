%{
	#include "sym_table.h"
	int yylex(void);
	void yyerror(char*);
%}

%union { int nb ; char * var ; }

%token tMAIN tRETURN tPRINT tIF tWHILE tINT tFLOAT tDOUBLE tCONST tACC_L tACC_R tOR tAND tEQUALS tDIFF tPLUS tMINUS tMULT tDIV tAFFECT tPAR_L tPAR_R tCOMA tBRK_PT 
%token <var> tID
%token <nb> tNUMBER

%left tMINUS tPLUS
%left tMULT tDIV

%start start

%%

start					: tMAIN tPAR_L tPAR_R tACC_L content return tACC_R;
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
declaration_variable	: facult_const type ids facult_assignement tBRK_PT;

facult_const			: tCONST | ;
type					: tINT { type = "int" }| tFLOAT | tDOUBLE;
ids						: tID { printf("TIDDD : %s\n", $1); sym_node_struct node; 
								node.type = "double"; 
								node.symbol = "aa";
								node.address = 4500;
								node.depth = 0;
								node.initialized = 1; }  tCOMA ids | tID {};

facult_assignement		: tAFFECT expression | ;

instructions			: instruction instructions | ;
instruction				: calculus | print;

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
	
	//struct Stack* stack = createStack(100);

	yyparse();
	 
}




