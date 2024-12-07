#import "@preview/codly:1.0.0": *
#show: codly-init.with()

#let authorname   = "Zach Barrett"

#let courseTitle  = "Introduction to Microcontrollers"
#let courseCode   = "ENEL608"

#let template = doc => {
  set text(font: "MartianMono NF", size: 9pt)
  set line(length: 100%) // Set default line length
  set heading(numbering: "1.1.")

  set par(justify: true, linebreaks: "optimized")

  // Outline formatting
  show outline.entry.where(
    level: 1
  ): it => {
    v(12pt, weak: true)
    strong(it)
  }
  set outline(indent: auto, fill: "")

  // This line makes it so that level-1 headings are always on their own page.
  show heading.where(level: 1): it => { pagebreak(weak: true); it }

  show link: underline // Underline links

  doc
}
