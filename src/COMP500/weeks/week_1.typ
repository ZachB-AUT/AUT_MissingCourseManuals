#import "../template.typ": *


= Week One - Overview
#line()

== Introduction to the C programming language
// What am I trying to say here?
// - What C is.
// - How C is different to other programming languages
// - Useful things to know about C.
\
C is a compiled, statically typed, non-object-oriented, low-level programming
language. As it was written in the 1970's (Back when computers were much less
powerful), C is much less abstracted than other languages to preserve system
resources. This means more direct access to the computers resources.

In some ways this is a good thing, C is still one of the fastest programming
languages in terms of execution time, however this also makes it much harder to
use than a more abstracted language like python.

These features also makes it an excellent teaching tool.

== Basic features of a C program

All C programs must contain a `main()` function. When the program is compiled
and run, that function will run first. All other functions must be either
directly or indirectly executed by the main function. Additionally, the main
function must be of type `int` (integer), with its return value indicating the
success or failure of the program.

Here is a simple "hello world" C program demonstrating this:

#align(center)[
    ```c
    #include <stdio>

    int main()
    {
      printf("Hello World!");

      return 0;
    }
    ```
]

Lets walk though this line by line.
The first line is importing the standard input/output library `stdio`
