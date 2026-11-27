// Compila solo il capitolo 2: typst compile capitolo-2.typ
// I riferimenti ad altri capitoli appaiono come ?etichetta in rosso.
#import "lib.typ": *

#show: setup

#counter(heading).update(1)
#include "chapters/02_derivate/___.typ"
