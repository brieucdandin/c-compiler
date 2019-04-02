#include <stdio.h>
#include <stdlib.h>
#include "assem_table.h"


void init_assem_table (struct assembly_instruction_list *assem_list) {
	assem_list = malloc(sizeof(struct assembly_instruction_list)); 
}
/*
void addition_int_int (int address_j, int address_i, assembly_instruction *assem_op_table, struct Stack* stack, int *the_next_address); {
	// On récupère les deux derniers noeuds (des ints) dans la table des symboles.
	int i = pop(stack);
	the_next_address--;
	int j = pop(stack);
	the_next_address--;
	// On stocke leurs adresses en mémoire...
	int addr_i = get_addr(i);
	int addr_j = get_addr(j);
	// ... puis transfert leurs valeurs dans des registres.
	LOAD r0 addr_i
	LOAD r1 addr_j
	// On additionne ces deux valeurs.
	ADD r0 r0 r1
	// Et on stocke en mémoire le résultat de l'addition.
	STORE get_address(last_nmb_in_table) r0
}
*/

void memory_allocation(char value, int address){
	struct assembly_instruction_list node_AFC, node_STORE;
	
	init_node(&node_AFC, "AFC", "R0", value, NULL);
	add_assembly_instruction(&assem_op_list,node); 
	init_node(&node_STORE, concatenate("@", int_to_string(address)), "R0", value, NULL);
}

void affectation_int (int value, struct assembly_instruction_list *assem_op_list) {

	struct assembly_instruction_list node;
	init_node(&node, "AFC", "R0", value, NULL);
	add_assembly_instruction(&assem_op_list,node); 

}

void init_node(struct assembly_instruction_list *node, char *op, char*a, char *b, char *c){
	node.instruction.op = op; 
	node.instruction.a = a; 
	node.instruction.b = b;
	node.instruction.c = c;
	node.next = NULL;
}

void add_assembly_instruction(struct assembly_instruction_list *assem_op_list, struct assembly_instruction_list node){
	assem_op_list.next = node;
}
