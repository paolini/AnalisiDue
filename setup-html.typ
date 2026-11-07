// Regole specifiche dell'esportazione HTML.
#let setup-html(book-info, doc) = {
  set document(title: book-info.title, author: book-info.author)
  set figure(numbering: n => numbering("1.1", counter(heading).get().first(), n))
  show heading.where(level: 1): it => {
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    it
  }
  // Le figure convertite con html.frame sono impaginate internamente come PDF.
  show math.overline: it => context {
    if target() == "html" { math.accent(it.body, sym.macron) } else { it }
  }
  show figure.where(kind: image): it => context {
    if target() == "html" {
      html.elem("figure", [#html.frame(it.body) #it.caption])
    } else { it }
  }
  show figure.where(kind: "thm-env"): it => {
    let kind = if it.supplement == [Esempio] { "example" }
      else if it.supplement == [Definizione] { "definition" }
      else if it.supplement == [Esercizio] { "exercise" }
      else { "theorem" }
    html.elem("section", attrs: (class: kind), it.body)
  }

  html.elem("style", read("AnalisiDueHtml.css"))
  title(book-info.title)
  [#book-info.author · Versione #book-info.version]
  parbreak()
  link(book-info.pdf-url)[Scarica il PDF — versione #book-info.version]
  parbreak()
  link(book-info.license.url, book-info.license.name)
  parbreak()
  outline(title: [Indice])
  doc
}

