#import "@preview/bookly:5.2.0": *
#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/showybox:2.0.4": showybox
#import "@preview/cetz:0.5.3" as cetz: draw
#import "@preview/marginalia:0.3.1" as marginalia
#import "@preview/hydra:0.6.3": hydra

#let version = "0.8.0"
#let primary-color = rgb("2b6cb0")

// Intestazione e piè di pagina occupano anche i margini, ma non devono
// registrarsi come note attraverso wideblock durante le misurazioni.
#let across-margins(body) = context {
  let left-margin = marginalia.get-left()
  let right-margin = marginalia.get-right()
  pad(
    left: -(left-margin.width + left-margin.sep),
    right: -(right-margin.width + right-margin.sep),
    body,
  )
}

#let book-header = context {
  set par(first-line-indent: 0pt)
  set text(style: "italic", fill: black)
  show metadata.where(label: <bookly-title>): it => it.value.short
  show linebreak: none
  let odd-page = calc.odd(here().page())
  across-margins(hydra(if odd-page { 2 } else { 1 }, display: (_, it) => {
    let title = if it.numbering != none {
      numbering(it.numbering, ..counter(heading).at(it.location())) + " " + it.body
    } else {
      it.body
    }
    let rule = stack(
      dir: if odd-page { ltr } else { rtl },
      line(length: 100% - 0.5em, stroke: 0.5pt + primary-color),
      circle(fill: primary-color, stroke: none, radius: 0.25em),
    )
    grid(
      columns: if odd-page { (1fr, auto) } else { (auto, 1fr) },
      column-gutter: 0.5em,
      align: horizon,
      ..if odd-page { (rule, align(right, title)) } else { (align(left, title), rule) },
    )
  }))
}

#let book-footer = context {
  set par(first-line-indent: 0pt, justify: false)
  set text(fill: white, weight: "bold")
  let page-number = counter(page).get().first()
  v(1.5em)
  across-margins[
    #set align(if calc.odd(page-number) { right } else { left })
    #box(outset: 6pt, fill: primary-color, width: 1.5em, height: 100%)[
      #set align(center)
      #counter(page).display()
    ]
  ]
}

// Funzione di configurazione globale
#let setup(doc) = {
  // Regole show e set per l'intero documento

  show: bookly.with(
    title: "Appunti di Analisi Matematica Due",
    author: "Emanuele Paolini",
    theme: modern,
    colors: (primary: primary-color),
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

  set page(header: book-header, footer: book-footer)

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
  set text(lang: "it")
  // Bookly nasconde i nomi nei riferimenti; ripristinarli automaticamente.
  set ref(supplement: element => lower(element.supplement))
  show figure.where(kind: image): set figure(supplement: [Figura])
  show figure.where(kind: table): set figure(supplement: [Tabella])
  
  set par(
    justify: true,
    leading: 0.52em,
  )
  // Numerazione equazioni per capitolo: (1.1)
  set math.equation(numbering: (..n) => {
    let chapter = counter(heading).get().first()
    numbering("(1.1a)", chapter, ..n)
  })
  
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

#let Subset = math.subset.double
#let subset = math.subset.eq
