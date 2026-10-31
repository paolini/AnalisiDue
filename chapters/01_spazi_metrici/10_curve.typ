#import "../../lib.typ": *

= Curve e lunghezza

Sia $X$ uno spazio metrico. Una funzione $u: [a,b] -> X$ viene chiamata _curva_.

#definition[lunghezza di una curva][
  Diremo che $P$ è una _suddivisione_ di $[a,b]$ se $P$ è un sottoinsieme finito di $[a,b]$ con $a,b in P$.
  Dunque $P = {t_0, t_1, dots, t_N}$ con $a = t_0 < t_1 < dots < t_N = b$.
  Ad ogni suddivisione $P$ di $[a,b]$ possiamo associare la lunghezza della _poligonale_ $u(t_0), u(t_1), dots, u(t_N)$ cioè
  $ ell_P (u) := sum_(k=1)^N d(u(t_(k-1)), u(t_k)). $
  Definiamo la _lunghezza_ della curva $u$ come
  $ ell(u) := sup {ell_P (u) : P text(" suddivisione di ") [a,b]}. $
  Spesso sarà utile considerare la funzione $u$ ristretta ad un sottointervallo $[alpha,beta] subset [a,b]$.
  Useremo la notazione
  $ ell_alpha^beta (u) := ell(u |_ [alpha,beta]) $
  cosicché $ell(u) = ell_a^b (u)$.

  In generale $ell(u) in [0, +infinity]$.
  Se $ell(u) < +infinity$, diremo che la curva è _rettificabile_ ovvero che ha _lunghezza finita_.
]

#theorem[proprietà della lunghezza][
  Sia $arrow(u): [a,b] -> X$ una curva in uno spazio metrico $(X,d)$.
  Allora valgono le seguenti proprietà.
  + (disuguaglianza triangolare) $ell(u) >= d(u(a), u(b))$;
  + (additività) per ogni $c in [a,b]$ si ha $ell_a^b (u) = ell_a^c (u) + ell_c^b (u)$.
  + (semicontinuità) se $u_n: [a,b] -> X$ converge puntualmente a $u$ (cioè $u_n (t) -> u(t)$ per ogni $t in [a,b]$) allora
    $ ell(u) <= liminf_(n -> infinity) ell(u_n). $
]

#proof[
  La prima proprietà (disuguaglianza triangolare) è ovvia considerando la suddivisione minima $P = {a,b}$ per cui $ell(u) >= ell_P (u) = d(u(a), u(b))$.

  Dimostriamo la seconda proprietà (additività).
  Data una suddivisione $P$ di $[a,c]$ e una suddivisione $Q$ di $[c,b]$, la loro unione $P union Q$ è una suddivisione di $[a,b]$. Dunque
  $ ell_a^b (u) >= ell_(P union Q)(u) = ell_P (u) + ell_Q (u) $
  da cui, per l'arbitrarietà di $P$ e $Q$ si ottiene la disuguaglianza $ell_a^b (u) >= ell_a^c (u) + ell_c^b (u)$.
  Viceversa se $P$ è una suddivisione di $[a,b]$ possiamo considerare le due suddivisioni $P_1 = P inter [a,c] union {c}$ e $P_2 = P inter [c,b] union {c}$ e ottenere
  $ ell_P (u) <= ell_(P union {c}) = ell_(P_1)(u) + ell_(P_2)(u) <= ell_a^c (u) + ell_c^b (u). $
  Dall'arbitrarietà di $P$ si ottiene la disuguaglianza opposta $ell_a^b (u) <= ell_a^c (u) + ell_c^b (u)$.

  Dimostriamo la semicontinuità.
  Fissata una qualunque suddivisione $P={t_0, dots, t_N}$ per ogni $k=0, dots, N$ si ha $u_n (t_k) -> u(t_k)$ per $n -> +infinity$ e quindi:
  $ ell_P (u) = lim_n ell_P (u_n) = liminf_n ell_P (u_n) <= liminf_n ell(u_n). $
  Dall'arbitrarietà di $P$ si ottiene la tesi.
]

#theorem[formula della lunghezza][
  Sia $arrow(u): [a,b] -> RR^n$ una curva di classe $C^1$.
  Allora la curva è rettificabile e la sua lunghezza è data da
  $ ell(arrow(u)) = integral_a^b |arrow(u)'(t)| thin d t. $
]

