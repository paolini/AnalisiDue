#import "lib.typ": *

#show: setup

#context if target() != "html" {
  tableofcontents
  pagebreak(weak: true)
}

// Capitoli e appendice.
#include "chapters/01_spazi_metrici/___.typ"
#include "chapters/02_derivate/___.typ"
#include "chapters/03_integrali/___.typ"
#include "chapters/04_forme_differenziali/___.typ"
#include "chapters/05_edo/___.typ"
// #include "chapters/code/___.typ"
#include "chapters/99_appendix.typ"
