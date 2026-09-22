#import "@preview/ctheorems:2.0.0": *
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#show: thm-rules.with(qed-symbol: $square$)
#import thm-themes.ams: *

// Definizioni globali degli ambienti matematici
#let theorem = theorem.with(fill: rgb("f0f4f8"))
#let definition = definition.with(fill: rgb("f0f4f8"))
#let exercise = example.with(fill: rgb("fff9e6"))
#let example = example.with(fill: rgb("f9f9f9"))
//#let proof = proof.with("proof", "Dimostrazione")