#proof[
  Sia $a = t_0 < t_1 < dots < t_N = b$ una suddivisione $P$ di $[a,b]$.
  Osserviamo che
  $ arrow(u)(t_(k+1)) - arrow(u)(t_k) = integral_(t_k)^(t_(k+1)) arrow(u)'(t) thin d t $
  da cui
  $ |arrow(u)(t_(k+1)) - arrow(u)(t_k)| <= integral_(t_k)^(t_(k+1)) |arrow(u)'(t)| thin d t $
  e quindi
  $ ell_P (arrow(u)) <= integral_a^b |arrow(u)'(t)| thin d t. $
  Dall'arbitrarietà di $P$ si ottiene la prima disuguaglianza $ell(arrow(u)) <= integral_a^b |arrow(u)'|$.

  D'altra parte $arrow(u)'$ è continua in $[a,b]$ dunque è uniformemente continua.
  Dato $epsilon > 0$ esiste $delta > 0$ tale che
  $ |t-s| < delta => |arrow(u)'(t) - arrow(u)'(s)| < epsilon. $
  Visto che $|arrow(u)'|$ è integrabile (in quanto continua) esiste una suddivisione $a = t_0 < t_1 < dots < t_N = b$ con $t_(k+1) - t_k < delta$ per cui
  $ |integral_a^b |arrow(u)'(t)| thin d t - sum_(k=0)^(N-1) inf_(t in [t_k, t_(k+1)]) |arrow(u)'(t_k)| (t_(k+1) - t_k)| < epsilon. $
  Allora
  $ integral_a^b |arrow(u)'(t)| thin d t
      &<= sum_(k=0)^(N-1) |arrow(u)'(t_k)| (t_(k+1) - t_k) + epsilon \
      &= sum_(k=0)^(N-1) |integral_(t_k)^(t_(k+1)) arrow(u)'(t_k) thin d t| + epsilon \
      &<= sum_(k=0)^(N-1) (integral_(t_k)^(t_(k+1)) |arrow(u)'(t_k) - arrow(u)'(t)| thin d t + |integral_(t_k)^(t_(k+1)) arrow(u)'(t) thin d t|) + epsilon \
      &<= sum_(k=0)^(N-1) (epsilon (t_(k+1) - t_k) + |arrow(u)(t_(k+1)) - arrow(u)(t_k)|) + epsilon \
      &= epsilon + sum_(k=0)^(N-1) |arrow(u)(t_(k+1)) - arrow(u)(t_k)| + epsilon \
      &<= ell(arrow(u)) + 2 epsilon. $
  Dall'arbitrarietà di $epsilon > 0$ si ottiene la disuguaglianza opposta e la tesi.
]

== Riparametrizzazioni

Se $u: [a,b] -> X$ è una curva e $phi: [A,B] -> [a,b]$ è una funzione, possiamo considerare la curva $v: [A,B] -> X$ definita da
$ v(s) = u(phi(s)), quad s in [A,B]. $
Se $u$ è continua e $phi$ è continua e crescente, la curva $v$ rappresenta lo stesso tragitto di $u$ percorso però con una diversa velocità. I punti attraversati sono gli stessi, nello stesso ordine, ma l'istante in cui vengono raggiunti è diverso.
Se $phi: [A,B] -> [a,b]$ è strettamente crescente e continua allora $phi$ è invertibile e si possono mettere in corrispondenza biunivoca i parametri delle due curve $u(t)$ e $v(s)$ ponendo $t=phi(s)$ per cui:
$ v(s) = u(phi(s)) quad text("e") quad u(t) = v(phi^(-1)(t)). $
Risulta però utile considerare anche riparametrizzazioni che non sono strettamente crescenti o che non sono continue.
Ad esempio se $u$ ha dei tratti costanti, ha senso considerare una riparametrizzazione che salta i tratti costanti, senza fermarsi su di essi.
Una tale riparametrizzazione presenterà dei salti, ma il tragitto percorso è in effettivamente lo stesso.
Viceversa può essere utile considerare una riparametrizzazione che si ferma per un certo tempo su un punto: tale riparametrizzazione avrà un tratto costante e quindi non sarà strettamente crescente e non sarà invertibile.

Se una riparametrizzazione non è continua può saltare dei tratti e quindi può dare origine ad una curva di lunghezza inferiore.
Se la riparametrizzazione non è monotona può ripercorrere più volte gli stessi tratti e quindi può dare origine ad una curva di lunghezza superiore. Questo viene formalizzato nel seguente teorema.

