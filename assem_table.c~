#include <stdio.h>
#include <stdlib.h>
#include "assem_table.h"

struct assembly_instruction* create_assem_table () {
	return(malloc(sizeof(Struct* assembly_instruction)*100);	// TODO: 100 à modifier.
}

void addition_int_int (int i, int j) {
	//int i = ts_last();
	last_nmb_in_table = pop();
	//int j = ts_last() - 1;
	pop();
	int addr_i = get_addr(i);
	int addr_j = get_addr(j);
	LOAD r0 addr_i
	LOAD r1 addr_J
	ADD r0 r0 r1
	STORE get_address(last_nmb_in_table) r0
}

void affectation_int () {
	int i = ts_add_qym_tmp();
	AFC 0 $1
	STORE get_addr(i) 0
}
