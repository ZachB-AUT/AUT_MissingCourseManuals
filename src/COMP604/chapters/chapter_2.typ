#import "../template.typ": *

= What you need to know about C programming
#line()

Almost all of the programming in this class will be done using C.
In addition to the basic C syntax you likely learned in earlier classes, you will also
be using more advanced concepts.

The following is an overview of the two main concepts you will need to revise.

== Header files

C header files (ending with .h) contain function declarations and macro
definitions that can be shared across multiple source files. This means you can
write a function once in a .c file, declare it in a header file, and then use it
in any other file that includes that header.

Making your own header file is extremely simple - just create a new file ending
with .h and put your function declarations in there. These declarations are all
that is needed for C to know that these functions exist.

This is the reason that we include stdio.h at the top of our programs, it tells
C what functions are available in the standard input/output library (such as
printf).

Generally each C source file should have an associated header file with the same
name, just with .h instead of .c.

=== XV6 Headers

XV6 has several header files, each containing functions related to a specific purpose:
- user.h for user-level function calls
- proc.h for the process structure and scheduler
- defs.h for kernel internal functions
- types.h for data type definitions

When making system calls in XV6, you'll need to include user.h in your user
programs to access syscall functions, and both defs.h and proc.h for kernel functions.

One key difference from regular C is that XV6 defines its own types in types.h
rather than using the standard C types, so you'll use uint instead of unsigned
int, etc.

== Pointers

Pointers are variables that store memory addresses of other variables. These are
used extensively in operating systems, so I highly reccomend studying them

A pointer is declared by adding an asterisk (\*) before the variable name:
```c
int* ptr;    // Declares a pointer to an integer
char* str;   // Declares a pointer to a character
```

To get the address of a variable, use the ampersand (&) operator:
```c
int x = 5;
int* ptr = &x;  // ptr now holds the memory address of x
```

To access the value that a pointer points to (dereferencing), use the asterisk (\*):
```c
int value = *ptr;  // value is now 5
```

#pagebreak()

Structures can also be accessed through pointers. Here's how:
```c
struct Point {
    int x;
    int y;
};

struct Point p = {10, 20};
struct Point* ptr = &p;

// These two lines do the same thing:
printf("%d", (*ptr).x);
printf("%d", ptr->x);    // Easier to use!
```

The arrow operator (`->`) is shorthand for dereferencing a pointer and accessing
a structure member. It's much more readable than the alternative.

Null pointers (pointers that don't point to anything) are declared as:
```c
int* ptr = NULL;
```

Always check if a pointer is NULL before dereferencing it to avoid segmentation
faults.

Common pointer mistakes to avoid:
- Dereferencing NULL pointers
- Using uninitialized pointers
- Not freeing allocated memory (memory leaks)
- Writing beyond array bounds
- Using dangling pointers (pointing to freed memory)

Pointers and arrays are closely related in C. An array name is
actually a pointer to its first element. This is why array indexing and pointer
arithmetic are interchangeable:

```c
int arr[5] = {1, 2, 3, 4, 5};
int* ptr = arr;      // ptr points to first element
printf("%d", ptr[2]); // Prints 3
printf("%d", *(ptr + 2)); // Also prints 3
```
