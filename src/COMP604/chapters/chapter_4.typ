#import "../template.typ": *

= XV6 for Dummies
#line()

The most recent version of xv6 can be found on this github page:\
#link("https://github.com/mit-pdos/xv6-riscv", [xv6-riscv])


/*
 * What do I know about xv6?
 *
 * - [x] Split into kernel and user folders
 *  |- [ ] Contents of kernel
 *  |- [ ] Contents of user
 * - [x] Makefile
 * - [ ] Process for adding a new user program
 * - [ ] Process for adding a new system call
 *
 */

== General structure

Like most unix operating systems, xv6 is split into user and kernel space.

Almost all of the operation of xv6 occurs in kernelspace, which has elevated
privileges to userspace.

The distinction is made clear by the fact that kernel programs are kept in the
'kernel' folder, and user programs are kept in the 'user' folder. Additionally,
on the same level as either of these folders is the 'Makefile', which performs
the startup sequence for xv6. The structure looks something like this:

```
xv6-riscv/
  ├─ Makefile
  ├─ user/
  │  ├─ User programs go here
  ├─ kernel/
     ├─ Kernel programs go here
```

== System Calls

The only method of communicating between programs in kernel and user space is
through predefined "System Calls", which are what you will be spending most of
your time creating.

=== Adding a new system call
// Files affected:
// kernel:
//  proc.c
//  sysproc.c
//  defs.h
//  syscall.c
//  syscall.h
//

Adding a new system call is a complex process.

== User Programs

=== Adding a new user program

To add a new user program to xv6, you must first add the C program under the
`user/` directory. This program is essentially the same as any other C program,
except it must use `exit(0)` instead of `return 0;`

After doing so, you then modify the makefile.
Starting on line 125 is a section that looks like this:

```make
	UPROGS=\
		$U/_cat\
		$U/_echo\
		$U/_forktest\
		$U/_grep\
		$U/_init\
		$U/_kill\
		$U/_ln\
		$U/_ls\
		$U/_mkdir\
		$U/_rm\
		$U/_sh\
		$U/_stressfs\
		$U/_usertests\
		$U/_grind\
		$U/_wc\
		$U/_zombie\
```

Add the name of your user program in the same format as the other programs here
(with an underscore in front and without the file extension.)
It is best to do so at the bottom, to make it easier to find quickly.
#pagebreak()

== XV6 Setup

Assuming you have run though the earlier software setup section, you should be able to run the command:
`make qemu` from within the xv6-riscv directory and be able to start it without issue.
However, on MacOS you may need to modify the Makefile to run it successfully.
To do so, find line 59 and remove `-Werror` from it.

The region in question looks like this:

```make
CC = $(TOOLPREFIX)gcc
AS = $(TOOLPREFIX)gas
LD = $(TOOLPREFIX)ld
OBJCOPY = $(TOOLPREFIX)objcopy
OBJDUMP = $(TOOLPREFIX)objdump

# Modify the below line.
CFLAGS = -Wall -Werror -O -fno-omit-frame-pointer -ggdb -gdwarf-2
CFLAGS += -MD
CFLAGS += -mcmodel=medany
```

Doing so disables strict error checking (Which could be worth doing anyway!).
Once you have done so you should make a copy of this version of xv6 for future
use, instead of having to repeat this step.
