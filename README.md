Stack Virtual Machine (x86 Assembly, NASM)
Description
This project is a simple stack-based virtual machine (Stack VM) implemented in x86 Assembly using NASM.
The program reads commands from the user and executes operations on a stack of integers.
All calculations are performed using a Last-In-First-Out (LIFO) stack structure.
The project demonstrates:
Low-level programming in x86 Assembly
Manual stack memory management
Command-driven interpreter loop
Arithmetic operations using CPU instructions
Control flow using jumps and comparisons
Basic error handling (division/modulo by zero)
The program uses the io.inc macro library to simplify input and output operations.
Features
Stack capacity: 100000 integers
Interactive command interpreter
Supports integer arithmetic
Stack manipulation operations
Duplicate element operation
Division and modulo zero checking
Print stack values
Exit command
Requirements
To build and run the project you need:
NASM assembler
GCC with 32-bit support
io.inc macro library
Build and Run
Assemble
nasm -f elf32 stack_vm.asm -o stack_vm.o
Link
gcc -m32 stack_vm.o -o stack_vm
Run
./stack_vm
Available Commands
Command	Description
.	Push number onto stack
+	Add two numbers
-	Subtract two numbers
*	Multiply two numbers
/	Divide two numbers
%	Modulo (remainder)
#	Duplicate top element
=	Print top element
:	Exit program
How It Works
Stack Structure
The stack is implemented as:
stack — an array storing integers
a — stack pointer representing the current stack size
Each stack element occupies 4 bytes.
Main Loop
The program continuously executes the following steps:
Read a character command using GET_CHAR
Compare the input with supported commands
Jump to the corresponding operation
Execute stack manipulation or arithmetic
Return to the main loop
This loop continues until the exit command (:) is entered.
Example
Input
. 5
. 3
+
=
:
Output
8
Execution Steps
Push 5 onto the stack
Push 3 onto the stack
Pop the two numbers
Add them together
Push the result back onto the stack
Print the result
Exit the program
Algorithm Explanation
The program follows a stack-based execution model.
Basic idea
Numbers are pushed onto the stack
Arithmetic operations pop the top two elements
The result is pushed back onto the stack
Example for addition:
Stack before:
[5, 3]

Pop 3
Pop 5

Compute:
5 + 3 = 8

Push result:
[8]
Arithmetic Implementation
Each arithmetic operation performs:
Pop operand B
Pop operand A
Compute A op B
Push the result
Division and modulo include explicit checks for zero to prevent runtime errors.
Error Handling
The program detects invalid arithmetic operations:
Division by zero
DIV BY ZERO
Modulo by zero
MOD BY ZERO
After an error message, the program exits.
Time Complexity
All stack operations are constant time:
Push   → O(1)
Pop    → O(1)
Add    → O(1)
Sub    → O(1)
Mul    → O(1)
Div    → O(1)
Mod    → O(1)
Dup    → O(1)
Because operations only interact with the top elements of the stack.
Limitations
No stack overflow protection
No stack underflow protection
Only integer arithmetic
No floating-point support
Minimal error messages
Limited command set
This project is intended for educational purposes, demonstrating how a stack-based interpreter can be implemented at the assembly level.
Resources
Intel x86 Architecture Manual
NASM Documentation
GCC 32-bit compilation documentation
Assembly programming tutorials
Debugging and testing sessions
License
Educational use only.
