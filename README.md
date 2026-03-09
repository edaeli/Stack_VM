Stack VM Calculator (x86 Assembly, NASM)
Description

This project is a simple stack-based virtual machine calculator written in x86 Assembly using NASM.

The program reads commands from standard input and performs stack operations and arithmetic calculations using integer values. All operations are executed on a manually implemented stack stored in memory.

This project demonstrates:

Low-level programming using x86 Assembly

Manual stack implementation

Command-based input processing

Arithmetic operations using CPU instructions (add, sub, mul, div)

Control flow with comparisons and jumps

Basic runtime error handling (division/modulo by zero)

The program uses the io.inc macro library for input/output.

Features

Stack capacity: 100000 integers

Interactive command-based interface

Integer arithmetic operations

Stack duplication

Printing stack values

Division/modulo by zero protection

Simple VM-like command execution

Requirements

NASM (32-bit)

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
.	Read integer and push onto stack
+	Add top two elements
-	Subtract top two elements
*	Multiply top two elements
/	Divide top two elements
%	Modulo (remainder)
#	Duplicate top element
=	Pop and print top element
:	Exit program
How It Works
Stack Structure

The program maintains a manual stack:

stack — array of 100000 integers

a — stack pointer (current number of elements)

Push operation:

stack[a] = value
a++

Pop operation:

a--
value = stack[a]
Main Execution Loop

The program continuously performs:

Read a command character using GET_CHAR

Compare the character with supported commands

Jump to the corresponding operation

Execute the operation

Return to the main loop

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

Add top two values

Print result (8)

Exit program

Operations
Addition
a b +  →  (a+b)
Subtraction
a b -  →  (a-b)
Multiplication

Uses the mul instruction.

Division

Uses the div instruction.

Includes protection against division by zero.

Modulo

Computes the remainder of division using edx.

Duplicate
#  → duplicates top stack element

Example:

. 5
#

Stack becomes:

5 5
Error Handling

The program checks for invalid division operations.

Division by zero
DIV BY ZERO
Modulo by zero
MOD BY ZERO

After an error message, the program exits.

Algorithm Explanation

The calculator uses a stack-based evaluation model, similar to how many virtual machines work.

Workflow:

Numbers are pushed onto the stack

Operations pop the required operands

The operation is performed

The result is pushed back onto the stack

Example for addition:

pop b
pop a
result = a + b
push result
Time Complexity

All operations are constant time:

O(1)

because they only manipulate the top elements of the stack.

Limitations

No stack overflow protection

No stack underflow protection

Only integer arithmetic

No floating-point support

Minimal error reporting

Single-threaded interactive execution

This project is intended for educational purposes to demonstrate low-level programming and stack-based computation.

Resources

Intel x86 Architecture Manual

NASM Documentation

GCC Documentation (32-bit compilation)

Assembly Language Tutorials

Stack-based virtual machine concepts

License

Educational use only.
