// Compila solo il capitolo 5: typst compile capitolo-5.typ
// I riferimenti ad altri capitoli appaiono come ?etichetta in rosso.
#import "lib.typ": *

#show: setup

#counter(heading).update(4)
#include "chapters/05_edo/___.typ"
