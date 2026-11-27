// Compila solo il capitolo 1: typst compile capitolo-1.typ
// I riferimenti ad altri capitoli appaiono come ?etichetta in rosso.
#import "lib.typ": *

#show: setup

#counter(heading).update(0)
#include "chapters/01_spazi_metrici/___.typ"
