#import "lib.typ": *

// Esportazione sperimentale: typst compile --features html AnalisiDueHtml.typ AnalisiDueTyp.html
#set document(title: "Appunti di Analisi Matematica Due", author: "Emanuele Paolini")
#set text(lang: "it")
#set heading(numbering: "1.1")
#set ref(supplement: element => lower(element.supplement))
#set math.equation(numbering: (..n) => {
  numbering("(1.1a)", counter(heading).get().first(), ..n)
})
#set figure(numbering: n => numbering("1.1", counter(heading).get().first(), n))
#show heading.where(level: 1): it => {
  counter(math.equation).update(0)
  counter(figure.where(kind: image)).update(0)
  it
}
#show math.overline: it => context {
  if target() == "html" { math.accent(it.body, sym.macron) } else { it }
}
#show figure.where(kind: image): it => context {
  if target() == "html" {
    html.elem("figure", [#html.frame(it.body) #it.caption])
  } else { it }
}
#show figure.where(kind: "thm-env"): it => {
  let kind = if it.supplement == [Esempio] { "example" }
    else if it.supplement == [Definizione] { "definition" }
    else if it.supplement == [Esercizio] { "exercise" }
    else { "theorem" }
  html.elem("section", attrs: (class: kind), it.body)
}
#show ref: it => {
  if it.element != none and it.element.func() == figure and it.element.kind == "thm-env" {
    let marker = query(selector(<meta:thm-env-counter>).after(it.element.location())).first()
    let data = thm-state.thm-stored.at(marker.location()).last()
    let supplement = it.citation.supplement
    if supplement == none { supplement = lower(data.supplement) }
    (data.ref-fmt)(data + (ref-supplement: supplement))
  } else { it }
}
#show metadata.where(value: "thm-qed-symbol"): $square$

#html.elem("style", read("AnalisiDueHtml.css"))

#title[Appunti di Analisi Matematica Due]
Emanuele Paolini · Versione #version

#link("https://creativecommons.org/licenses/by-sa/4.0/")[
  Creative Commons Attribuzione – Condividi allo stesso modo 4.0 Internazionale
]

#outline(title: [Indice])

#include "chapters/01_spazi_metrici/___.typ"
#include "chapters/02_derivate/___.typ"
#include "chapters/03_integrali/___.typ"
#include "chapters/04_forme_differenziali/___.typ"
#include "chapters/05_edo/___.typ"
#include "chapters/99_appendix.typ"
