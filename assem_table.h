#include <stdio.h>
#include <stdlib.h>

struct assembly_instruction{
	char *op;
	char *a;
	char *b;
	char *c;
};

struct assembly_instruction_list{
	struct assembly_instruction instruction; 
	struct assembly_instruction_list *next;
};

void init_assem_list(struct assembly_intruction_list *assem_list);

void affectation_int ();

/*void addition_int_int (int i, int j, assembly_instruction *assem_op_table,struct Stack* stack);

void soustraction_int_int (int i, int j);

void multiplication_int_int (int i, int j);

void division_int_int (int i, int j);*/

void add_assembly_instruction(struct assembly_instruction *assem_op_table);

