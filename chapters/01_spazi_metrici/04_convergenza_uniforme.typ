#import "../../lib.typ": *

= Convergenza uniforme

#definition[Convergenza uniforme][
  Sia $A$ un insieme non vuoto e $f: A -> RR$. Definiamo la _norma uniforme_ (o norma del $sup$) di $f$ come
  $ norm(f)_oo = sup_(x in A) |f(x)| $

  Se anche $g: A -> RR$ definiamo la _distanza uniforme_ tra $f$ e $g$ come
  $ d_oo (f, g) = sup_(x in A) |f(x) - g(x)|. $

  Se $f_k$ è una successione di funzioni e $f$ è una funzione, diremo che $f_k$ _converge uniformemente_ a $f$ e scriveremo
  $ f_k => f $
  se $d_oo (f_k, f) -> 0$.
]

#example[
  La successione
  $ f_k (x) = sqrt(x^2 + 1/k) $
  converge uniformemente (su tutto $RR$) alla funzione $f(x) = |x|$. Infatti posto $g_k (x) = f_k (x) - f(x)$, la funzione $g_k$ risulta essere derivabile per $x != 0$ e per $x > 0$ si ha
  $ g_k '(x) = x / sqrt(x^2 + 1/k) - 1 < 0. $
  Dunque la funzione $g_k$ è decrescente su $[0, +oo)$. Per simmetria (è una funzione pari) è crescente su $(-oo, 0]$. Risulta quindi che il massimo di $g_k$ è in $x = 0$. Chiaramente $g_k >= 0$ quindi si ha:
  $ norm(f_k - f)_oo = sup_(x in RR) g_k (x) = g_k (0) = 1 / sqrt(k) -> 0. $
  Dunque $f_k => f$.
] <ex:466533>

Osserviamo che in generale $norm(f)_oo$ e $d_oo (f, g)$ possono assumere il valore $+oo$ (ad esempio se $A = RR$, $f(x) = x$ e $g(x) = 0$) e quindi non è detto che siano effettivamente una norma e una distanza.

#theorem[Proprietà della norma uniforme][
  La norma uniforme soddisfa tutte le proprietà di una norma (@def:norma), salvo il fatto che può assumere valori in $[0, +oo]$ invece che in $[0, +oo)$.
]

#proof[
  Chiaramente la norma uniforme non assume valori negativi in quanto estremo superiore di un insieme (non vuoto) di numeri reali non negativi. Inoltre se $norm(f)_oo = 0$ significa che $|f(x)| = 0$ per ogni $x$ e dunque $f = 0$ (proprietà di separazione).

  L'omogeneità segue dall'omogeneità del valore assoluto, in quanto si ha
  $ sup_(x in A) |(lambda dot f)(x)|
    = sup_(x in A) |lambda dot f(x)|
    = sup_(x in A) |lambda| dot |f(x)|
    = |lambda| dot sup_(x in A) |f(x)|. $

  La disuguaglianza triangolare segue dalla disuguaglianza triangolare del valore assoluto, che viene preservata facendone l'estremo superiore:
  $ sup_(x in A) |f(x) + g(x)|
    <= sup_(x in A) (|f(x)| + |g(x)|)
    <= sup_(x in A) |f(x)| + sup_(x in A) |g(x)|. $
]

#theorem[Completezza delle funzioni limitate][
  Sia $A$ un insieme. Lo spazio vettoriale delle funzioni limitate $f: A -> RR$ (cioè delle funzioni con norma uniforme finita)
  $ cal(B)(A) = { f in RR^A : norm(f)_oo < +oo } $
  dotato della norma uniforme $norm(dot)_oo$ risulta essere uno spazio di Banach (ovvero uno spazio vettoriale normato e completo). Su tale spazio di Banach la distanza indotta dalla norma è la distanza uniforme $d_oo$ e la convergenza indotta dalla distanza è la convergenza uniforme.
] <th:limitate_completo>

