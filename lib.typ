#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#import "@preview/fletcher:0.5.8": diagram, node, edge
#import "@preview/showybox:2.0.4": showybox

// Funzione di configurazione globale
#let setup(doc) = {
  // Regole show e set per l'intero documento
  show: thm-rules.with(qed-symbol: $square$)
  set heading(numbering: "1.1")
  set text(lang: "it")
  set math.equation(numbering: "(1)")
  
  doc
}

// Ambienti matematici personalizzati
#let theorem = theorem.with(fill: rgb("f0f4f8"))
#let definition = definition.with(fill: rgb("f0f4f8"))
#let example = example.with(fill: rgb("f9f9f9"))
#let exercise = thm.with(
  supplement: "Esercizio",
  fill: rgb("fff9e6"),
)
#let proof = proof.with(supplement: "Dimostrazione")

// Comandi custom
#let vec(x) = math.bold(x)