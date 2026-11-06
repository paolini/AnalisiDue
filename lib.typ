#import "@preview/bookly:5.2.0": *
#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/showybox:2.0.4": showybox
#import "@preview/cetz:0.5.3" as cetz: draw

#let version = "0.8.0"

// Funzione di configurazione globale
#let setup(doc) = {
  // Regole show e set per l'intero documento

  show: bookly.with(
    title: "Appunti di Analisi Matematica Due",
    author: "Emanuele Paolini",
    theme: modern,
    colors: (primary: rgb("2b6cb0")),
    lang: "it",
    tufte: true,
    fonts: (
      body: "Lato",
      math: "Lete Sans Math"
    ),
    title-page: book-title-page(
      subtitle: none,
      edition: [Versione #version],
      series: "",
      institution: "manu-fatto",
      version-usage: [
        #block(above: 0pt, below: 8pt)[
          #link("https://creativecommons.org/licenses/by-sa/4.0/")[
            #image("figure/cc-by-sa.svg", width: 88pt,
              alt: "Creative Commons: Attribuzione, Condividi allo stesso modo")
          ]
        ]
        Quest'opera è distribuita con licenza
        #link("https://creativecommons.org/licenses/by-sa/4.0/")[
          Creative Commons Attribuzione – Condividi allo stesso modo
          4.0 Internazionale (CC BY-SA 4.0)
        ]. È consentito condividere e modificare l'opera, anche per fini
        commerciali, attribuendo la paternità, indicando le modifiche e
        distribuendo gli adattamenti con la stessa licenza.
      ],
      // logo: image("images/typst-logo.svg"),
      // cover: image("images/book-cover.jpg", width: 45%)
    ),
    config-options: (
      open-right: true,
      alt-margins: false
    )
  )

  // Bookly usa equate: la regola globale sulle formule di thm-rules
  // entra in ricorsione con equate. Applicare solo le regole necessarie
  // agli ambienti, ai riferimenti e al simbolo di fine dimostrazione.
  show figure.where(kind: "thm-env"): it => {
    set block(breakable: true)
    set align(left)
    it.body
  }
  show ref: it => {
    if it.element != none and it.element.func() == figure and it.element.kind == "thm-env" {
      thm-rules(it)
    } else {
      it
    }
  }
  show metadata.where(value: "thm-qed-symbol"): $square$

  set heading(numbering: "1.1")
  set text(lang: "it")
  // Bookly nasconde i nomi nei riferimenti; ripristinarli automaticamente.
  set ref(supplement: auto)
  show figure.where(kind: image): set figure(supplement: [Figura])
  show figure.where(kind: table): set figure(supplement: [Tabella])
  
  set par(
    justify: true,
    leading: 0.52em,
  )
  // Numerazione equazioni per capitolo: (1.1)
  set math.equation(numbering: "(1.1)")
  
  doc
}

// Ambienti matematici personalizzati (stile con bordo sinistro)
#let theorem = theorem.with(
  supplement: "Teorema",
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
  supplement: "Definizione",
  stroke: (left: 3pt + rgb("2f855a")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let example = example.with(
  supplement: "Esempio",
  // Gli esempi hanno un contatore autonomo, basato sui titoli.
  counter: "Example",
  base: "heading",
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

#let proposition = proposition.with(supplement: "Proposizione")
#let corollary = corollary.with(supplement: "Corollario")
#let conjecture = conjecture.with(supplement: "Congettura")
#let problem = problem.with(supplement: "Problema", counter: "Problem")
#let remark = remark.with(supplement: "Osservazione")
#let claim = claim.with(supplement: "Affermazione")

// Comandi custom
#let vec(x) = math.bold(x)

#let Subset = math.subset.double
#let subset = math.subset.eq
