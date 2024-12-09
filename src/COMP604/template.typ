#import "@preview/codly:1.0.0": *
show: codly-init.with()

// Make code blocks same size as regular text and add styling
show raw: it => {
  block(
    fill: luma(250),
    inset: 10pt,
    radius: 4pt,
    text(size: 1em, it)
  )
}

// Keep sections together
show heading: it => {
  set block(breakable: false)
  it
}

#let authorname   = "Zach Barrett"

#let courseTitle  = "Operating Systems"
#let courseCode   = "COMP604"

#let template = doc => {
  set text(font: "DejaVu Sans Mono", size: 10pt)
  set line(length: 100%) // Set default line length
  set heading(numbering: "1.1.")

  set par(justify: true, linebreaks: "optimized")

  show raw.where(lang: "replaceme"): it => text(size: 1.25em,raw(lang: "typst", it.text))

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

  // Keep all headings on the same page
  show heading: it => { set block(breakable: false); it }

  // Numbered lists are kept on their own page
  // show enum: it => { set block(breakable: false); it }

  show link: underline // Underline links

  doc
}
