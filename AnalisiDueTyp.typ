#import "@preview/ctheorems:2.0.0": *
#import thm-themes.ams: *
#import "@preview/showybox:2.0.4": showybox

// Inizializzazione delle regole per ctheorems 2.0.0
#show: thm-rules.with(qed-symbol: $square$)

#set heading(numbering: "1.1")
#set text(lang: "it")
#set math.equation(numbering: "1.")


#include "chapters/01_spazi_metrici/00_introduzione.typ"