#proof[
  Per definizione risulta verificato che la norma uniforme $norm(dot)_oo$ assume valori finiti su $cal(B)(A)$. Dunque, in base al teorema precedente, $norm(dot)_oo$ è effettivamente una norma e $cal(B)(A)$ risulta quindi essere uno spazio normato. Dimostriamo ora che esso è completo, cioè che le successioni di Cauchy convergono.

  Sia $f_k$ una successione di Cauchy in $cal(B)(A)$. Allora per ogni $x in A$ risulta che $f_k (x)$ è una successione di Cauchy in $RR$ in quanto si ha (per definizione di $sup$)
  $ |f_k (x) - f_j (x)| <= norm(f_k - f_j)_oo $
  e quindi se $norm(f_k - f_j)_oo < epsilon$ a maggior ragione per $x in A$ fissato si ha $|f_k (x) - f_j (x)| < epsilon$.

  Dunque per ogni $x in A$ la successione numerica $f_k (x)$ converge in quanto $RR$ è completo. Posto $f(x) = lim f_k (x)$ abbiamo dunque trovato un candidato limite della successione. Dovremo ora mostrare che $f in cal(B)(A)$ e che $f_k$ converge uniformemente a $f$. Per ogni $epsilon > 0$ per la condizione di Cauchy dovrà esistere $N in NN$ tale che se $k, j > N$ allora
  $ d_oo (f_k, f_j) < epsilon. $
  Ma allora per ogni $x in A$, per ogni $k > N$ e per ogni $j > N$ si avrà:
  $ |f_k (x) - f(x)| <= |f_k (x) - f_j (x)| + |f_j (x) - f(x)| < epsilon + |f_j (x) - f(x)|. $
  Visto che per ogni $x$ si ha $f_j (x) -> f(x)$, per ogni $x$ esiste un $j$ tale che $|f_j (x) - f(x)| < epsilon$ e quindi possiamo concludere che
  $ |f_k (x) - f(x)| < 2 epsilon. $
  Facendo il $sup$ per $x in A$ si ottiene dunque
  $ norm(f_k - f)_oo <= 2 epsilon. $
  Abbiamo quindi verificato la definizione di limite $norm(f_k - f)_oo -> 0$. In particolare $norm(f)_oo < +oo$ in quanto vale la disuguaglianza triangolare
  $ norm(f)_oo <= norm(f - f_k)_oo + norm(f_k)_oo < +oo $
  essendo $norm(f - f_k)_oo -> 0$ e $norm(f_k)_oo < +oo$.
]

#definition[Convergenza puntuale][
  Sia $f_k: A -> RR$ una successione di funzioni e sia $f: A -> RR$ una funzione. Se per ogni $x in A$ si ha $f_k (x) -> f(x)$ diremo che la successione $f_k$ _converge puntualmente_ ad $f$.
]

#theorem[Convergenza uniforme implica convergenza puntuale][
  Sia $f_k: A -> RR$ una successione di funzioni. Se $f_k$ converge uniformemente ad una funzione $f$ allora $f_k$ converge puntualmente ad $f$.
]

#proof[
  È sufficiente osservare che per ogni $x in A$ si ha
  $ |f_k (x) - f(x)| <= sup_(y in A) |f_k (y) - f(y)| = norm(f_k - f)_oo -> 0. $
]

#example[Successione che converge puntualmente ma non uniformemente][
  Sia $f_k: [0, 1] -> RR$ la successione di funzioni definita da $f_k (x) = x^k$. Se $x in [0, 1)$ si ha $x^k -> 0$ mentre se $x = 1$ si ha $x^k -> 1$. Dunque la successione $f_k$ converge puntualmente alla funzione
  $ f(x) = cases(
    0 &"se " x in [0, 1),
    1 &"se " x = 1,
  ) $
  Osserviamo però che
  $ d_oo (f_k, f) = sup_(x in [0, 1]) |f_k (x) - f(x)| >= lim_(x -> 1^-) |f_k (x) - f(x)| = 1, $
  dunque non ci può essere convergenza uniforme di $f_k$ verso $f$.
] <ex:puntuale_non_uniforme>