#theorem[riparametrizzazione][
  Sia $u: [a,b] -> X$ una curva in uno spazio metrico $X$ e sia $phi: [A,B] -> [a,b]$ una funzione.
  Possiamo considerare la curva $v: [A,B] -> X$ definita da $v = u compose phi$, cioè
  $ v(s) = u(phi(s)), quad s in [A,B]. $

  + Se $phi$ è monotona si ha
    $ ell(v) <= ell(u). $
  + Se $phi: [A,B] -> [a,b]$ è continua e surgettiva si ha
    $ ell(v) >= ell(u). $
  + Se $phi: [A,B] -> [a,b]$ è bigettiva e continua si ha:
    $ ell(u) = ell(v). $
] <th:riparametrizzazione>

#proof[
  Dimostriamo il primo punto, dove si suppone che $phi: [A,B] -> [a,b]$ sia monotona. Per fissare le idee supponiamo $phi$ sia crescente.
  Allora presa una qualunque suddivisione $Q$ di $[A,B]$ si ha che $P = phi(Q) union {a,b}$ è una suddivisione di $[a,b]$.
  Se i punti di $Q$ sono $A = t_0 < t_1 < dots < t_N = B$ i punti di $P$ sono $a <= phi(t_0) <= phi(t_1) <= dots <= phi(t_N) <= b$.
  Osserviamo dunque che alcuni punti consecutivi di questo elenco potrebbero coincidere (se $phi$ non è iniettiva) ma se si ha $phi(t_k) = phi(t_(k+1))$ si ha, ovviamente, $d(u(phi(t_k)), u(phi(t_(k+1)))) = 0$.
  Dunque risulta comunque
  $ ell_Q (v) &= sum_(k=1)^N d(v(t_(k-1)), v(t_k))
      = sum_(k=1)^N d(u(phi(t_(k-1))), u(phi(t_k))) \
      &<= d(u(a), u(t_0)) + sum_(k=1)^N d(u(phi(t_(k-1))), u(phi(t_k))) + d(u(t_N), u(b)) \
      &<= ell_P (u) <= ell(u). $
  Dall'arbitrarietà di $Q$ si ottiene la disuguaglianza $ell(v) <= ell(u)$.

  Vediamo il caso in cui $phi$ è continua e surgettiva.
  In questo caso prendiamo una qualunque suddivisione $P$ di $[a,b]$ formata dai punti $a = t_0 < t_1 < dots < t_N = b$.
  Vogliamo ora dimostrare che esiste una suddivisione $Q$ di $[A,B]$ formata da punti $A = s_0 < s_1 < dots < s_N = B$ tali che $phi(s_k) = t_k$ per ogni $k=0, dots, N$.
  Si procede induttivamente. Prendiamo $s_0 = A$ e osserviamo che $phi(s_0) = t_0$ in quanto per ipotesi $phi(A) = a$.
  Una volta definiti $A = s_0 < s_1 < dots < s_n < B$ tali che $phi(s_k) = t_k$ per $k=0, dots, n$, andiamo a definire $s_(n+1)$ se $n < N$.
  Visto che $phi(s_n) = t_n < t_(n+1) <= b = phi(B)$ per il teorema dei valori intermedi esiste $s_(n+1) in (s_n, B]$ tale che $phi(s_(n+1)) = t_(n+1)$.
  Procedendo in questo modo si ottiene la suddivisione $Q$ di $[A,B]$ con le proprietà richieste e come ultimo punto $s_N$ si può senz'altro scegliere $B$ in quanto $phi(B) = b = t_N$.
  Dunque si ha
  $ ell_P (u) = sum_(k=1)^N d(u(t_(k-1)), u(t_k)) = sum_(k=1)^N d(v(s_(k-1)), v(s_k)) = ell_Q (v) <= ell(v). $
  Dall'arbitrarietà di $P$ si ottiene la disuguaglianza voluta $ell(u) <= ell(v)$.

  Il terzo punto segue immediatamente dai primi due, in quanto una funzione iniettiva e continua definita tra due intervalli è necessariamente monotona (per il teorema dei valori intermedi).
]

