#import "../../lib.typ": *

= Esempi di calcolo di integrali multipli

== Coordinate polari

Se la funzione integranda o il dominio di integrazione hanno una simmetria circolare può essere conveniente effettuare un cambio di variabili in coordinate polari:
$ cases(
  x = rho cos theta,
  y = rho sin theta.
) $

Dominio:
$ 0 <= rho <= R, quad 0 <= theta <= 2 pi $

Jacobiano:
$ J_phi = mat(delim: "|", cos theta, -rho sin theta; sin theta, rho cos theta) = rho $

Quindi:
$ d x thin d y = rho thin d rho thin d theta $

Calcoliamo l'area del cerchio di raggio $R$ centrato nell'origine, cioè l'integrale:
$ integral.double_(B_R (0)) 1 thin d x thin d y. $

L'integrale diventa:
$ integral.double_(B_R (0)) 1 thin d x thin d y = integral_0^(2 pi) integral_0^R rho thin d rho thin d theta $

Calcolo:
$ integral_0^R rho thin d rho = R^2 / 2 $

$ integral_0^(2 pi) d theta = 2 pi $

Risultato:
$ integral.double_(B_R (0)) 1 thin d x thin d y = R^2 / 2 dot 2 pi = pi R^2 $

= Coordinate cilindriche

$ cases(
  x = rho cos theta,
  y = rho sin theta,
  z = z
) $

Jacobiano:
$ J = rho $

Elemento di volume:
$ d x thin d y thin d z = rho thin d rho thin d theta thin d z $

= Coordinate sferiche

#figure(
  [ _[Diagramma coordinate sferiche]_ ],
)

$ cases(
  x = rho sin phi.alt cos theta,
  y = rho sin phi.alt sin theta,
  z = rho cos phi.alt
) $

con:
$ rho >= 0, quad 0 <= theta <= 2 pi, quad 0 <= phi.alt <= pi $

Jacobiano:
$ J = rho^2 sin phi.alt $

Elemento di volume:
$ d x thin d y thin d z = rho^2 sin phi.alt thin d rho thin d phi.alt thin d theta $