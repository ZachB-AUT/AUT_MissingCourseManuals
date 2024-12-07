#import "../template.typ": *

= Command Line Utilities
#line()

== Basic utilities

These are simple utilities with short descriptions.

=== cd

Short for 'change directory', this utility allows you to move between directories.

Example usage:
```sh
cd newDirectory/
```

=== ls

Short for 'list', lists the files in a directory.
use the command line flag `-a` (short for 'all'), to show hidden files and directories.

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

Short for 'concatenate', was designed to be used for combining two text files, but it allows us to print the contents of a file to the terminal.

Example usage:
```sh
cat file.txt
```

== tar

This command creates an archive from either a list of files or a directory.
You will be using this to turn your `xv6-riscv` directory into a file ready for submission.

This is a remarkably complicated command to use, but here are some example usages:
```sh
# Create a tar archive from a directory
tar -czvf myarchive.tar.gz mydirectory/

# Extract the contents of a tar archive to current directory
tar -xzvf myarchive.tar.gz

# As used in COMP604:
tar -czvf myname-12345678-assX.tar.gz xv6-riscv/
```

#pagebreak()

== grep

Grep allows you to search for strings of text (Or more generally, regexes) in either a file or a stream

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

Both of these are command line text editors. Nano is much easier to use, but is
more limited. For most of you Nano is the best option. you can use it by running
something like: `nano fileToEdit.txt` To exit, use `ctrl-x`

Vim is far more complex, but is *absolutely* worth learning how to use. If you
learn how to use it well, Vim is faster, easier to use, and more powerful. To
open vim, use `vim fileToEdit.txt`\ To exit, enter the key combination: `:qa!`,
which stands for "quit all, force".

Either of these is worth knowing how to use, as they are preinstalled on
essentially all linux installs. You can use either of these text editors to edit
files inside the ubuntu virtual machine without the use of an external text editor.

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
