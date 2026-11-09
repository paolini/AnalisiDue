#import "@preview/bookly:5.2.0": *
#import "setup-print.typ": setup-print
#import "setup-html.typ": setup-html
#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/showybox:2.0.4": showybox
#import "@preview/cetz:0.5.3" as cetz: draw

#let version = "1.1.2"
#let book-info = (
  title: "Appunti di Analisi Matematica Due",
  author: "Emanuele Paolini",
  version: version,
  lang: "it",
  institution: "manu-fatto",
  pdf-url: "https://codeberg.org/paolini/AnalisiDue/releases/download/v" + version + "/AnalisiDueTyp.pdf",
  license: (
    url: "https://creativecommons.org/licenses/by-sa/4.0/",
    name: "Creative Commons Attribuzione – Condividi allo stesso modo 4.0 Internazionale",
    short: "CC BY-SA 4.0",
    logo: "figure/cc-by-sa.svg",
    alt: "Creative Commons: Attribuzione, Condividi allo stesso modo",
  ),
)
#let primary-color = rgb("2b6cb0")

// Configurazione comune con rilevamento automatico del formato di esportazione.
#let setup(doc) = context {
  let configure = if target() == "html" {
    setup-html.with(book-info)
  } else {
    setup-print.with(book-info, primary-color)
  }
  show: configure

  show ref: it => {
    if it.element != none and it.element.func() == figure and it.element.kind == "thm-env" {
      let loc = it.element.location()
      let marker = query(selector(<meta:thm-env-counter>).after(loc)).first()
      let data = thm-state.thm-stored.at(marker.location()).last()
      let supplement = it.citation.supplement
      if supplement == none {
        supplement = lower(data.supplement)
      }
      (data.ref-fmt)(data + (ref-supplement: supplement))
    } else {
      it
    }
  }
  show metadata.where(value: "thm-qed-symbol"): $square$

  set heading(numbering: "1.1")
  set text(lang: book-info.lang)
  // Equazioni: solo il numero tra parentesi; gli altri riferimenti hanno il nome.
  set ref(supplement: element => {
    // Equate rappresenta le righe numerate come figure di tipo math.equation.
    if element.func() == math.equation or (
      element.func() == figure and element.kind == math.equation
    ) { [] } else { lower(element.supplement) }
  })
  show figure.where(kind: image): set figure(supplement: [Figura])
  show figure.where(kind: table): set figure(supplement: [Tabella])
  // Numerazione equazioni per capitolo: (1.1)
  set math.equation(numbering: (..n) => {
    let chapter = counter(heading).get().first()
    numbering("(1.1a)", chapter, ..n)
  })
  
  show ref: it => {
    if query(it.target).len() > 0 {
      it
    } else {
      text(fill: red)[?#str(it.target)]
    }
}

  doc
}

// Ambienti matematici personalizzati (stile con bordo sinistro)
#let shared-numbering = (counter: "Theorem", base: "heading", base-level: 1)

#let theorem = theorem.with(
  ..shared-numbering,
  supplement: "Teorema",
  stroke: (left: 3pt + rgb("2b6cb0")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let lemma = lemma.with(
  ..shared-numbering,
  stroke: (left: 3pt + rgb("4299e1")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let definition = definition.with(
  ..shared-numbering,
  supplement: "Definizione",
  stroke: (left: 3pt + rgb("2f855a")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let example = example.with(
  ..shared-numbering,
  supplement: "Esempio",
  stroke: (left: 3pt + rgb("eab308")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let exercise = thm.with(
  ..shared-numbering,
  supplement: "Esercizio",
  stroke: (left: 3pt + rgb("d69e2e")),
  outset: (left: 8pt, y: 2pt),
  fill: none,
  radius: 0pt,
)

#let proof = proof.with(supplement: "Dimostrazione")

#let proposition = proposition.with(..shared-numbering, supplement: "Proposizione")
#let corollary = corollary.with(..shared-numbering, supplement: "Corollario")
#let conjecture = conjecture.with(..shared-numbering, supplement: "Congettura")
#let problem = problem.with(..shared-numbering, supplement: "Problema")
#let remark = remark.with(supplement: "Osservazione")
#let claim = claim.with(supplement: "Affermazione")

// Comandi custom
#let vec(x) = math.bold(x)
#let current(x) = math.lr(math.bracket.l.stroked + x + math.bracket.r.stroked)
#let Subset = math.subset.double
#let subset = math.subset.eq