È facile convincersi che la successione $f_k$ dell'esempio precedente, oltre a non convergere uniformemente non ammette nessuna estratta convergente uniformemente. Perciò tale successione non può essere contenuta in nessun compatto di $C^0([0, 1])$. In particolare il disco unitario
$ D = { f in C^0([0, 1]) : norm(f)_oo <= 1 } $
risulta essere un insieme chiuso e limitato che però non è compatto.

#theorem[Continuità del limite uniforme][
  Sia $X$ uno spazio metrico e siano $f_k: X -> RR$ funzioni continue che convergono uniformemente ad una funzione $f: X -> RR$. Allora anche $f$ è continua.
]

#proof[
  Fissato $x_0 in X$ basta dimostrare che per ogni $epsilon > 0$ esiste $delta > 0$ tale che se $d(x, x_0) < delta$ allora $|f(x) - f(x_0)| < 3 epsilon$.

  Per definizione di convergenza uniforme dato $epsilon > 0$ esiste un $N in NN$ (in realtà ne esistono infiniti) per cui $d_oo (f_N, f) < epsilon$. Per la continuità di $f_N$ in corrispondenza dello stesso $epsilon$ esiste $delta > 0$ tale che se $d(x, x_0) < delta$ allora $|f_N (x) - f_N (x_0)| < epsilon$. Ma allora se $d(x, x_0) < delta$ si ha
  $ |f(x) - f(x_0)|
    &<= |f(x) - f_N (x)| + |f_N (x) - f_N (x_0)| + |f_N (x_0) - f(x_0)| \
    &<= norm(f - f_N)_oo + epsilon + norm(f - f_N)_oo \
    &<= 3 epsilon. $
]

#theorem[Completezza di $C^0([a,b])$][
  Lo spazio $C^0([a,b])$ delle funzioni continue definite su un intervallo chiuso e limitato, dotato della norma uniforme $norm(dot)_oo$ risulta essere uno spazio di Banach (ovvero uno spazio vettoriale normato e completo).
] <th:C0_completo>

#proof[
  Per il teorema di Weierstrass ogni funzione continua definita sul compatto $[a,b]$ è limitata. Dunque $C^0([a,b])$ è un sottospazio vettoriale di $cal(B)([a,b])$. Inoltre il teorema precedente (continuità del limite) ci dice che $C^0([a,b])$ è un sottospazio chiuso di $cal(B)([a,b])$. Ma $cal(B)([a,b])$ è completo e quindi anche $C^0([a,b])$ essendo chiuso in $cal(B)([a,b])$ è completo.
]

La norma uniforme è la norma naturale su $C^0([a,b])$ in quanto lo rende uno spazio completo. Per questo motivo la norma uniforme sulle funzioni continue viene anche chiamata _norma $C^0$_ e si può denotare nel modo seguente:
$ norm(f)_(C^0) = norm(f)_(C^0([a,b])) = norm(f)_oo quad "per " f in C^0([a,b]). $

= Ascoli-Arzelà

