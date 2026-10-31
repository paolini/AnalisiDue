#import "../../lib.typ": *

= completezza

#definition[successioni di Cauchy][
  Sia $(X,d)$ uno spazio metrico e $x_k$ una successione di punti di $X$.
  Diremo che $x_k$ è una _successione di Cauchy_ se
  $ forall epsilon > 0: exists n in NN: forall j > n: forall k > n: d(x_j, x_k) < epsilon. $
]

La proprietà che definisce le successioni di Cauchy si potrebbe anche scrivere così:
$ lim_(k -> +infinity) sup_(j >= k) d(x_j, x_k) = 0. $

#theorem[le successioni convergenti sono di Cauchy][
  Sia $x_k -> x$ una successione convergente in uno spazio metrico $(X,d)$. Allora $x_k$ è di Cauchy.
] <th:se_converge_cauchy>

#proof[
  Per definizione se $x_k -> x$ si ha
  $ forall epsilon > 0: exists n in NN: forall k > n: d(x_k, x) < epsilon. $
  Applicando la disuguaglianza triangolare, per ogni $j,k > n$ si ottiene il risultato desiderato:
  $ d(x_j, x_k) <= d(x_k, x) + d(x, x_j) <= 2 epsilon. $
]

#definition[completezza][
  Uno spazio metrico $(X,d)$ si dice essere _completo_ se ogni successione di Cauchy è convergente.
]

Il prototipo di spazio metrico completo è $RR$, come vedremo nel @th:R-completo.
Un esempio di spazio metrico non completo è $QQ$.
Infatti se prendiamo una successione $q_n in QQ$ con $q_n -> sqrt(2)$ la successione $q_n$ è convergente in $RR$ e quindi è di Cauchy in $RR$. Ma visto che $q_n in QQ$ risulta che $q_n$ è di Cauchy anche in $QQ$ (la condizione di Cauchy è la stessa).
Ma in $QQ$ tale successione non converge in quanto $sqrt(2) not in QQ$.

#definition[spazio di Banach][
  Uno spazio vettoriale normato si dice essere uno _spazio di Banach_ se, come spazio metrico, risulta essere completo.
  Se la norma è euclidea, cioè deriva da un prodotto scalare, lo spazio si dirà _spazio di Hilbert_.
]

#lemma[
  Ogni successione di Cauchy è limitata (più precisamente: se $x_n$ è una successione di Cauchy in uno spazio metrico $X$ allora l'insieme ${x_n : n in NN}$ è un insieme limitato).
] <lm:cauchy_limitata>

#proof[
  Sia $x_k in RR$ una successione di Cauchy.
  Fissato $epsilon > 0$ sappiamo che esiste $N in NN$ per cui per ogni $k,j > N$ si ha $d(x_k, x_j) < epsilon$.
  In particolare per ogni $k > N$ si ha
  $ d(x_k, x_(N+1)) < epsilon. $
  Dunque scelto
  $ R > max {d(x_0, x_1), d(x_0, x_2), dots, d(x_0, x_N), d(x_0, x_(N+1)) + epsilon} $
  si osserva che per ogni $k in NN$ si ha $d(x_0, x_k) < R$ in quanto se $k <= N$ abbiamo scelto appositamente $R$ in modo che sia più grande di $d(x_0, x_k)$ e se $k > N$ allora
  $ d(x_0, x_k) <= d(x_0, x_(N+1)) + d(x_(N+1), x_k) <= d(x_0, x_(N+1)) + epsilon < R. $

  Significa quindi che per ogni $k in NN$ si ha $x_k in B_R (x_0)$ che è la definizione di limitatezza in uno spazio metrico.
]

#lemma[
  Se una successione di Cauchy ha una sottosuccessione convergente, allora l'intera successione è convergente.
] <lm:cauchy_estratta_convergente>

