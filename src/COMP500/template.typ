#import "@preview/codly:1.0.0": *
#show: codly-init.with()

#let authorname   = "Zach Barrett"

#let courseTitle  = "Programming Concepts and Techniques"
#let courseCode   = "COMP500"

#let template = doc => {
  set text(font: "MartianMono NF", size: 11pt)
  set line(length: 100%)
  set heading(numbering: "1.1.")
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }
  set outline(indent: auto)
  doc
}