#definition[lunghezza d'arco][
  Sia $u: [a,b] -> X$ una curva rettificabile in uno spazio metrico $X$.
  Sia $L = ell(u)$ la lunghezza della curva.
  La _lunghezza d'arco_ di $u$ è la funzione $sigma: [a,b] -> [0,L]$ che mi dà la lunghezza percorsa dalla curva $u$ fino al tempo $t$, formalmente è definita da
  $ sigma(t) := ell_a^t (u). $ <def:lunghezza_arco>
]

Chiaramente la funzione $sigma$ è crescente ma potrebbe non essere strettamente crescente (e quindi non iniettiva) se la curva $u$ ha degli intervalli su cui è costante.

#theorem[continuità della lunghezza d'arco][
  Sia $u: [a,b] -> X$ una curva continua rettificabile, di lunghezza $L$, in uno spazio metrico $X$.
  Allora la funzione lunghezza d'arco $sigma: [a,b] -> [0,L]$, $sigma(t) = ell_a^t (u)$, è continua.
]

#proof[
  Fissato $t_0 in [a,b)$ mostreremo che $sigma(t) -> sigma(t_0)$ per $t -> t_0^+$. Il limite sinistro $t -> t_0^-$ quando $t_0 in (a,b]$ si tratta in maniera del tutto analoga.

  Osserviamo che, per additività della lunghezza, si ha $sigma(t) - sigma(t_0) = ell_a^t (u) - ell_a^(t_0)(u) = ell_(t_0)^t (u)$.
  Dobbiamo dunque dimostrare che $ell_(t_0)^t (u) -> 0$ per $t -> t_0^+$.

  Fissato $epsilon > 0$ dalla rettificabilità di $u$ possiamo trovare dei punti $t_1, t_2, dots, t_N in (t_0,b]$ tali che $t_0 < t_1 < t_2 < dots < t_N$ e
  $ ell_(t_0)^b (u) <= sum_(k=1)^N d(u(t_(k-1)), u(t_k)) + epsilon $
  da cui
  $ ell_(t_0)^b (u)
      &<= d(u(t_0), u(t_1)) + sum_(k=2)^N d(u(t_(k-1)), u(t_k)) + epsilon \
      &<= d(u(t_0), u(t_1)) + ell_(t_1)^b (u) + epsilon $
  ovvero
  $ ell_(t_0)^(t_1)(u) = ell_(t_0)^b (u) - ell_(t_1)^b (u) <= d(u(t_0), u(t_1)) + epsilon. $
  Scelto ora un qualunque punto $t in (t_0, t_1)$ si ha
  $ ell_(t_0)^t (u)
      &= ell_(t_0)^(t_1)(u) - ell_t^(t_1)(u) \
      &<= d(u(t_0), u(t_1)) + epsilon - ell_t^(t_1)(u) \
      &<= d(u(t_0), u(t)) + d(u(t), u(t_1)) + epsilon - ell_t^(t_1)(u) \
      &<= d(u(t_0), u(t)) + epsilon. $
  Essendo $u$ continua si ha $d(u(t_0), u(t)) -> 0$ per $t -> t_0$ e dunque
  $ limsup_(t -> t_0^+) ell_(t_0)^t (u) <= epsilon. $
  Ma questo è vero per ogni $epsilon > 0$, dunque si ottiene, come volevamo dimostrare,
  $ lim_(t -> t_0^+) ell_(t_0)^t (u) = 0. $
]

Grazie al teorema precedente sappiamo che se $u: [a,b] -> X$ è una curva continua e rettificabile, allora la sua lunghezza d'arco $sigma: [a,b] -> [0,L]$ è monotona e continua.
Dunque possiamo definire una _inversa sinistra di $sigma$_ come la funzione $tau: [0,L] -> [a,b]$ definita da
$ tau(s) = min {t : sigma(t)=s}. $
La curva riparametrizzata $tilde(u): [0,L] -> X$ definita da:
$ tilde(u)(s) = u(tau(s)) $
si chiama _riparametrizzazione per lunghezza d'arco_ di $u$.
La funzione $tau$ è strettamente crescente ma può avere delle discontinuità di tipo salto. Se $s_0$ è un punto in cui $tau$ ha un salto denotiamo con $tau(s_0^-)$ e $tau(s_0^+)$ i limiti sinistro e destro di $tau$ in $s_0$.
Posto $I = [tau(s_0^-), tau(s_0^+)]$ l'intervallo di salto di $tau$ in $s_0$, si ha che $sigma$ è costante su $I$ e dunque anche $u$ è costante su $I$.
Dunque $tilde(u)$ risulta essere continua anche nei punti in cui $tau$ non lo è.
Inoltre, per il teorema @th:riparametrizzazione, si ha che
$ ell_0^s (tilde(u)) = s $
cioè, come si dice, $tilde(u)$ è parametrizzata per lunghezza d'arco, in quanto la lunghezza del tratto di curva che va da $0$ a $s$ è proprio $s$.

