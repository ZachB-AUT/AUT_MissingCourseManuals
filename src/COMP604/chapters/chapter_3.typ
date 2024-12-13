#import "../template.typ": *

#pagebreak()
= Command Line Utilities
#line()

== Basic utilities

These are simple utilities with short descriptions.


=== cd

Short for 'change directory', this utility allows you to move between
directories.

Example usage:
```sh
cd newDirectory/
```

=== ls

Short for 'list', lists the files in a directory. Use the command line flag `-a`
(short for 'all'), to show hidden files and directories.

```sh
ls
# Or:
ls directoryYouWantToSeeTheContentsOf/
```

=== man

Short for 'manual', displays the manual page for a command.
This is *extremely* useful, use this command often.

Example usage:
```sh
man ls
```

=== cat

Short for 'concatenate', was designed to be used for combining two text files,
but it allows us to print the contents of a file to the terminal.

Example usage:
```sh
cat file.txt
```

=== pwd

Short for 'print working directory', displays the current directory you are in.

Example usage:
```sh
pwd
```

=== mkdir

Short for 'make directory', creates a new directory.

Example usage:
```sh
mkdir newDirectory
```

You can also create multiple nested directories at once using the `-p` flag:

```sh
mkdir -p path/to/new/directory
```

#pagebreak()

=== chmod
Short for 'change mode', changes the permissions of a file or directory.

Example usage:
```sh
chmod 755 file.txt
```

The permissions are represented by a three-digit number:
- First digit: owner permissions
- Second digit: group permissions
- Third digit: everyone else's permissions

Each digit is the sum of:
- 4 (read)
- 2 (write)
- 1 (execute)

So 755 means:
- Owner can read (4), write (2), and execute (1): 4+2+1 = 7
- Group can read (4) and execute (1): 4+0+1 = 5
- Others can read (4) and execute (1): 4+0+1 = 5

You can also quickly make a file executable by running:
```sh
chmod +x file.sh
```

=== mv

Short for 'move', moves files or directories from one location to another. It
can also be used to rename files.

Example usage:
```sh
# Move a file
mv source.txt destination.txt

# Move a file to a directory
mv file.txt directory/

# Move multiple files to a directory
mv file1.txt file2.txt directory/

# Rename a file
mv oldname.txt newname.txt
```

The mv command will overwrite the destination file if it exists. Use the `-i`
flag to make mv prompt before overwriting.


=== cp

Short for 'copy', copies files or directories from one location to another.

Example usage:
```sh
# Copy a file
cp source.txt destination.txt

# Copy a directory and its contents (recursive)
cp -r sourceDir/ destinationDir/

# Copy while preserving permissions and timestamps
cp -p source.txt destination.txt
```

Unlike mv, cp creates a duplicate of the file, leaving the original intact.


== tar

This command creates an archive from either a list of files or a directory. You
will be using this to turn your `xv6-riscv` directory into a file ready for
submission.

This is a remarkably complicated command to use, but here are some example usages:
```sh
# Create a tar archive from a directory
tar -czvf myarchive.tar.gz mydirectory/

# Extract the contents of a tar archive to current directory
tar -xzvf myarchive.tar.gz

# As used in COMP604:
tar -czvf myname-12345678-assX.tar.gz xv6-riscv/
```

// #pagebreak()

== grep

Grep allows you to search for strings of text (or more generally, regexes) in
either a file or a stream.

Example usage:
```sh
# Search for a specific string in a file
grep "string_to_search" filename.txt

# Search for a string in all files in the current directory
grep "string_to_search" *

# Search for a string recursively in all files in current directory and subdirectories
grep -r "string_to_search" .
```

== nano/vim

Both of these are command line text editors. Nano is much easier to use but is
more limited. For most of you Nano is the best option. You can use it by running
something like: `nano fileToEdit.txt`. To exit, use `ctrl-x`.

Vim is far more complex, but is *absolutely* worth learning how to use. If you
learn how to use it well, Vim is faster, easier to use, and more powerful. To
open vim, use `vim fileToEdit.txt`. To exit, enter the key combination: `:qa!`,
which stands for "quit all, force".

Either of these is worth knowing how to use, as they are preinstalled on
essentially all Linux installs. You can use either of these text editors to edit
files inside the Ubuntu virtual machine without the use of an external text
editor.

#pagebreak()

== Pipes and redirection

As a quick aside, one of the powerful things about the command line is the
ability to combine commands. This can be done with pipes or redirection. Pipes
allow you to take the output of one command and use it as the input of another
command.

For example, if you want to find a specific process:
```sh
ps aux | grep "firefox"
```

This takes the output of ps aux (which shows all running processes) and searches
through it for "firefox".

Redirection allows you to send the output of a command to a file instead of the
terminal:

```sh
# Save output to a file (overwrites existing content)
echo "Hello" > file.txt

# Append output to a file
echo "World" >> file.txt

# Redirect both standard output and error messages
command > output.txt 2>&1
```

== Useful utilities you might want to install

=== tealdear

Tealdear is an implementation of the `tldr` command available on most platforms.
It is very similar to the man command, but with a simplified output similar to
your average "How to use X" cheatsheet.

=== neovim

Newer implementation of vim with more features and compatibility with plugins.
Worth learning how to use.
If you want to get neovim set up quickly, look into #link("https://github.com/nvim-lua/kickstart.nvim", [kickstart.nvim])

=== fzf

Short for "fuzzy find", essentially an interactive version of grep.

=== ripgrep

A faster implementation of grep.
