#import "../template.typ"

= Miscellaneous
#line()

== Other useful tricks

=== Makefiles

As mentioned earlier, makefiles can be used to automate repetitive tasks for this class.
This is the makefile I used for assignment 3

```make
OUTDIR = "FinalSubmission"
STUDENTID = ""

all: q1 q2 q3 q4
    tar -czf ./Assign-$(STUDENTID).tar.gz ./$(OUTDIR)

q1:
    echo "Question One"
    rm -rf ./$(OUTDIR)/Question_1
    mkdir -p ./$(OUTDIR)/Question_1
    @$(MAKE) -C ./Question_1/xv6-riscv clean
    tar -czf ./$(OUTDIR)/Question_1/Q1-$(STUDENTID).tar.gz ./Question_1/xv6-riscv

q2:
    echo "Question Two"
    mkdir -p ./$(OUTDIR)/Question_2
    typst compile ./Question_2/Q2-$(STUDENTID).typst ./$(OUTDIR)/Question_2/Q2-$(STUDENTID).pdf

q3:
    echo "Question Three"
    @mkdir -p ./$(OUTDIR)/Question_3
    typst compile ./Question_3/Q3-$(STUDENTID).typst ./$(OUTDIR)/Question_3/Q3-$(STUDENTID).pdf

q4:
    echo "Question Four"
    rm -rf ./$(OUTDIR)/Question_4
    mkdir -p ./$(OUTDIR)/Question_4
    @$(MAKE) -C ./Question_4/xv6-riscv clean
    tar -czf ./$(OUTDIR)/Question_4/Q4-$(STUDENTID).tar.gz ./Question_4/xv6-riscv

clean:
    rm -rf ./$(OUTDIR)
    rm -rf ./Assign3-$(STUDENTID).tar.gz
```

This allows me to clean and archive my xv6 directories, and compile my typst
documents (typst is a great typesetting system I used for my assignments and
this document!).

You can probably take this one and modify it, but I recommend learning how to
write them yourself.

#pagebreak()

=== Git version management

Git is an extremely useful tool for this class, particularly when working on
multiple assignments at once. It allows you to keep track of changes to your
code and switch between different versions easily.

Here is a good place to start learning how to use git:
#link("https://git-scm.com/docs/gittutorial", [Git tutorial])

Otherwise, here are some basic commands:

```sh
# Initialize a git repository
git init

# Add files to be tracked
git add .

# Commit changes
git commit -m "message"

# Add a remote repository
git remote add origin https://github.com/username/repository.git

# Push to remote repository
git push
```

You should use a remote service like github to back up your code, this makes it *much* easier to recover from some disaster
or work across multiple computers.

I once heard that you should make backups at least as often as it would take you
to redo your work. This advice has saved me days of time.

=== Documentation

While it can take time and effort, it is best to keep a log of every change you
make to xv6.

Some things to document:
+ What files you modified
+ What changes you made to each file
+ Why you made those changes
+ Any issues you encountered
+ How you fixed those issues
+ What testing you performed

By doing this, you make it much easier to:
+ Remember how you did something
+ Fix issues that come up later
+ Explain your changes to others
+ Prove that you did the work
+ Learn from your mistakes
+ Build on your previous work

Even if you think you'll remember how you did something, you probably won't.
Documentation is a gift to your future self.
