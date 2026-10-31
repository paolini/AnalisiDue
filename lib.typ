// #import "@preview/bookly:5.2.0": *
#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/showybox:2.0.4": showybox

// Funzione di configurazione globale
#let setup(doc) = {
  // Regole show e set per l'intero documento

  show: thm-rules.with(qed-symbol: $square$)

  /*
  show: bookly.with(
    title: "My document",
    author: "Author Name",
    theme: modern,
    lang: "en",
    tufte: false,
    fonts: (
      body: "Lato",
      math: "Lete Sans Math"
    ),
    title-page: book-title-page(
      series: "Typst book series",
      institution: "Typst community",
      // logo: image("images/typst-logo.svg"),
      // cover: image("images/book-cover.jpg", width: 45%)
    ),
    config-options: (
      open-right: true,
      alt-margins: false
    )
  )
  */


  set heading(numbering: "1.1")
  set text(lang: "it")
  
  // Numerazione equazioni per capitolo: (1.1)
  set math.equation(numbering: "(1.1)")
  
  doc
}

// Ambienti matematici personalizzati (stile con bordo sinistro)
#let theorem = theorem.with(
  stroke: (left: 3pt + rgb("2b6cb0")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let lemma = lemma.with(
  stroke: (left: 3pt + rgb("4299e1")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let definition = definition.with(
  stroke: (left: 3pt + rgb("2f855a")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let example = example.with(
  stroke: (left: 3pt + rgb("718096")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let exercise = thm.with(
  supplement: "Esercizio",
  stroke: (left: 3pt + rgb("d69e2e")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let proof = proof.with(supplement: "Dimostrazione")

// Comandi custom
#let vec(x) = math.bold(x)