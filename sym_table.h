#include <stdio.h>
#include <stdlib.h>

typedef struct sym_node_struct {
	char * type;
	char * symbol;
	int address;
	int depth;
	int initialized; // 1 if initialized, else 0.
} sym_node_struct;

struct Stack
{
	int top; 
    unsigned capacity; 
	sym_node_struct * array;
};

// function to create a stack of given capacity. It initializes size of stack as 0 
struct Stack* createStack(unsigned capacity);	

// Stack is full when top is equal to the last index 
int isFull(struct Stack* stack);

// Stack is empty when top is equal to -1 
int isEmpty(struct Stack* stack); 

// Function to add an item to stack. It increases top by 1 
void push(struct Stack* stack, sym_node_struct item);

// Function to remove an item from stack.  It decreases top by 1 
sym_node_struct  pop(struct Stack* stack);

// Initiation d'un noeud
void init_node (char *type, $ symbol, int address, int depth, int is_initialized);
