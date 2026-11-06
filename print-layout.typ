// Adattamento di book-title-page da Bookly 5.2.0 (licenza MIT).
// Le dimensioni esplicite evitano che il frontespizio torni al formato A4.
#import "@preview/bookly:5.2.0": states

// Misure esatte in pollici: le equivalenze in cm di KDP sono arrotondate.
#let print-bleed = 0.125in
#let print-page = (
  width: 8.25in,
  height: 11in,
  binding: left,
  bleed: (y: print-bleed, outside: print-bleed, inside: 0pt),
)

#let print-title-page(
  subtitle: "Book subtitle",
  edition: "First edition",
  institution: "Institution",
  series: "Discipline",
  year: datetime.today().year(),
  cover: none,
  logo: none,
  version-usage: none,
  copyright: none,
  show-cover-author: true
) = context {
  let header = {
    box(fill: states.colors.get().primary, width: 100%, inset: 1em, outset: print-bleed)[
      #set align(center + horizon)
      #text(fill: white, size: 1.5em)[#strong(delta: 400)[#series]]
    ]
  }

  let footer = {
    // Alzare il testo rispetto al bordo di taglio; il fondo blu continua
    // fino alla smarginatura senza modificare l'impaginazione del frontespizio.
    move(dy: -8mm)[
      #box(fill: states.colors.get().primary, width: 100%, inset: 1em,
        outset: (x: print-bleed, top: print-bleed, bottom: print-bleed + 8mm))[
        #set align(center + horizon)
        #text(fill: white, size: 1.5em)[#strong(delta: 400)[#institution]]
      ]
    ]
  }

  set page(
    ..print-page,
    header: header,
    footer: footer,
    margin: (left: 0em, right:0em, top: 4em, bottom: 4em)
  )

  let title-page = context {
    set par(first-line-indent: 0em) if states.par-indent.get()

    align(horizon)[
      #move(dx: 2em)[
        #line(stroke: 1.5pt + states.colors.get().primary, length: 90%)
        #v(1em)
      ]

      #move(dx: 4em)[
        #text(size: 3em)[*#states.title.get()*]
        #linebreak()

        #if subtitle != none {
          v(0.5em)
          text(size: 1.75em)[#subtitle]
          linebreak()
          v(0.5em)
        }

        #if edition != none {
          v(0.5em)
          text(size: 1.25em)[_ #edition _]
          linebreak()
          v(0.5em)
        }

        #if show-cover-author {
          v(0.5em)
          text(size: 1.5em)[#states.author.get()]
        }
      ]

      #move(dx: 2em)[
        #v(1em)
        #line(stroke: 1.5pt + states.colors.get().primary, length: 90%)
      ]

      #if cover != none {
        v(1.5em)
        align(center)[#cover]
      }
    ]

    set page(
      ..print-page,
      header: none,
      footer: none,
      margin: auto
    )

    if states.open-right.get() {
      pagebreak(to: "odd")
    }

    place(center + horizon)[
      #text(size: 3em)[*#states.title.get()*]

      #if subtitle != none {
          v(-1.5em)
          text(size: 1.75em)[#subtitle]
          linebreak()
          v(0.5em)
        }

        #if edition != none {
          v(0.5em)
          text(size: 1.25em)[_ #edition _]
          linebreak()
          v(0.5em)
        }
    ]

    let version-info = if version-usage != none {text(size: 0.85em)[#version-usage \ #sym.copyright #states.author.get(), #year.]} else {text(size: 0.85em)[#states.localization.get().version-usage \ #sym.copyright #states.author.get(), #year.]}

    let height-ver = measure(version-info).height

    if logo != none {
      set image(width: 35%)
      place(bottom + center, dy: -(height-ver + 8em), logo)
    }

    v(1fr)
    if version-usage != none {
      text(size: 0.65em)[#version-usage]
    } else {
      text(size: 0.65em)[#states.localization.get().version-usage]
    }

    if copyright != none {
      v(0.5em)
      text(size: 0.65em)[#copyright]
    } else {
      v(0.5em)
      text(size: 0.65em)[#sym.copyright #states.author.get(), #year.]
    }
  }

  title-page
}