#theorem[Ascoli-Arzelà astratto][
  Siano $X$ e $Y$ spazi metrici compatti e sia $cal(F) subset C^0(X,Y)$. Allora $cal(F)$ è totalmente limitato (rispetto alla distanza uniforme su $C^0(X,Y)$) se e solo se $cal(F)$ è equicontinuo, cioè se vale:
  $ forall epsilon > 0 thin exists delta > 0 : forall f in cal(F) thin forall x, x' in X : d(x, x') < delta => d(f(x), f(x')) < epsilon. $ <eq:equicontinuo>
]

#proof[
  _Prima parte:_ mostriamo che @eq:equicontinuo è una condizione necessaria affinché $cal(F)$ sia totalmente limitato. Fissiamo $epsilon > 0$ e consideriamo $cal(G) subset cal(F)$ un $epsilon$-reticolo di $cal(F)$ cioè un sottoinsieme finito tale che per ogni $f in cal(F)$ esiste $g in cal(G)$ con $d_oo (f(x), g(x)) < epsilon$. Ogni $g in cal(G)$ è uniformemente continua per il @th:HeineCantor di Heine-Cantor, dunque per ogni $g in cal(G)$ esiste $delta > 0$ per cui $d(x, x') < delta => d(g(x), g(x')) < epsilon$. Visto che $cal(G)$ è finito possiamo prendere il minimo di questi $delta$ e ottenere un unico $delta$ che va bene per tutti i $g in cal(G)$ (cioè $cal(G)$ è equicontinuo). Ma allora presa qualunque $f in cal(F)$, presa $g in cal(G)$ con $d_oo (f(x), g(x)) < epsilon$, e presi $x, x' in X$ con $d(x, x') < delta$ si ha:
  $ d(f(x), f(x')) <= d(f(x), g(x)) + d(g(x), g(x')) + d(g(x'), f(x')) < 3 epsilon. $
  significa che anche $cal(F)$ è equicontinuo, come volevamo dimostrare.

  _Seconda parte:_ mostriamo che @eq:equicontinuo è una condizione sufficiente affinché $cal(F)$ sia totalmente limitato. Sia $epsilon > 0$ fissato. Per equicontinuità esiste $delta > 0$ tale che $d(x, x') < delta => d(f(x), f(x')) < epsilon$ per ogni $f in cal(F)$. Dato che $X$ è compatto esso è anche totalmente limitato, dunque esiste un $delta$-reticolo finito $X_delta subset X$. Anche $Y$ è totalmente limitato dunque esiste un $epsilon$-reticolo finito $Y_epsilon subset Y$. Dunque per ogni funzione $f in cal(F)$ esiste una funzione $g: X_delta -> Y_epsilon$ tale che $d(f(x), g(x)) < epsilon$ per ogni $x in X_delta$. Osserviamo che le funzioni $X_delta -> Y_epsilon$ sono in numero finito, significa che posso trovare un sottoinsieme finito $cal(G) subset cal(F)$ tale che per ogni $f in cal(F)$ esiste $g in cal(G)$ per cui $d(f(x), g(x)) < 2 epsilon$ per ogni $x in X_delta$. Vogliamo ora dimostrare che $cal(G)$ è un $4 epsilon$-reticolo di $cal(F)$ sfruttando il fatto che l'equicontinuità di $cal(F)$ permette di stimare la distanza delle funzioni al di fuori dei punti del reticolo $X_delta$. Sia $f in cal(F)$ e sia $g in cal(G)$ tale che $d(f(x), g(x)) < 2 epsilon$ per ogni $x in X_delta$. Siano $x, x' in X$ due punti qualsiasi e siano $x_delta, x'_delta in X_delta$ due punti del reticolo tali che $d(x, x_delta) < delta$ e $d(x', x'_delta) < delta$. Allora per l'equicontinuità di $cal(F)$ e di $cal(G)$ si ha:
  $ d(f(x), g(x)) <= d(f(x), f(x_delta)) + d(f(x_delta), g(x_delta)) + d(g(x_delta), g(x)) < epsilon + 2 epsilon + epsilon = 4 epsilon. $
]

#corollary[Ascoli-Arzelà in pratica][
  Sia $f_k: [a,b] -> RR$ una successione di funzioni tale che:
  + le funzioni $f_k$ sono uniformemente limitate, cioè esiste $M > 0$ tale che per ogni $k$ e per ogni $x in [a,b]$ si ha
    $ |f_k (x)| <= M; $
  + le funzioni $f_k$ sono equicontinue, cioè per ogni $epsilon > 0$ esiste $delta > 0$ tale che per ogni $k$ e per ogni $x_1, x_2 in [a,b]$ si ha
    $ forall epsilon > 0 thin exists delta > 0 : forall k in NN, thin forall x, x' in [a,b] : |x - x'| < delta => |f_k (x) - f_k (x')| < epsilon. $
  Allora esiste una sottosuccessione $f_(k_j)$ che converge uniformemente ad una funzione continua $f: [a,b] -> RR$.
]

#proof[
  Si applica il teorema precedente con $X = [a,b]$, $Y = [-M, M]$, $cal(F) = {f_k : k in NN}$. La totale limitatezza di $cal(F)$ implica che la chiusura di $cal(F)$ è compatta e dunque sequenzialmente compatta. Significa che è possibile estrarre una sottosuccessione $f_(k_j)$ che converge uniformemente ad una funzione continua $f$.
]