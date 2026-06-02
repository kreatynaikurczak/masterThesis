#let setup(body) = {
  set page(
    paper: "a4",
    margin: (inside: 3.5cm, outside: 2.5cm, y: 2.5cm),
    numbering: "1",
  )
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "pl",
  )
  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 0.63cm,
  )

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(1em)
    it
    v(1em)
  }

  body
}
