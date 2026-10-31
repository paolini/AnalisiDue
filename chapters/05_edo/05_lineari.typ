#import "../../lib.typ": *

= Equazioni lineari di ordine $n$ <sec:edo_lineari>

Le equazioni differenziali ordinarie lineari di ordine $n$ in forma normale possono essere scritte nella forma:
$ u^((n))(x) + a_(n-1)(x) dot u^((n-1))(x) + dots + a_1(x) dot u'(x) + a_0(x) dot u(x) = b(x) $ <eq:edo_lineare_ordine_n>
con $a_k: A -> RR$, $b: A -> RR$ funzioni continue definite su uno stesso dominio $A subset RR$.
Nel caso $b(x) = 0$ l'equazione si dice essere _omogenea_ e si può scrivere come:
$ u^((n))(x) + a_(n-1)(x) dot u^((n-1))(x) + dots + a_1(x) dot u'(x) + a_0(x) dot u(x) = 0. $ <eq:edo_lineare_omogenea_ordine_n>
In generale l'equazione @eq:edo_lineare_ordine_n viene chiamata _equazione non omogenea_ e la corrispondente equazione @eq:edo_lineare_omogenea_ordine_n viene chiamata _equazione omogenea associata_.

#theorem[struttura delle soluzioni di una equazione lineare][
  Siano $a_k in C^0(I)$ con $I subset RR$ un intervallo aperto.

  + L'insieme $V$ delle soluzioni dell'equazione lineare omogenea @eq:edo_lineare_omogenea_ordine_n è uno spazio vettoriale di $C^n(I)$ di dimensione $n$.
    Inoltre, fissato un punto qualunque $x_0 in I$ l'operatore $J: V -> RR^n$ (chiamato _jet_) definito da
    $ J[u] = (u(x_0), u'(x_0), u''(x_0), dots, u^((n-1))(x_0)) $ <eq:jet>
    è un operatore lineare bigettivo (cioè un isomorfismo di spazi vettoriali).

  + L'insieme delle soluzioni dell'equazione non omogenea @eq:edo_lineare_ordine_n è un sottospazio affine di $C^n(A)$ di dimensione $n$, parallelo al sottospazio delle soluzioni dell'equazione omogenea associata @eq:edo_lineare_omogenea_ordine_n.
    In particolare se $u_*$ è una soluzione particolare dell'equazione non omogenea @eq:edo_lineare_ordine_n ogni altra soluzione $u$ di @eq:edo_lineare_ordine_n si scrive nella forma
    $ u = u_* + v $
    con $v$ soluzione dell'equazione omogenea associata.
] <th:edo_lineare_ordine_n>

#proof[
  Innanzitutto il teorema @th:edo_esistenza_globale di esistenza globale garantisce che le soluzioni delle equazioni @eq:edo_lineare_ordine_n e @eq:edo_lineare_omogenea_ordine_n esistono e sono funzioni in $C^n(I)$.

  Possiamo riscrivere l'equazione @eq:edo_lineare_ordine_n nella forma
  $ L[u] = b $
  (usiamo le parentesi quadre per delimitare l'argomento quando si tratta di una applicazione lineare) con
  $ L[u] = u^((n)) + sum_(k=0)^(n-1) a_k u^((k)) $

  L'equazione omogenea @eq:edo_lineare_omogenea_ordine_n risulta quindi essere
  $ L[u] = 0. $
  Si osservi che $L: C^n(I) -> C^0(I)$ è un operatore lineare in quanto la somma, la derivata e la moltiplicazione per una funzione sono operatori lineari sullo spazio vettoriale delle funzioni.
  Dunque l'insieme $V$ delle soluzioni dell'equazione omogenea non è altro che $op("ker") L$ che notoriamente è uno spazio vettoriale visto che se $L[u]=0$ e $L[v]=0$ allora anche $L[lambda u + mu v] = lambda L[u] + mu L[v] = 0$.

  Possiamo ora determinare la dimensione di tale spazio, mettendo in corrispondenza le soluzioni dell'equazione con un loro dato iniziale, tramite l'applicazione $J[u]$ definita da @eq:jet.
  Chiaramente $J$ è lineare perché l'operatore derivata e la valutazione in un punto sono operatori lineari. Osserviamo che $J$ è suriettivo perché dato un qualunque $arrow(y) in RR^n$ per il teorema @th:cauchy_lipschitz_ordine_n di esistenza (globale) di soluzioni per il problema di Cauchy di ordine $n$ sappiamo esistere una soluzione $u in V$ tale che $J[u] = arrow(y)$. Ma $J$ è anche iniettivo perché se $u,v in V$ sono due soluzioni con $J[u]=J[v]$ significa che $u$ e $v$ verificano lo stesso problema di Cauchy.
  Per l'unicità della soluzione risulta quindi $u=v$.
  Abbiamo quindi mostrato che $J: V -> RR^n$ è un isomorfismo di spazi vettoriali, quindi $dim V = n$.

  Per quanto riguarda l'equazione non omogenea sia
  $ W = {v in C^n(A) : L[v] = b} $
  l'insieme di tutte le soluzioni.
  Se consideriamo una soluzione particolare $v_0 in W$ e se $v in W$ è una qualunque altra soluzione, si osserva che
  $ L[v - v_0] = L[v] - L[v_0] = b - b = 0. $
  Significa che $u = v - v_0$ è soluzione dell'equazione omogenea associata: $u in V = op("ker") L$.
  Dunque ogni soluzione $v$ dell'equazione non omogenea si può scrivere nella forma $v = v_0 + u$ con $v_0$ soluzione particolare della non omogenea e $u$ soluzione generale dell'equazione omogenea associata ovvero
  $ W = v_0 + V. $
]

#theorem[maggiore regolarità delle soluzioni][
  Se $u(x)$ è una soluzione dell'equazione differenziale lineare @eq:edo_lineare_ordine_n e se i coefficienti $a_1, dots, a_(n-1), b$ sono funzioni di classe $C^m$ per un certo $m in NN$ allora la soluzione è di classe $C^(m+n)$. In particolare se i coefficienti sono di classe $C^infinity$ le soluzioni sono anch'esse di classe $C^infinity$.
] <th:maggiore_regolarita>

#proof[
  Se $u$ è soluzione di @eq:edo_lineare_ordine_n per definizione sappiamo che $u$ è derivabile $n$ volte nell'intervallo $I$ su cui è definita.
  Se scriviamo l'equazione in forma normale:
  $ u^((n))(x) = b(x) - sum_(k=0)^(n-1) a_k (x) u^((k))(x) $
  essendo $a_k in C^0$ sappiamo che $u^((n))$ è continua dunque $u$ è di classe $C^n$.
  Supponiamo ora che sia $u in C^j$ per qualche $j >= n$.
  I coefficienti dell'equazione sono di classe $C^m$ e vengono moltiplicati per le derivate di $u$ che sono almeno di classe $C^(j-n+1)$.
  Se $j-n+1 <= m$ allora il lato destro della precedente equazione è di classe $j-n+1$.
  Dunque $u^((n)) in C^(j-n+1)$ da cui $u in C^(j+1)$.
  Un passo alla volta è quindi possibile incrementare la regolarità di $u in C^j$ finché $j-n+1 <= m$ cioè finché $j <= m+n-1$. A quel punto otteniamo $u in C^(j+1) = C^(m+n)$.

  Se i coefficienti sono di classe $C^infinity$ il procedimento non termina mai e si ottiene dunque che anche $u$ è di classe $C^infinity$.
]