#proof[
  Sia $x_k$ la successione di Cauchy e sia $x_(k_j) -> x$ una sottosuccessione convergente.
  Allora per ogni $epsilon > 0$ esiste $m$ tale che se $k,j > m$ allora $d(x_k, x_j) < epsilon$.
  Visto che $x_(k_j) -> x$ possiamo trovare $j$ tale che $k_j > m$ e tale che $d(x_(k_j), x) < epsilon$. Ma allora
  $ d(x_k, x) <= d(x_k, x_(k_j)) + d(x_(k_j), x) <= 2 epsilon. $
  E questo è vero per ogni $k > m$ da cui risulta verificata la definizione di limite $x_k -> x$.
]

#theorem[completezza di $RR$][
  $RR$ è completo.
] <th:R-completo>

#proof[
  Dobbiamo dimostrare che se $x_k$ è una successione di Cauchy in $RR$ allora $x_k$ converge.
  Per il @lm:cauchy_limitata sappiamo che $x_k$ è limitata.
  Ma allora per il teorema di Bolzano-Weierstrass sappiamo che $x_k$ ha una estratta convergente.
  Grazie al @lm:cauchy_estratta_convergente possiamo quindi concludere che la successione $x_k$ è essa stessa convergente.
]

#corollary[completezza di $RR^n$ e $CC$][
  Gli spazi $RR^n$ e $CC$ (con la usuale distanza euclidea) sono completi.
]

#proof[
  Basta osservare che la convergenza (o la condizione di Cauchy) di una successione in $RR^n$ si ha se e solo se ogni componente della successione è convergente (o di Cauchy) in $RR$.
  Dunque essendo $RR$ completo anche $RR^n$ lo è.
  Come spazio metrico $CC$ è isomorfo ad $RR^2$ dunque anch'esso è completo.
]

#theorem[compattezza e completezza dei chiusi][
  Sia $(X,d)$ uno spazio metrico e sia $A subset X$ un sottoinsieme chiuso in $X$.
  Se $X$ è sequenzialmente compatto allora anche $A$ è compatto, se $X$ è completo allora anche $A$ è completo.
] <th:chiuso_compatto_completo>

#proof[
  Se $X$ è sequenzialmente compatto da ogni successione in $A$ si può estrarre una sottosuccessione convergente ad un punto di $X$.
  Ma siccome $A$ è chiuso il punto sta in $A$ e dunque la sottosuccessione è convergente in $A$.

  Una successione di Cauchy in $A$ è di Cauchy anche in $X$.
  Se $X$ è completo tale successione converge ad un punto di $X$.
  Se $A$ è chiuso tale punto è in $A$ e dunque la successione converge in $A$.
]

#theorem[estendibilità delle funzioni uniformemente continue][
  Sia $f: A subset X -> Y$ una funzione definita su un sottoinsieme $A$ di uno spazio metrico $X$ a valori in uno spazio metrico completo $Y$ (ad esempio $X = RR$ e $Y = RR$). Se $f$ è uniformemente continua allora esiste una unica funzione continua $tilde(f): overline(A) -> Y$ tale che per ogni $x in A$ si ha $tilde(f)(x) = f(x)$.
  Inoltre $tilde(f)$ è anch'essa uniformemente continua.
] <th:estensione_uniformemente_continua>