Siamo riusciti, senza usare le derivate, a definire la curva $tilde(u)$ che percorre lo stesso tragitto di $u$ ma con una velocità costante unitaria.
Se $X = RR^n$ e $u$ è di classe $C^1$ con $u'(t) != 0$ per ogni $t in [a,b]$, allora si ha
$ sigma(t) = integral_a^t |u'(t)| thin d t quad => quad sigma'(t) = |u'(t)| $
e dunque posto $tilde(u)(s) = u(tau(s))$ con $tau(s) = sigma^(-1)(s)$ si ha
$ |tilde(u)'(s)| = |d / (d s) u(sigma^(-1)(s))| = (|u'(tau(s))|) / (sigma'(sigma^(-1)(s))) = (|u'(tau(s))|) / (|u'(tau(s))|) = 1. $

#footnote[
  Sebbene la derivata di una curva a valori in uno spazio metrico $X$ non possa essere definita se $X$ non ha una struttura di spazio vettoriale, le osservazioni precedenti mostrano che può avere senso definire il modulo della derivata, cioè la velocità, di una curva $u: [a,b] -> X$.
  Tale valore viene chiamato _derivata metrica_ di $u$ e si indica con $|u'|$:
  $ |u'|(t_0) := lim_(t -> t_0) d(u(t), u(t_0)) / (t - t_0). $
]

#definition[equivalenza di curve][
  Due curve continue rettificabili $u: [a,b] -> X$ e $v: [A,B] -> X$ si dicono essere _equivalenti_ se le loro riparametrizzazioni per lunghezza d'arco coincidono.
]

Come applicazione del teorema di Ascoli-Arzelà proponiamo il seguente importante risultato.

#theorem[esistenza delle geodetiche][
  Sia $X$ uno spazio metrico completo, proprio (cioè ogni chiuso limitato è compatto), e sia $G(x,y)$ l'insieme di tutte le curve continue di lunghezza finita $u: [0,1] -> X$ tali che $u(0) = x$ e $u(1) = y$.
  Allora, se $G(x,y)$ non è vuoto, il funzionale _lunghezza_ $ell: G -> RR$ ammette un minimo.
]

#proof[
  Sia $L = inf ell(G)$ e sia $u_n in G(x,y)$ una successione minimizzante, cioè tale che $ell(u_n) -> L$.
  Posto $L_n = ell(u_n)$ posso considerare la riparametrizzazione di $u_n$ per lunghezza d'arco.
  Questo mi dà una curva $tilde(u)_n: [0,L_n] -> X$ che è $1$-lipschitziana in quanto $ell(tilde(u)_n, s, t) = t-s$.
  Le curve $v_n: [0,1] -> X$ definite da
  $ v_n(t) = tilde(u)_n (L_n t) $
  saranno invece $L_n$-lipschitziane.
  Per il teorema @th:riparametrizzazione si ha $ell(v_n) = ell(tilde(u)_n) = ell(u_n)$ dunque $v_n in G(x,y)$ e $ell(v_n) = L_n$.
  Poiché $L_n -> L < +infinity$ esiste $M = max L_n < +infinity$ e le curve $v_n$ sono tutte $M$-lipschitziane e dunque sono equicontinue.
  Tutte queste curve sono contenute nella chiusura della palla di centro $x$ e raggio $M$, che è compatta perché abbiamo supposto $X$ proprio.
  Dunque, per il teorema di Ascoli-Arzelà, esiste una estratta $v_(n_k)$ che converge uniformemente ad una curva continua $v: [0,1] -> X$.
  La curva $v$ è $M$-lipschitziana in quanto limite uniforme di $M$-lipschitziane, dunque è di lunghezza finita e appartiene a $G(x,y)$.
  Infine, per la semicontinuità inferiore della lunghezza
  $ ell(v) <= liminf_(k -> infinity) ell(v_(n_k)) = L, $
  dunque $v$ è una curva di lunghezza minima.
]