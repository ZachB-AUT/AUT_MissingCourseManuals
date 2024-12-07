#import "../template.typ": *

= Assignment Notes
#line()

== Assignment One

=== Question One

This question required me to write a bash script which took two arguments, a
filename and the path to a directory. Then, it looked for all all lines in that
file which contained instances of the word "special", and appended those lines
to an output file called special.txt in that directory.

It also had to do the following:
+ Display an error message if it wasn't passed exactly two arguments.
+ If the specified file didn't exist, it also had to display and error message.
+ If the specified output directory didn't exist, it must create it.
+ If a file called "special.txt" already exists, the lines must be appended to it.

This was reasonably easy, finding lines which contain a string can be done with
the `grep` command line utility.
\
\
=== Question Two

This question was substantially harder.
I needed to implement a linked list in C, which will be used to store "process
control blocks", which store the name and PID of a process.

First I needed to create a structure to store the PCB:

```C
typdef struct PCB {
  int PID;    // Integer for pid
  char* name; // String for name
}
```

Then, I create a structure for the list item:
```C
typedef struct List_item {
    struct List_item* next; // This stores the address ofnext item in the list
    struct PCB* referedPCB; // This stores the address of the PCB associated with this list node
} List_item
```


First was the insert function:
```C
int insert(struct List_item *listhead, struct List_item *insertItem)
```

This function took the listhead and a list item, and inserted it into the
correct position depending on the PCB's PID.

Next was the delete function:
```C
int delete(struct List_item *listhead, int pid)
```

Which unlinks the node with the specified PID. One thing worth noting is that
`delete()` is a reserved keyword in C++, not C. But because the commonly used clang code checker works for
both C and C++, some editors will throw an error if you try to make a function called delete in C.
Just ignore it, it will compile just fine.

Last was the list printing function:

```C
printList(List_item* listhead)
```

This function walks the linked list and prints all of the list items out.

#pagebreak()


Additionally, the functionality of this program had to be split across three
different files. These were `main.c`, `listfunc.c`, and a header file (Which I called listfunc.h)

The main hard part of this question is figuring out a way to iterate over the
list. Turns out the best way to do this is to create a `List_item` pointer, and
then setting it equal to the address of the head node. Then, to move to the next
node you simply set it equal to the referenced node's next node.

Something like this:

```C
List_item listhead;
// Add a bunch of child nodes here.
List_item* cursor = &listhead;

while(cursor->next != NULL) { // Make sure you dont try to do a null pointer deref!
    cursor = cursor->next;

    // You can do whatever you want to the node here,
    // I am printing its name as an example.
    printf("%s", cursor->PCB->name)
}
```



=== Question Three

This question involved creating a new system call for xv6, and a user process.
This system call needed to print a list of active processes, and print
information about them. Thankfully, there is a function in `proc.c` called
`procdump()` which does almost all of what we need it to, we just need to add
something that prints the process' memory size.

The user program should also take an option `-r`, which if used should only
print this information about a process if it is actively running ( `p->state == RUNNING`.)

There is a process pointer called 'p', and if you get the value of `p->sz` we
can get this information.

From this point I was able to create the user program, which took the input from
the user, determined if the `-r` option was called, and invoked the psc system
call with that option. While this approach was effective, I recommended that my
friends simply made two sytem calls (one for if you are printing all processes
and another for if you were just printing the running ones) because it was easier.

Other than that, the system call was implemented as normal, but passing the `-r`
option required additonal work.

== Assignment Two

=== Question One

=== Question Two

=== Question Three

=== Question Four

=== Question Five

== Assignment Three

=== Question One

=== Question Two

=== Question Three

=== Question Four
