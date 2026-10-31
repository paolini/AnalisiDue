#import "../../lib.typ": *

= Teorema di Stone-Weierstrass

#theorem[Stone-Weierstrass][
  Sia $X$ uno spazio metrico compatto.
  Sia $cal(A) subset C(X)$ un'algebra cioè un sottospazio vettoriale dello spazio delle funzioni continue su $X$ a valori in $RR$ tale che se $f,g in cal(A)$ allora anche $f dot g in cal(A)$.
  Supponiamo che
  + $1 in cal(A)$ ($1$ è la funzione costante $1(x)=1$);
  + $cal(A)$ separa i punti di $X$, cioè
    $ forall x != y in X quad exists f in cal(A) text(" tale che ") f(x) != f(y). $

  Allora $cal(A)$ è densa in $C(X)$ rispetto alla norma uniforme, cioè
  $ forall epsilon > 0 quad forall f in C(X) quad exists g in cal(A) : norm(f-g)_infinity < epsilon. $
] <th:stone-weierstrass>

Per la dimostrazione ci servono alcuni lemmi intermedi.

#lemma[
  Siano $X$ e $cal(A)$ come nelle ipotesi del teorema.
  Dato $x_0 in X$, dato $U$ intorno aperto di $x_0$ esiste $V$ intorno di $x_0$, $V subset U$ tale che per ogni $epsilon > 0$ esiste $f in cal(A)$ tale che
  + $0 <= f <= 1$,
  + $f(x) < epsilon$ per ogni $x in V$,
  + $f(x) > 1-epsilon$ per ogni $x in X without U$.
]

#proof[
  Per ogni $x in X without U$ consideriamo $g_x in cal(A)$ tale che $g_x(x) != g_x(x_0)$.
  Definiamo $h_x = g_x - g_x(x_0) dot 1 in cal(A)$.
  Così $h_x(x) != h_x(x_0) = 0$.
  Definiamo
  $ p_x = h_x^2 / norm(h_x)_infinity in cal(A) $
  così $p_x(x_0)=0$, $p_x(x)>0$, $0 <= p_x <= 1$.

  L'insieme
  $ U_x = {y in X : p_x(y) > 0} $
  è un intorno aperto di $x$ dunque $X without U$ è un compatto ricoperto dagli $U_x$ al variare di $x in X without U$.
  Posso estrarre un sottoricoprimento finito: dunque esistono $x_1, dots, x_m in X without U$ tali che $X without U subset U_(x_1) union dots union U_(x_m)$.
  Poniamo
  $ p = (p_(x_1) + dots + p_(x_m)) / m in cal(A) $
  così da avere $0 <= p <= 1$, $p(x_0)=0$, $p(x)>0$ per ogni $x in X without U$.
  Visto che $X without U$ è compatto esiste $delta = min p(X without U) > 0$ e dunque $p(x) >= delta > 0$ e $0 < delta <= 1$.
  Sia
  $ V = {x in X : p(x) < delta / 2}. $
  Visto che $p(x_0)=0$ si ha che $V$ è un intorno di $x_0$, e visto che $p(x) >= delta$ su $X without U$ risulta $V subset U$.
  Sia $k in NN$ tale che
  $ 1 / delta < k <= 1 / delta + 1 = (delta + 1) / delta < 2 / delta $
  così $1 < k delta < 2$.
  Poniamo
  $ q_n(x) = (1 - p^n(x))^(k^n) in cal(A) $
  così $0 <= q_n <= 1$, $q_n(x_0) = 1$.
  Ricordando la disuguaglianza di Bernoulli
  $ (1+t)^n >= 1 + n t, quad forall t >= -1 $
  per ogni $x in V$ si ha $k p(x) <= k delta / 2 < 1$ dunque
  $ q_n(x) >= 1 - k^n p^n(x) >= 1 - (k delta / 2)^n -> 1 $
  ovvero $q_n -> 1$ uniformemente su $V$.
  Mentre se $x in X without U$ si ha $k p >= k delta > 1$
  $ q_n(x)
      &= (1 - p^n(x))^(k^n) \
      &<= (1 + k^n p^n(x)) / (k^n p^n(x)) (1 - p^n(x))^(k^n) \
      &<= (1 + p^n(x))^(k^n) / (k^n p^n(x)) (1 - p^n(x))^(k^n) \
      &= (1 - p^(2n)(x))^(k^n) / (k^n p^n(x)) \
      &<= 1 / (k^n p^n(x)) \
      &<= 1 / (k delta)^n -> 0. $
  Dunque $q_n -> 0$ uniformemente su $X without U$.

  Prendendo $n$ sufficientemente grande si ha $q_n < epsilon$ su $X without U$ e $q_n > 1-epsilon$ su $V$.

  La funzione $f = 1 - q_n$ soddisfa le proprietà richieste.
]

#lemma[
  Siano $X$ e $cal(A)$ come nel teorema.
  Siano $A,B subset X$ compatti disgiunti.
  Per ogni $epsilon > 0$ esiste $f in cal(A)$ tale che
  + $0 <= f <= 1$,
  + $f(x) < epsilon$ per ogni $x in A$,
  + $f(x) > 1-epsilon$ per ogni $x in B$.
]

