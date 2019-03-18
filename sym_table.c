#include "sym_table.h"
#include <stdio.h>
#include <stdlib.h>



struct Stack* createStack(unsigned capacity) 
{ 
    struct Stack* stack = (struct Stack*) malloc(sizeof(struct Stack)); 
    stack->capacity = capacity; 
    stack->top = -1; 
    stack->array = (sym_node_struct *) malloc(stack->capacity * sizeof(sym_node_struct)); 
    return stack; 
} 
 
int isFull(struct Stack* stack) 
{   return stack->top == stack->capacity - 1; } 
  
int isEmpty(struct Stack* stack) 
{   return stack->top == -1;  } 
  
void push(struct Stack* stack, sym_node_struct item) 
{ 
    if (isFull(stack)) 
        return; 
    stack->array[++stack->top] = item; 
    
} 
  
sym_node_struct pop(struct Stack* stack) 
{ 
    if (isEmpty(stack)) {
		fprintf(stderr,"error pop empty stack\n");
		exit(1);
	}   
    return stack->array[stack->top--]; 
} 



