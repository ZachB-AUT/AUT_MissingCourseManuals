#import "../template.typ": *

= Class Overview
#line()


== Assessment Overview
There are three assignments in this class, with assignment two being the longest and most difficult.

#align(center, [
  #table(
    columns: 2,
    inset: 10pt,
    align: horizon,
    table.header(
      [*Assessment Item*], [*Weighting*]
    ),
    [Assignment One ], [30%],
    [Assignment Two], [40%],
    [Assignment Three], [30%],
  )
])

=== Assignment One

This assignment covered shell scripting, C programming, and a simple xv6 system
call. Easiest by far, do not use your extension here. When I took it, this
assignment had 3 questions.

=== Assignment Two

This assignment covered scheduling algorithms, processes, and more advanced
system calls. This is the longest assignment, using your extension here is fine.
When I took it, this assignment had 5 questions. All programming questions were
done in xv6.

=== Assignment Three

This assignment covered semaphores, inodes, RAID, storage in xv6. This
assignment was harder than assignment one but easier than assignment two. If you
can save your extension for this assignment then great, but don't feel bad about
spending it on assignment two.

== Software tools

The later portion of this course makes use of the XV6 operating system, which is
a simple "toy" operating system which is easy to modify.

Because XV6 runs on a different architecture than most computers, it can only be
run using a virtual machine. Thankfully, a free and easy-to-use virtual machine
exists called QEMU. The next sections will show you how to install this software
stack.

If you are able to get access to a Linux or Mac computer, doing so will make
your life much easier as you will be able to run QEMU directly and not through
another virtual machine (Unlike Windows, where you will need to use WSL).

If you have to use WSL, I highly recommend installing Visual Studio Code and the
WSL extension for it, allowing you to edit the xv6 files directly through the
editor instead of having to either copy them in/out or having to use a
command line editor like nano or vim. (Although I also recommend you learn how
to use vim keybindings.)

This information is a combination of the "Software setup" section on Canvas and my own experiences.

=== Mac setup

#linebreak()
+ To compile the software tools necessary to run XV6, you must first install Xcode.
    ```sh
    xcode-select --install
    ```
    This will take some time.

+ Next, ensure the Homebrew package manager is installed.
  If it is not, install with the following command:
  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
  (If you don't already use Homebrew, you should. It's extremely useful.)

+ Then, use Homebrew to install the RISC-V compiler toolchain:
  ```sh
  brew tap riscv/riscv
  brew install riscv-tools
  ```
  With this step, sometimes people (me, I had this issue) have issues with compiling the RISC-V toolchain.
  If that occurs try changing your OSX version to OSX Sonoma, as there is a precompiled binary available for that version.
  Once that's done try running those commands again, Homebrew will handle it for you.

+ Next you must add the toolchain directory to your "path", which is where your computer looks for programs if they are not in the current directory.
  This can be done using any text editor.
  To do so, you must open a file called `.zshrc` (This is the configuration file
  for the default shell on Mac, if you have changed the shell I
  assume you know which *other* file to change instead.)

  Then append one of the following lines to the bottom of the file depending on your situation

  ```sh
  # Use the below line on M series Macs
  export PATH=$PATH:/usr/local/opt/homebrew/Cellar/riscv-gnu-toolchain/master/bin

  # Use this one for Intel series Macs
  export PATH=$PATH:/usr/local/Cellar/riscv-gnu-toolchain/master/bin

  # If you are on an M series Mac and you get an error message at the end of
  # setup saying the computer can't find the compiler toolchain or something,
  # replace the line you added with this one:
  export PATH=$PATH:/opt/homebrew/Cellar/riscv-gnu-toolchain/main.reinstall/bin
  ```

+ Once that is done, tell zsh to use the new configuration file:
  ```sh
  source ~/.zshrc
  ```

+ Finally, install QEMU.
  ```sh
  brew install qemu
  ```
  If you have issues with this step ensure that the path was set correctly.

=== Ubuntu setup

Getting this running is very easy on Ubuntu.
Note that the university computers with WSL enabled also have Ubuntu installed.

To setup QEMU on Ubuntu, simply run the following commands:
```sh
sudo apt update && sudo apt upgrade
sudo apt install build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu
```

If that throws an error, try separating all of the packages into separate lines in a text file (Let's call it packs.txt), and running the following command:
```sh
cat packs.txt | xargs sudo apt install
```
(Learn about the xargs command by the way, very useful!)

=== Windows setup

You will need to use WSL (Windows Subsystem for Linux) as Windows cannot run QEMU directly.
+ Start by opening a command prompt and running the following command:
  ```
  wsl --install -d ubuntu-22.04
  ```
  This will install WSL and Ubuntu.
+ Reboot your computer, open BIOS and ensure that hardware virtualization is enabled. (look up how to do this, it varies by motherboard manufacturer)
+ Once your computer has rebooted, open a command prompt and run:
  ```
  ubuntu
  ```
  This will open an Ubuntu command prompt.
  From here setup proceeds the same as in the Ubuntu setup section.

  Once you have completed that, I recommend setting up an editor capable of
  opening and editing files in WSL. This can be done using Visual Studio Code
  and an extension.
  #link("https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl", [Here is the link to that extension])
