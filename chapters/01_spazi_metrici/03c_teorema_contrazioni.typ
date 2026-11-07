#import "../../lib.typ": *

== teorema delle contrazioni

#theorem[delle contrazioni o punto fisso di Banach-Caccioppoli][
  Sia $X$ uno spazio metrico completo non vuoto e sia $f: X -> X$ una funzione $L$-lipschitziana con $L < 1$ (diremo che $f$ è una _contrazione_).
  Allora esiste ed è unico un punto $x in X$ tale che $f(x) = x$.
] <th:banach-caccioppoli>

#proof[
  Si consideri un qualunque punto $p in X$ e si definisca la successione $x_k in X$ tramite la definizione ricorsiva
  $ cases(
    x_0 = p,
    x_(k+1) = f(x_k).
  ) $
  Visto che $f$ è $L$-lipschitziana si avrà
  $ d(x_2, x_1) &= d(f(x_1), f(x_0)) <= L dot d(x_1, x_0) \
    d(x_3, x_2) &= d(f(x_2), f(x_1)) <= L dot d(x_2, x_1) <= L^2 dot d(x_1, x_0) \
    d(x_4, x_3) &= d(f(x_3), f(x_2)) <= L dot d(x_3, x_2) <= L^3 dot d(x_1, x_0) \
    & dots.v $
  possiamo quindi dimostrare induttivamente che per ogni $m in NN$ si ha
  $ d(x_(m+1), x_m) <= L^m dot d(x_1, x_0). $
  Ma allora per ogni $k in NN$ e per ogni $j > k$ utilizzando la disuguaglianza triangolare e facendo la somma della progressione geometrica si ha
  $ d(x_k, x_j) <= sum_(m=k)^(j-1) d(x_m, x_(m+1)) <= sum_(m=k)^(j-1) L^m dot d(x_1, x_0) = (L^k - L^j) / (1 - L) d(x_1, x_0). $
  Visto che $L < 1$ se $k -> +infinity$ e $j > k$ questa quantità tende a zero e quindi risulta che $x_k$ è una successione di Cauchy. Essendo per ipotesi $X$ completo sappiamo che la successione converge $x_k -> x$ ad un punto $x in X$.
  Per la continuità di $f$, passando al limite nell'equazione $x_(k+1) = f(x_k)$ si ottiene $x = f(x)$.
  Abbiamo quindi trovato un punto fisso.
  Se $y in X$ fosse un altro punto fisso si avrebbe:
  $ d(x, y) = d(f(x), f(y)) <= L dot d(x, y) $
  che è assurdo se $L < 1$ e $x != y$.
]

// Dalla lezione 5 del 2 ottobre 2026, pp. 3–8.
#example[PageRank][
  Il _world wide web_ è una rete di pagine _web_ collegate da _link_ ipertestuali. Ogni pagina ha un certo numero di link in uscita verso altre pagine.
  L'algoritmo _PageRank_ 
  #note[
    L'algoritmo è stato sviluppato da Larry Page e Sergey Brin nel 1996 come parte del loro progetto di ricerca universitario alla Stanford University. È stato successivamente implementato come parte del motore di ricerca di Google, contribuendo al successo iniziale dell'azienda.
  ]
  assegna un punteggio di rilevanza a ciascuna pagina web in base al numero e alla qualità dei link in entrata.
  Siano $P_1, P_2, dots, P_N$ le pagine web,
  e sia $N_(j k)$ il numero di link in uscita dalla pagina $P_k$ verso la pagina $P_j$.
  La rilevanza di una pagina web è definita ricorsivamente. Fissato $epsilon > 0$ la 
  rilevanza $p_k$ della pagina $P_k$ è data da una quota
  base $epsilon / N$ più una quota proporzionale alla rilevanza media delle pagine che la linkano. 
  Se $N_k = sum_(j=1)^N N_(j k)$ è il numero totale di link in uscita dalla pagina $P_k$,
  la rilevanza $p_j$ della pagina $P_j$ è quindi data da
  $ p_j = (1-epsilon) sum_(k=1)^N N_(j k)/N_k p_k + epsilon/N. $ <eq:page-rank>

  Vogliamo dimostrare che esiste un unico vettore di probabilità $vec(p) = (p_1, dots, p_N)$ che soddisfa @eq:page-rank.
]

Dal punto di vista probabilistico 
stiamo considerando un utente che con probabilità 
$epsilon$ sceglie una pagina a caso fra tutte le $N$ pagine, e con probabilità $1-epsilon$ sceglie invece di seguire un link a caso dalla pagina corrente. 
Vedremo che il parametro $epsilon$ (chiamato _damping factor_) ha un effetto 
stabilizzante sul sistema, garantendo la buona 
definizione del vettore di probabilità stazionario.

#proof(supplement: "Svolgimento")[
  Sia $M_(j k) = N_(j k)/N_k$ la probabilità di passare dalla pagina $P_k$ alla pagina $P_j$ scegliendo un _link_ a caso.
  Si ha
  $ M_(j k) >= 0, quad sum_(j=1)^N M_(j k) = 1
    quad "per ogni" k = 1, dots, N. $

  Consideriamo il simplesso delle distribuzioni di probabilità
  $ X = {vec(p) in RR^N : p_j >= 0 " per ogni " j, quad sum_(j=1)^N p_j = 1} $
  e la funzione
  $ T(vec(x)) = (1-epsilon) M vec(x) + epsilon/N vec(1),
    quad vec(1) = (1, dots, 1) in RR^N. $
  Applicheremo il @th:banach-caccioppoli a $T$ sullo spazio $X$ con la distanza
  indotta dalla norma
  $ norm(vec(x))_1 = sum_(k=1)^N abs(x_k),
    quad d(p,q) = norm(p-q)_1. $

  Verifichiamo anzitutto che $T(X) subset X$. Se $vec(p) in X$, tutte le componenti
  di $T(vec(p))$ sono non negative e si ha
  $ sum_(j=1)^N (T(vec(p)))_j
    = (1-epsilon) sum_(k=1)^N p_k sum_(j=1)^N M_(j k) + epsilon 
    = (1-epsilon) sum_(k=1)^N p_k + epsilon = 1. $

  Per ogni $vec(x) in RR^N$ vale inoltre
  $ norm(M vec(x))_1
    = sum_(j=1)^N abs(sum_(k=1)^N M_(j k) x_k) 
    <= sum_(j=1)^N sum_(k=1)^N M_(j k) abs(x_k) 
    = sum_(k=1)^N (sum_(j=1)^N M_(j k)) abs(x_k)
    = norm(vec(x))_1. $
  Ne segue che per ogni $vec(p),vec(q) in X$
  $ norm(T(vec(p))-T(vec(q)))_1
    = (1-epsilon) norm(M(vec(p)-vec(q)))_1
    <= (1-epsilon) norm(vec(p)-vec(q))_1. $
  Dunque $T$ è una contrazione, con costante $L = 1-epsilon < 1$.

  Chiaramente $X$ è un sottoinsieme chiuso di $RR^N$
  (ricordiamo che la norma $norm(dot)_1$ è equivalente alla norma euclidea)
  e quindi $X$ è completo, essendo $RR^N$ completo.
 
  Per il teorema delle contrazioni esiste dunque un unico $vec(p) in X$ tale che
  $ vec(p) = T(vec(p)) = (1-epsilon) M vec(p) + epsilon/N vec(1). $
 ]
