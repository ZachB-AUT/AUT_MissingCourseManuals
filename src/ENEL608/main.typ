#import "template.typ": *
#show: template


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
Last updated: #datetime.today().display()

#pagebreak()

// TOC
#outline(title: "Table of contents")
#pagebreak()

// Introduction to the document

= Introduction
#line()

This document is a collection of my notes and knowledge related to the class
#courseTitle at AUT, written for someone taking this class.
While largely intended as a way of writting down everything I know for my own
benefit, my hope is that it will be of use for you as well.

#pagebreak()

// This is where I include the weeks contents.
#include("weeks/week_1.typ") // Class overview
