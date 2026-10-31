#import "../../lib.typ": *

= Il problema di Cauchy per equazioni di ordine $n$

Il problema di Cauchy per le equazioni di ordine $n$ è il problema di determinare la soluzione di una equazione differenziale ordinaria di ordine $n$ in forma normale accoppiato ad una condizione iniziale per il valore della funzione e di tutte le sue derivate fino all'ordine $n-1$.
Dato $Omega subset RR times RR^n$ aperto, $f in C^0(Omega)$, $arrow(y) = (y_1, dots, y_n) in RR^n$ si tratta quindi di trovare un intervallo $I subset RR$ e una funzione $u in C^n(I)$ che soddisfi le seguenti condizioni:
$ cases(
  u^((n))(x) = f(x, u(x), u'(x), dots, u^(n-1)(x)),
  u(x_0) = y_1,
  u'(x_0) = y_2,
  dots.v,
  u^((n-1))(x_0) = y_n.
) $ <eq:problema_cauchy_ordine_n>

#theorem[esistenza e unicità per le equazioni di ordine $n$][
  Sia $f: Omega -> RR$ una funzione che soddisfa la condizione di Cauchy-Lipschitz.
  Allora il problema di Cauchy @eq:problema_cauchy_ordine_n ammette una unica soluzione locale.
  Esiste cioè un $delta > 0$ tale che per ogni intervallo $I subset [x_0-delta, x_0+delta]$ esiste una unica $u in C^n(I)$ che soddisfa la @eq:problema_cauchy_ordine_n.

  Se poi $Omega$ è della forma $Omega = I times RR^n$ con $I subset RR$ intervallo aperto e se $f$ è anche sublineare (come nelle ipotesi di esistenza globale) allora il problema di Cauchy @eq:problema_cauchy_ordine_n ammette una unica soluzione definita su tutto $I$.
] <th:cauchy_lipschitz_ordine_n>

#proof[
  Se $u in C^n$ è una funzione scalare possiamo considerare la funzione vettoriale $arrow(u) in C^1$ le cui componenti sono $u$ e le sue prime $n-1$ derivate:
  $ arrow(u)(x) = (u(x), u'(x), dots, u^((n-1))(x)) $
  ovvero $u_k (x) = u^((k-1))(x)$ per $k=1, dots, n$ essendo $arrow(u)(x) = (u_1 (x), dots, u_n (x))$.

  Con questa trasformazione il problema @eq:problema_cauchy_ordine_n si può scrivere nella forma:
  $ cases(
    u_1 '(x) = u_2,
    dots.v,
    u_(n-1)'(x) = u_n,
    u_n '(x) = f(x, u_1 (x), u_2 (x), dots, u_n (x)),
    u_1 (x_0) = y_1,
    dots.v,
    u_n (x_0) = y_n
  ) $
  ovvero posto $arrow(f)(x, arrow(y)) = (y_2, y_3, dots, y_n, f(x, arrow(y)))$ abbiamo una funzione vettoriale $arrow(f): Omega -> RR^n$ e il problema @eq:problema_cauchy_ordine_n risulta equivalente a
  $ cases(
    arrow(u)'(x) = arrow(f)(x, arrow(u)(x)),
    arrow(u)(x_0) = arrow(y).
  ) $ <eq:437583>
  Visto che $f$ è continua, anche $arrow(f)$ risulta continua.
  Verifichiamo se $arrow(f)$ soddisfa la condizione di Lipschitz.
  Per ipotesi $f$ la soddisfa, cioè esiste $L>0$ tale che:
  $ |f(x, arrow(y)) - f(x, arrow(z))| <= L |arrow(y) - arrow(z)|. $
  Ma allora si ha
  $ |arrow(f)(x, arrow(y)) - arrow(f)(x, arrow(z))|
      &= sqrt(sum_(k=2)^n |y_k - z_k|^2 + |f(x, arrow(y)) - f(x, arrow(z))|^2) \
      &<= sqrt(|arrow(y) - arrow(z)|^2 + L^2 |arrow(y) - arrow(z)|^2)
      = sqrt(1+L^2) dot |arrow(y) - arrow(z)|. $
  Dunque la funzione $arrow(f)$ verifica le ipotesi del teorema di Cauchy-Lipschitz: esiste dunque una soluzione $arrow(u)$ di tale problema in un opportuno intervallo centrato nel punto $x_0$.
  Ponendo $u=u_1$ (la prima componente di $arrow(u)$) si osserva che $u$ è di classe $C^n$.
  Infatti sappiamo che $arrow(u)$ è di classe $C^1$ ed essendo $u_1 ' = u_2$, $u_2 ' = u_3$, dots, $u_(n-1)' = u_n$ ed essendo $u_n in C^1$, si scopre che $u=u_1$ è di classe $C^n$ ed è una soluzione del problema @eq:problema_cauchy_ordine_n.
  Anche l'unicità segue direttamente dall'equivalenza delle due formulazioni.

  L'esistenza globale segue in maniera analoga dal teorema per i sistemi del primo ordine. Basti osservare che se la funzione $f$ soddisfa l'ipotesi di sublinearità anche $arrow(f)$ la soddisfa.
]