#proof[
  La prima osservazione è che se una funzione $f$ è uniformemente continua allora $f$ manda successioni di Cauchy in successioni di Cauchy.
  Infatti se $f$ è uniformemente continua si ha
  $ forall epsilon > 0: exists delta > 0: d(x,y) < delta => d(f(x), f(y)) < epsilon $
  e se $a_n$ è di Cauchy si ha
  $ exists N in NN: k,j > N => d(a_k, a_j) < delta $
  dunque mettendo insieme le due proprietà si ottiene la condizione di Cauchy per $f(a_k)$:
  $ forall epsilon > 0: exists N in NN: k,j > N => d(f(a_k), f(a_j)) < epsilon. $

  Preso un punto $x in overline(A)$ esiste certamente $a_n in A$ con $a_n -> x$.
  Vogliamo dimostrare che $f(a_n)$ ha limite in $Y$ e che tale limite non dipende dalla successione $a_n$ scelta. Se $a_n -> a$ allora $a_n$ è di Cauchy in $X$ (@th:se_converge_cauchy).
  Per quanto detto prima possiamo affermare che anche $f(a_n)$ è di Cauchy e quindi converge in $Y$, in quanto $Y$ è completo per ipotesi.
  Inoltre il $lim f(a_n)$ non dipende dalla successione scelta perché se $b_n -> x$ fosse un'altra successione potremmo costruire una successione $c_n$ che alterna i punti di $a_n$ e $b_n$ (ponendo, ad esempio, $c_(2n) = a_n$ e $c_(2n+1) = b_n$). Anche $c_n -> x$ ed è di Cauchy, dunque $f(c_n)$ converge.
  Ma $f(a_n)$ e $f(b_n)$ sono sotto-successioni di $f(c_n)$ e dunque convergono allo stesso limite.
  Abbiamo quindi dimostrato che per ogni $x in overline(A)$ esiste $ell in Y$ tale che se $a_n -> x$, $a_n in A$ allora $f(a_n) -> ell$. Possiamo quindi definire $tilde(f)(x) = ell$. Se esiste una estensione continua di $f$ non può che essere definita in questo modo, in quanto le funzioni continue mandano successioni convergenti in successioni convergenti.

  D'altra parte possiamo dimostrare che $tilde(f)$ è una funzione uniformemente continua.
  Infatti per ogni $epsilon > 0$ possiamo scegliere $delta > 0$ dato dall'uniforme continuità di $f$: dati $x,y in overline(A)$ con $d(x,y) < delta / 3$ esisteranno $x_n, y_n in A$ con $x_n -> x$, $y_n -> y$. Si potrà quindi trovare $n$ sufficientemente grande in modo che $d(x_n, x) < delta / 3$, $d(y_n, y) < delta / 3$, $d(f(x_n), tilde(f)(x)) < epsilon$, $d(f(y_n), tilde(f)(y)) < epsilon$.
  Si avrà allora $d(x_n, y_n) < d(x_n, x) + d(x, y) + d(y, y_n) < delta$, dunque $d(f(x_n), f(y_n)) < epsilon$ e in conclusione
  $ d(f(x), f(y)) <= d(f(x), f(x_n)) + d(f(x_n), f(y_n)) + d(f(y_n), f(y)) <= 3 epsilon. $
  Abbiamo quindi dimostrato l'uniforme continuità di $tilde(f)$ con $3 epsilon$ al posto di $epsilon$ e $delta / 3$ al posto di $delta$.
]

#definition[lipschitz][
  Sia $f: X -> Y$ una funzione definita tra due spazi metrici.
  Dato $L >= 0$ diremo che $f$ è $L$-lipschitziana se per ogni $x,y in X$ si ha
  $ d(f(x), f(y)) <= L dot d(x,y). $
  Diremo che $f$ è lipschitziana se esiste $L >= 0$ tale che $f$ sia $L$-lipschitziana.
]

#theorem[
  Se $f: X -> Y$ è lipschitziana allora $f$ è sequenzialmente continua, cioè
  $ x_k -> x => f(x_k) -> f(x). $
] <th:lipschitz_uniformemente_continua>

#proof[
  Se $x_k -> x$ significa che $d(x_k, x) -> 0$, quindi
  $ d(f(x_k), f(x)) <= L dot d(x_k, x) -> 0. $
]

Osserviamo che la distanza $d(x,y)$ di uno spazio metrico $X$ risulta sempre essere una funzione $1$-lipschitziana rispetto ad ognuna delle due variabili $x$ e $y$. Infatti per la disuguaglianza triangolare inversa si ha
$ abs(d(x_1, y) - d(x_2, y)) <= d(x_1, x_2). $
Di conseguenza la norma di uno spazio normato è anch'essa $1$-lipschitziana.
In particolare la distanza e la norma risultano essere funzioni continue.