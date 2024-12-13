#import "../template.typ": *

#pagebreak()
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

This is the reason that we include stdio.h at the top of programs, it tells
C what functions are available in the standard input/output library (such as
printf).

Generally each C source file should have an associated header file with the same
name, just with .h instead of .c.

Additionally, a distinction must be made between local headers and system headers.
local headers are specified by using their path between quotes
("myheader.h"), and system headers are specified with angle brackets (<stdio.h>).

Here is an example:
```c
// In myprogram.c
#include <stdio.h>      // System header
#include "myheader.h"   // Local header
```

The difference between the two styles is that when the compiler searches for a
header file, it looks in different places depending on which style is used.

When using angle brackets (<>), the compiler looks in standard system
directories first (like /usr/include).

When using quotes (""), the compiler first looks in the current directory, then
in the specified include paths, and finally in the system directories.

This is why we use quotes for our own header files (which are usually in the
same directory as our source files) and angle brackets for system headers
(which are installed in system locations).

#pagebreak()

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
used extensively in operating systems, so I highly recommend studying them.

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

// #pagebreak()

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

*Always* check if a pointer is NULL before dereferencing it to avoid segmentation
faults.

#pagebreak()

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

== Memory management

In C, dynamic memory allocation allows you to allocate memory at runtime rather
than compile time. This is done using functions from the stdlib.h library:

```c
// Allocate memory for one integer
int* ptr = (int*)malloc(sizeof(int));

// Allocate memory for an array of 10 integers
int* arr = (int*)malloc(10 * sizeof(int));

// Always check if allocation succeeded
if (ptr == NULL || arr == NULL) {
    // Handle allocation failure
    return -1;
}

// Use the memory
*ptr = 42;
arr[0] = 1;

// Free the memory when done
free(ptr);
free(arr);
```

The malloc() function returns a void pointer that must be cast to the
appropriate type. malloc() allocates the specified number of bytes and returns a
pointer to the first byte.

There are other memory allocation functions:
- calloc(): Allocates and zeros memory
- realloc(): Resizes previously allocated memory
- free(): Releases allocated memory

Memory that is dynamically allocated exists on the heap rather than the stack.
Stack memory is automatically managed and freed when variables go out of scope,
while heap memory must be manually freed using free().

Failing to free allocated memory results in memory leaks - memory that remains
allocated but can no longer be accessed by the program. This is especially
problematic in long-running programs like operating systems.

#pagebreak()

A few important rules for dynamic memory:
- Always check if malloc() returns NULL
- Only free memory once
- Only free memory allocated with malloc/calloc/realloc
- Keep track of all allocated memory
- Set pointers to NULL after freeing them

=== Dynamic memory management in xv6

Memory management in xv6 is almost identical to normal C, except memory
allocation is dont using the `malloc()` system call instead of the stdlib
function.
