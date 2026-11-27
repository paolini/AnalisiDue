// Compila solo il capitolo 4: typst compile capitolo-4.typ
// I riferimenti ad altri capitoli appaiono come ?etichetta in rosso.
#import "lib.typ": *

#show: setup

#counter(heading).update(3)
#include "chapters/04_forme_differenziali/___.typ"