#proof[
  Sia $U supset.eq A$ aperto disgiunto da $B$.
  Per ogni $x in A$ esiste $V_x subset U$ un intorno aperto di $x$ come nel lemma precedente.
  Gli aperti $V_x$ ricoprono il compatto $A$ dunque esistono $x_1, dots, x_m in A$ tali che $V_(x_1) union dots union V_(x_m) supset.eq A$ ed esistono $g_1, dots, g_m in cal(A)$ tali che $0 <= g_k <= 1$, $g_i < epsilon / m$ su $V_(x_i)$ e $g_i > 1 - epsilon / m$ su $X without U$.

  Posto $g = g_1 dot g_2 dots g_m$ si ha $0 <= g <= 1$ e per ogni $x in A$ esiste $x_i$ tale che $x in V_(x_i)$.
  Visto che $g_i(x) < epsilon / m$ si ha $g(x) < epsilon / m$.
  Inoltre per ogni $x in B$, $x thin bold(not in) thin union.big V_(x_i)$ e per ogni $i$ si ha $g_i(x) > 1 - epsilon / m$.
  Dunque
  $ g > (1 - epsilon / m)^m >= 1 - m epsilon / m = 1 - epsilon. $
]

#proof[Dimostrazione del teorema][
  Sia $f in C(X)$ e $epsilon > 0$.
  Voglio mostrare che esiste $g in cal(A)$ tale che $|f-g|_infinity <= epsilon$.
  Eventualmente considerando $f + norm(f)_infinity$ posso supporre $f >= 0$ (perché se esiste $g in cal(A)$ con $norm(g - (f + norm(f)_infinity))_infinity < epsilon$ allora $tilde(g) = g - norm(f)_infinity in cal(A)$ e $norm(f - tilde(g))_infinity < epsilon$).
  Eventualmente considerando $3 / epsilon dot f$ al posto di $f$ posso supporre $epsilon = 3$ (perché se esiste $g in cal(A)$ con $norm(g - 3 / epsilon dot f)_infinity < 3$ allora $tilde(g) = epsilon / 3 g in cal(A)$ e $norm(f - tilde(g))_infinity < epsilon$).

  Prendiamo $N in NN$, $N >= norm(f)_infinity + 1$.
  Per $j=1, dots, N$ definiamo
  $ A_j &= {x in X : f(x) <= j} \
    B_j &= {x in X : f(x) >= j+1} $
  così $A_j$ e $B_j$ sono compatti disgiunti.

  Per il lemma precedente esiste $g_j in cal(A)$, $0 <= g_j <= 1$ tale che $0 <= g_j <= 1/N$ su $A_j$ e $1 - 1/N <= g_j <= 1$ su $B_j$.

  Si definisce
  $ g = sum_(j=1)^N g_j(x). $
  Per ogni $x in X$ esiste $m in NN$, $0 <= m <= N$, tale che $m <= f(x) <= m+1$.
  Dunque $x in B_j$ per $j=1, dots, m-1$ e $x in A_j$ per $j=m+1, dots, N$.

  Dunque si ha
  $ (m-1) dot (1 - 1/N) + (N-m+1) dot 0 <= g(x) <= m dot 1 + (N-m) dot 1/N $
  e in particolare $m-2 <= g(x) <= m+1$.
  In conclusione
  $ m - (m+1) <= f(x) - g(x) <= m+1 - (m-2) $
  ovvero $-1 <= f(x) - g(x) <= 3$, da cui $|f-g|_infinity <= 3$.
]

L'applicazione più ovvia del teorema @th:stone-weierstrass di Stone-Weierstrass all'algebra dei polinomi ci dice che ogni funzione continua, definita su un compatto di $RR^n$, può essere approssimata uniformemente con polinomi di $n$ variabili.

Un caso molto simile è quello dei polinomi trigonometrici, cioè le funzioni della forma $g(x) = P(sin x, cos x)$ dove $P$ è un polinomio in due variabili.
Anche questa è un'algebra di funzioni continue su $RR$.
Osserviamo però che tutte queste funzioni sono $2pi$-periodiche, dunque i punti $0$ e $2pi$ (ad esempio) non possono essere separati.
Bisogna dunque considerare queste funzioni definite sul compatto ottenuto prendendo l'intervallo $[0, 2pi]$ e identificando gli estremi $0$ e $2pi$: $X = RR \/ (2pi ZZ)$.
Si ottiene quindi che ogni funzione continua $2pi$-periodica definita su $RR$ può essere approssimata uniformemente tramite polinomi trigonometrici.
Questo risultato sarà importante per determinare l'approssimabilità di una funzione tramite la sua serie di Fourier (si veda il capitolo @sec:serie_fourier).

#exercise[
  Data una funzione continua $f: [0,1] -> RR$ definiamo i suoi _momenti_ $m_0, m_1, m_2, dots$ tramite le formule:
  $ m_n(f) = integral_0^1 f(x) x^n thin d x. $
  Dimostrare che se due funzioni continue hanno gli stessi momenti allora sono uguali.
]