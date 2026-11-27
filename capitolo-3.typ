// Compila solo il capitolo 3: typst compile capitolo-3.typ
// I riferimenti ad altri capitoli appaiono come ?etichetta in rosso.
#import "lib.typ": *

#show: setup

#counter(heading).update(2)
#include "chapters/03_integrali/___.typ"
