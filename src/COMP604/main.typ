#import "template.typ": *
#show: template

// Metadata

#metadata("COMP604 - Operating Systems") <fulltitle>

// Title page

#line()
  #text(size: 20pt, [
  #courseCode - #courseTitle
])
#line()

#text(size: 16pt, [
  Unofficial course manual
])

Written by #authorname

#pagebreak()

// TOC
#outline(title: "Table of contents")
#pagebreak()

// Introduction to the document

= Introduction

This document is a collection of my notes and knowledge related to the class "Operating
Systems" at AUT, written for someone taking this class. While largely intended as
a way of writting down everything I know for my own benefit, my hope is that it
will be of use for you as well.

== Additional resources
This class recommends the use of the OSTEP (Operating Systems, Three Easy Pieces) textbook. It can be found here: #link("https://pages.cs.wisc.edu/~remzi/OSTEP/", [OSTEP])
This is an excellent resource, and I highly recommend using this.

#pagebreak()

// This is where I include the weeks contents.
#include("chapters/chapter_1.typ")
#include("chapters/chapter_2.typ")
#include("chapters/chapter_3.typ")
#include("chapters/chapter_4.typ")
