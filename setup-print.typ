#import "@preview/bookly:5.2.0": bookly, modern, equate
#import "print-layout.typ": print-title-page, print-page, print-bleed
#import "@preview/marginalia:0.3.1" as marginalia
#import "@preview/hydra:0.6.3": hydra

#let alt-margins-input = sys.inputs.at("alt-margins", default: "true")
#assert(alt-margins-input in ("true", "false"),
  message: "alt-margins deve essere true oppure false")
#let alt-margins = alt-margins-input == "true"

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

// Bookly trasforma le didascalie in note di Marginalia. Durante le
// misurazioni delle figure queste aggiornano anche lo stato globale delle
// note, provocando mancata convergenza. Le didascalie restano ancorate alla
// figura, ma vengono posizionate senza registrarle come note mobili.
#let book-caption(it) = {
  let body = context {
    if it.numbering != none {
      it.supplement
      sym.space
      it.counter.display(it.numbering)
      [ – ]
    }
    it.body
  }
  let styled-body = {
    set text(size: 9.35pt, style: "normal", weight: "regular")
    set par(spacing: 1.2em, leading: 0.5em, hanging-indent: 0pt)
    body
  }
  box(width: 0pt, context {
    let right-side = not alt-margins or calc.odd(here().page())
    let margin = if right-side { marginalia.get-right() } else { marginalia.get-left() }
    let x = if right-side { page.width - margin.far - margin.width } else { margin.far }
    let anchor = here().position()
    place(left, dx: x - anchor.x, block(width: margin.width, styled-body))
  })
}

#let book-header(primary-color) = context {
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

#let book-footer(primary-color) = context {
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

// Impaginazione dell'edizione PDF.
#let setup-print(book-info, primary-color, doc) = {
  // Regole show e set per l'intero documento
  // La smarginatura resta attiva anche nelle pagine create da Bookly.
  set page(..print-page)

  show: bookly.with(
    title: book-info.title,
    author: book-info.author,
    theme: modern,
    colors: (primary: primary-color),
    lang: book-info.lang,
    tufte: true,
    fonts: (
      body: "Lato",
      math: "Lete Sans Math"
    ),
    title-page: print-title-page(
      subtitle: none,
      edition: [Versione #book-info.version],
      series: "",
      institution: book-info.institution,
      version-usage: [
        #block(above: 0pt, below: 8pt)[
          #link(book-info.license.url)[
            #image(book-info.license.logo, width: 88pt,
              alt: book-info.license.alt)
          ]
        ]
        Quest'opera è distribuita con licenza
        #link(book-info.license.url)[
          #book-info.license.name (#book-info.license.short)
        ]. È consentito condividere e modificare l'opera, anche per fini
        commerciali, attribuendo la paternità, indicando le modifiche e
        distribuendo gli adattamenti con la stessa licenza.
      ],
      // logo: image("images/typst-logo.svg"),
      // cover: image("images/book-cover.jpg", width: 45%)
    ),
    config-options: (
      open-right: true,
      alt-margins: alt-margins
    )
  )

  // Bookly usa 12.5 mm sul bordo: non bastano per la rilegatura KDP,
  // soprattutto con le barre dei teoremi che sporgono di circa 3 mm.
  // Conservare la larghezza della colonna principale (80 mm totali di
  // margini e spazio note), riducendo soltanto la colonna delle note.
  show: marginalia.setup.with(
    inner: (far: 17mm, width: 0mm, sep: 0mm),
    outer: (far: 17mm, width: 41mm, sep: 5mm),
    top: 25mm,
    bottom: 25mm,
    book: alt-margins,
  )

  // Sovrascrivere la modalità di Equate impostata da Bookly: numerare solo
  // formule etichettate o singole righe con una label, senza salti nel contatore.
  show: equate.with(breakable: true, sub-numbering: true, number-mode: "label")

  // Formato pagina per l'edizione cartacea Amazon KDP.
  set page(..print-page, header: book-header(primary-color), footer: book-footer(primary-color))

  show figure.caption.where(position: top): book-caption

  // Con i margini fisici più larghi, il fondo di Bookly largo 114% richiede
  // un'estensione aggiuntiva a destra per arrivare alla smarginatura.
  show rect.where(width: 114%): set rect(
    outset: (right: print-bleed + 10mm, rest: print-bleed),
  )

  // Bookly usa equate: la regola globale sulle formule di thm-rules
  // entra in ricorsione con equate. Applicare solo le regole necessarie
  // agli ambienti, ai riferimenti e al simbolo di fine dimostrazione.
  show figure.where(kind: "thm-env"): it => {
    set block(breakable: true)
    set align(left)
    it.body
  }
  set par(
    justify: true,
    leading: 0.52em,
  )

  doc
}

