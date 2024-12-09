#import "../template.typ": *

#pagebreak()
= XV6 for Dummies
#line()

The most recent version of xv6 can be found on this GitHub page:\
#link("https://github.com/mit-pdos/xv6-riscv", [xv6-riscv])


/*
	* What do I know about xv6?
	*
	* - [x] Split into kernel and user folders
	*  |- [x] Contents of kernel
	*  |- [x] Contents of user
	* - [x] Makefile
	* - [x] Process for adding a new user program
	* - [x] Process for adding a new system call
	*
	*/

== General structure

Like most Unix operating systems, xv6 is split into user and kernel space.

Almost all of the operation of xv6 occurs in kernel space, which has elevated
privileges to user space.

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

The following steps need to be performed to add a new system call:

+  In `kernel/syscall.h`, add the system call number.
			This file contains all of the numbers used by the system calls.
			#linebreak()
			```c
			#define SYS_examplesyscall 22
			```

+  In `kernel/syscall.c`, include the prototype for the system call.
			Near the top of `syscall.h`, add:
			#linebreak()
			```c
			extern uint64 sys_examplesyscall(void);
			```

			Then, near the bottom add an entry to the array of function pointers:
			```c
			[SYS_examplesyscall] sys_examplesyscall,
			```


+  In `kernel/sysproc.c`, implement the system call.
			```c
			uint64
			sys_examplesyscall(void) {
					// Implementation goes here
					return 0;
			}
			```

+  In `kernel/defs.h`, add a prototype for the system call.
			```c
			uint64 sys_examplesyscall(void);
			```

+ In `user/usys.pl`, add an entry for your syscall at the bottom:
		```perl
		entry("examplesyscall");
		```
		\ \ \

+ Finally, in `user/user.h`, add a prototype of the new system call:
		```c
		int fork(void);
		// All other system calls
		int examplesyscall(void);
		```

#linebreak()

For this example I used 'examplesyscall' as an example name but you can replace
this with whatever name you want to give it.

After completing these steps, you will be able to call this system call from a
user program by including the `user.h` header file and calling the function as
per usual.

== User Programs

=== Adding a new user program

To add a new user program to xv6, you must first add the C program under the
`user/` directory. This program is essentially the same as any other C program,
except it must use `exit(0)` instead of `return 0;`

After doing so, you must modify the Makefile.
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

== Files of interest

These are the most commonly modified files in xv6:

+ In kernel space:
		- `kernel/proc.c`            - Process related functions
		- `kernel/syscall.c`         - System call definitions and setup
		- `kernel/sysproc.c`         - System call implementations
		- `kernel/defs.h`            - Function prototypes
		- `kernel/syscall.h`         - System call numbers
		- `kernel/param.h`           - System parameters
		- `kernel/proc.h`            - Process structure definitions

+ In user space:
		- `user/user.h`              - User-space system call declarations
		- `user/usys.pl`             - System call stub generator
		- `user/*.c`                 - Your user programs

The files you will most commonly be editing are:
- `sysproc.c` for implementing system calls
- `proc.c` for process management

== Using xv6

=== XV6 Setup

Assuming you have run through the earlier software setup section, you should be
able to run the command: `make qemu` from within the xv6-riscv directory and be
able to start it without issue. However, on MacOS you may need to modify the
Makefile to run it successfully. To do so, find line 59 and remove `-Werror`
from it.

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

Additionally, while the xv6 download is approximately 18 megabytes, almost all
of that is the .git folder (responsible for version tracking using git),
removing this makes the whole folder some number of kilobytes. This means that
the whole directory can be sent through most messaging apps.

To remove this directory, run:
```sh
rm -rf ./.git
```
from inside the `xv6-riscv` directory.

=== Using xv6

The xv6 shell behaves very similarly to a typical shell session.
To run a user program, simply type its name and press enter.

You can list all of the running programs by pressing `ctrl-P`

To exit xv6, press `ctrl-a`, release those two keys and then press `x`.

// #pagebreak()

=== Preparing an xv6 instance for submission

Generally there are two steps for submitting an xv6 file.

+ Clean the xv6 directory\
		Run:
		```sh
		make clean
		```
		from inside the 'xv6-riscv/' directory.\
		This removes all compiled binaries.

+ Use tar to turn the directory into an archive file.\
		This can be done by running something like:
		```sh
		tar czf Q1-12345678.tar.gz ./xv6-riscv
		```
		from *above* the `xv6-riscv` directory.
		Substitute with the specific question and your student ID sequence.

All of these steps can be automated by writing your own makefile for the
assignment. Learn how to do this, it will save you hours of recompiling,
cleaning, and trying to remember tar commands.
