#import "../../lib.typ": *

== superfici parametrizzate

Abbiamo visto che l'integrale $integral_phi omega$ è invariante per riparametrizzazioni.
Questo ci dà l'idea che $phi$ è una rappresentazione di una $k$-superficie orientata, e che dunque sia possibile definire la superficie $S$ rappresentata da $phi$ come una classe di equivalenza di parametrizzazioni equivalenti.
Portiamo oltre questo ragionamento per permettere di definire una superficie dividendola a pezzi e rappresentando ogni pezzo con una parametrizzazione.
In questo modo sarà sufficiente prendere in considerazione solamente le parametrizzazioni definite sul cubo $[0,1]^k$ con l'idea che superfici più generali possono essere ottenute incollando insieme più pezzi rappresentati da parametrizzazioni definite sui cubi.
Ancora più banalmente questo ci permette di considerare superfici non connesse, come ad esempio l'unione di due circonferenze, rappresentando ogni circonferenza tramite una parametrizzazione definita su un intervallo.
Abbiamo anche visto che permutando l'ordine dei parametri di $phi$ si ottiene un cambio di segno nell'integrale (dato dal segno della permutazione), dunque è naturale pensare che due parametrizzazioni che si corrispondono tramite un cambio di variabile con determinante negativo rappresentano la stessa superficie ma con orientazione opposta.
Sarà quindi possibile sommare e sottrarre superfici rappresentate da parametrizzazioni.

Per avere la massima generalità nel riconoscere quando due superfici rappresentate da parametrizzazioni diverse sono in realtà la stessa superficie, decidiamo di identificare due superfici quando il loro integrale è lo stesso contro ogni forma differenziale $omega$.

#definition[$k$-superfici parametrizzate][
  Sia $A subset RR^k$ un compatto misurabile e sia $phi: A -> RR^n$ una funzione di classe $C^1$.
  Denotiamo con $current(phi): Omega^k (RR^n) -> RR$ il funzionale lineare definito da
  $ current(phi) [omega] := integral_phi omega = integral_A phi^* omega. $

  Un funzionale lineare $S: Omega^k (RR^n) -> RR$ si dice essere una $k$-superficie parametrizzata se esistono $phi_1, dots, phi_M : [0,1]^k -> RR^n$ di classe $C^1$ tali che per ogni $omega in Omega^k (RR^n)$ si ha
  $ S = current(phi_1) + dots + current(phi_M). $

  Scriveremo, in modo più suggestivo,
  $ integral_S omega := S[omega] = sum_(j=1)^M current(phi_j) [omega] = sum_(j=1)^M integral_(phi_j) omega. $

  Se $B subset RR^(n-1)$ è un compatto misurabile e $f: B -> RR$ è una funzione di classe $C^1$, il grafico di $f$ può essere parametrizzato dalla funzione $phi: B -> RR^n$ definita da $phi(x) = (x,f(x))$ e dunque il grafico di $f$ rappresenta una $(n-1)$-superficie parametrizzata: scriveremo $current(f) = current(phi)$ per denotare la superficie rappresentata dal grafico di $f$.

  Se $B subset RR^n$ è un compatto misurabile denotiamo con $current(B) := current(id|_B)$ la $n$-superficie parametrizzata rappresentata dall'identità $id: B -> RR^n$.
  In pratica si ha $integral_(current(B)) f thin d x_1 and dots.c and d x_n = integral_B f$ se $f: B -> RR$ è una funzione di classe $C^0$.
]

Chiaramente se $S$ è una $k$-superficie parametrizzata, allora anche $-S$ (cioè il funzionale $omega |-> -S[omega]$) è una $k$-superficie parametrizzata, in quanto basta invertire le orientazioni delle parametrizzazioni $phi_j$ per ottenere il cambio di segno.
Inoltre è chiaro che la somma di due $k$-superfici parametrizzate è ancora una $k$-superficie parametrizzata.
Dunque è possibile sommare e sottrarre $k$-superfici parametrizzate.
Tramite somma ripetuta è anche possibile moltiplicare una $k$-superficie parametrizzata per un numero intero, si otterrà una superficie _con molteplicità_.

#example[la superficie sferica][
  Ci sono molti modi per rappresentare la superficie di una sfera in $RR^3$.
  Ad esempio possiamo considerare la usuale parametrizzazione data da _latitudine_ e _longitudine_, ovvero $psi: [-pi, pi] times [-pi/2, pi/2] -> RR^3$ definita da
  $ psi(theta, phi.alt) = (sin theta cos phi.alt, sin theta sin phi.alt, cos theta) $
  e definire la sfera $S = current(psi)$.
  Osserviamo che $psi$ è definita su un rettangolo invece che su un quadrato unitario.
  Ma è ovvio che a meno di riparametrizzazione possiamo scrivere $current(psi) = current(psi')$ dove $psi'$ è definita su $[0,1]^2$.

  Anzi, possiamo anche definire la sfera $S$ come somma delle due semisfere ottenute come grafico della funzione $f: B_1 (0) subset RR^2 -> RR$ definita da:
  $ f(x,y) = sqrt(1 - x^2 - y^2). $
  Si potrebbe infatti dimostrare che $S = current(psi) = current(f) - current(-f)$.
]

Vogliamo ora definire il _bordo_ $partial S$ di una $k$-superficie parametrizzata $S$.
Per fare questo è sufficiente capire qual è il bordo di un cubo per poi estendere la definizione a tutte le $k$-superfici parametrizzate.

Il cubo $[0,1]^k$ in $RR^k$ ha $2k$ facce ognuna isometrica a $[0,1]^(k-1)$.
Le facce possono essere identificate tramite il loro versore normale uscente dal cubo.
Infatti ogni punto della frontiera topologica $partial [0,1]^k$ in $RR^k$ è un punto che ha tutte le coordinate in $[0,1]$ ma almeno una coordinata è uguale a $0$ o a $1$.
Se una sola delle coordinate è uguale a $0$ o a $1$ allora il punto non si trova su uno spigolo ed è univocamente definito il versore normale uscente dal cubo in quel punto: si tratta del versore $e_k$ (il $k$-esimo vettore della base canonica) se è la $k$-esima coordinata ad essere uguale a $1$ e del versore $-e_k$ se la $k$-esima coordinata è uguale a $0$.

Dunque se $Q^k = current([0,1]^k)$ è la $k$-superficie in $RR^k$ che rappresenta il cubo $[0,1]^k$ è naturale definire il bordo $partial Q^k$ di $Q^k$ come la somma delle superfici che parametrizzano le $2k$ facce del cubo, con l'opportuno segno per tenere conto dell'orientazione (il segno è positivo se il versore normale uscente è $e_k$ e negativo se è $-e_k$).

Definiamo quindi le funzioni $psi_i^± : [0,1]^(k-1) -> RR^k$ in modo che $±current(psi_i^±)$ sia la faccia del cubo $Q^k$ con versore uscente uguale ad $± e_i$:
$ psi_i^+ (t_1, dots, t_(k-1)) &= (t_1, dots, t_(i-1), 1, t_i, dots, t_(k-1)), \
  psi_i^- (t_1, dots, t_(k-1)) &= (t_1, dots, t_(i-1), 0, t_i, dots, t_(k-1)) $
e poniamo
$ partial Q^k := sum_(i=1)^k (-1)^(i-1) (current(psi_i^+) - current(psi_i^-)). $

Ad esempio per $k=2$ il quadrato $Q^2$ ha quattro lati parametrizzati da $psi_1^+ (t) = (1,t)$ (lato superiore percorso verso destra), $psi_1^- (t) = (0,t)$ (lato inferiore percorso verso destra), $psi_2^+ (t) = (t,1)$ (lato destro percorso verso l'alto) e $psi_2^- (t) = (t,0)$ (lato sinistro percorso verso l'alto).
Notiamo che i segni che abbiamo scelto nella definizione di $partial Q^2$ corrispondono a considerare una orientazione antioraria dei lati del quadrato:
$ partial Q^2 = current(psi_1^+) - current(psi_1^-) - current(psi_2^+) + current(psi_2^-). $

Nel caso $k=3$ il cubo $Q^3$ ha sei facce parametrizzate da $psi_1^+ (t_1,t_2) = (1,t_1,t_2)$, $psi_1^- (t_1,t_2) = (0,t_1,t_2)$, $psi_2^+ (t_1,t_2) = (t_1,1,t_2)$, $psi_2^- (t_1,t_2) = (t_1,0,t_2)$, $psi_3^+ (t_1,t_2) = (t_1,t_2,1)$ e $psi_3^- (t_1,t_2) = (t_1,t_2,0)$.
In questo caso si ha
$ partial Q^3 = current(psi_1^+) - current(psi_1^-) - current(psi_2^+) + current(psi_2^-) + current(psi_3^+) - current(psi_3^-). $
Osserviamo che i segni scelti sulle facce opposte sono opposti.
Inoltre il segno alterno $(-1)^(i-1)$ nella definizione di $partial Q^k$ fa sì che lungo gli spigoli in comune tra due facce adiacenti, le parametrizzazioni abbiano (considerando il segno) orientazione opposta.

In effetti è possibile incollare le sei parametrizzazioni $psi_i^compose$ per ottenere una unica parametrizzazione $psi$ definita sullo sviluppo planare della frontiera del cubo (una croce), in quanto sugli spigoli le diverse parametrizzazioni, tenuto conto del segno, vanno a coincidere:
$ psi(t,s) := cases(
  psi_1^+ (t-1,s-2) &text("se ") (t-1,s-2) in [0,1]^2,
  psi_1^- (t-1,1-s) &text("se ") (t-1,1-s) in [0,1]^2,
  psi_2^+ (3-t,s-2) &text("se ") (3-t,s-2) in [0,1]^2,
  psi_2^- (t,s-2) &text("se ") (t,s-2) in [0,1]^2,
  psi_3^+ (4-s,t-1) &text("se ") (4-s,t-1) in [0,1]^2,
  psi_3^- (s-1,t-1) &text("se ") (s-1,t-1) in [0,1]^2.
) $ <eq:defpsicubo>
Si può verificare che il dominio di $psi$ ha forma di una croce e che $psi$ è continua. Sarà $current(psi) = partial Q^3$ (si veda la @fig:sviluppocubo).

#figure(
  include "../../figure/sviluppo_cubo.typ",
  caption: [
    Il dominio della funzione $psi$ definita nella @eq:defpsicubo è lo sviluppo del bordo del cubo con i sei quadrati che rappresentano le sei facce del cubo.
  ],
) <fig:sviluppocubo>

#definition[bordo di una $k$-superficie parametrizzata][
  Sia $S$ una $k$-superficie parametrizzata, cioè
  $ S = sum_(j=1)^M current(phi_j) $
  con $phi_j : [0,1]^k -> RR^n$ di classe $C^1$.
  Definiamo la $(k-1)$-superficie parametrizzata $partial S$ come:
  $ partial S = sum_(j=1)^M sum_(i=1)^k (-1)^(i-1) (current(phi_j compose psi_i^+) - current(phi_j compose psi_i^-)). $
]

#theorem[teorema della divergenza per il cubo][
  Sia $xi: [0,1]^k -> RR^k$ un campo vettoriale di classe $C^1$.
  Allora si ha
  $ integral_([0,1]^k) op("div") xi = sum_(i=1)^n integral_([0,1]^(k-1)) (xi_i compose psi_i^+ - xi_i compose psi_i^-). $
  Si osservi che $± xi_i compose psi_i^compose$ corrisponde al prodotto scalare $xi dot (± e_i)$ tra il campo vettoriale $xi$ e il vettore $± e_i$ che non è altro che il versore normale alla superficie della faccia parametrizzata da $psi_i^compose$ dunque l'integrale sul lato destro dell'uguaglianza corrisponde all'integrale del flusso di $xi$ attraverso la frontiera del cubo.
]

#proof[
  Banalmente si ha
  $ integral_([0,1]^k) op("div") xi
      &= sum_(i=1)^n integral_0^1 dots integral_0^1 (partial xi_i) / (partial x_i)(x_1, dots, x_k) thin d x_1 dots d x_k \
      &= sum_(i=1)^n integral_([0,1]^(k-1)) (integral_0^1 (partial xi_i) / (partial x_i)(x_1, dots, x_k) thin d x_i) thin d x_1 dots d x_(i-1) d x_(i+1) dots d x_k \
      &= sum_(i=1)^n integral_([0,1]^(k-1)) (xi_i compose psi_i^+ - xi_i compose psi_i^-) $
  in quanto, per il teorema fondamentale del calcolo integrale, risulta
  $ integral_0^1 (partial xi_i) / (partial x_i)(x_1, dots, x_k) thin d x_i
      &= xi_i (x_1, dots, x_(i-1), 1, x_(i+1), dots, x_k) \
      &quad - xi_i (x_1, dots, x_(i-1), 0, x_(i+1), dots, x_k) \
      &= (xi_i compose psi_i^+ - xi_i compose psi_i^-)(x_1, dots, x_(i-1), x_(i+1), dots, x_k). $
]

#theorem[teorema di Stokes][
  Sia $S$ una $k$-superficie parametrizzata e sia $omega in Omega^(k-1)(RR^n)$ una $(k-1)$-forma differenziale di classe $C^1$.

  Allora si ha
  $ integral_S d omega = integral_(partial S) omega. $
] <th:stokes>

#proof[
  Grazie alla linearità è sufficiente dimostrare il risultato quando $S = current(phi)$ con $phi: [0,1]^k -> RR^n$ di classe $C^1$.
  Allora osserviamo che $phi^* omega$ è una $(k-1)$-forma differenziale su $[0,1]^k$ e dunque si rappresenta tramite un campo vettoriale $xi: [0,1]^k -> RR^k$ con la proprietà:
  $ phi^* omega &= sum_(i=1)^k (-1)^(i-1) xi_i thin d x_1 and dots and cancel(d x_i) and dots and d x_k \
    phi^* (d omega) &= d(phi^* omega) = (op("div") xi) thin d x_1 and dots and d x_k. $
  Stiamo usando la notazione $x_1, dots, x_k$ per le coordinate di $[0,1]^k$, mentre useremo le coordinate $t_1, dots, t_(k-1)$ per le coordinate di $[0,1]^(k-1)$.
  Si ha dunque, usando il teorema precedente,
  $ integral_S d omega
      &:= integral_phi d omega
      = integral_([0,1]^k) phi^* (d omega)
      = integral_([0,1]^k) op("div") xi \
      & = sum_(i=1)^n integral_([0,1]^(k-1)) (xi_i compose psi_i^+ - xi_i compose psi_i^-) $
  Osserviamo ora che se $i != j$ si ha
  $ (d psi_i^±)_1 and dots 
  and cancel((d psi_i^±)_j) and dots and (d psi_i^±)_k = 0 $
  (in quanto $(psi_i^±)_i$ è costante e quindi ha derivata nulla) e dunque, posto $(x_1, dots, x_k) = psi_i^± (t_1, dots, t_(k-1))$, si ha
  $ & (psi_i^±)* (phi^* omega) \
      &= sum_(j=1)^(k-1) (-1)^(j-1) (xi_j compose psi_i^±) (d psi_i^±)_1 and dots 
      and cancel((d psi_i^±)_j) 
      and dots and (d psi_i^±)_k \
      &= (-1)^(i-1) (xi_i compose psi_i^±) thin d t_1 and dots and d t_(k-1) $
  da cui
  $ integral_(psi_i^±) phi^* omega
      &= integral_([0,1]^(k-1)) (psi_i^±)* (phi^* omega)
      = (-1)^(i-1) integral_([0,1]^(k-1)) (xi_i compose psi_i^±) $
  e quindi
  $ integral_(partial S) omega
      &:= sum_(i=1)^n (-1)^(i-1) (integral_(psi_i^+) phi^* omega - integral_(psi_i^-) phi^* omega)
      = integral_S d omega. $
]


== integrali di superficie

#theorem[significato geometrico del determinante jacobiano][
  Sia $L: RR^m -> RR^n$ una funzione lineare e sia $V$ l'immagine di $L$.
  Sia $M: V -> RR^m$ una isometria.
  Sia $E subset RR^m$.
  Allora si ha
  $ |det(M compose L)| dot |E| = sqrt(det(L^t L)) dot |E|. $ <eq:significato_geometrico_jacobiano>
  Visto che le isometrie preservano le aree è naturale definire la $m$-area di $L(E)$ in $RR^n$ come la misura $m$-dimensionale di $M(L(E))$ in $RR^m$.
  Per il teorema @th:geometria_determinante la $m$-area di $L(E)$ è data dal lato sinistro della @eq:significato_geometrico_jacobiano che, guardando il lato destro, non dipende dalla scelta dell'isometria $M$:
  $ m"-area"(L(E)) = sqrt(det(L^t L)) dot |E|. $
] <th:significato_geometrico_jacobiano>

#proof[
  Estendiamo $M$ ad una isometria su tutto $RR^n$, $tilde(M): RR^n -> RR^n$.
  Dunque $tilde(M)$ si rappresenta con una matrice ortogonale, cioè $tilde(M)^t = tilde(M)^(-1)$.
  Sia $P: RR^n -> RR^m$ la proiezione ortogonale $P(x_1, dots, x_n) = (x_1, dots, x_m)$.
  Dunque $M$ è la restrizione di $P tilde(M)$ a $V$ e $M compose L = P tilde(M) L$.
  Osserviamo che $P^t P: RR^n -> RR^n$ è l'applicazione lineare che azzera le ultime $n-m$ coordinate ma visto che $M$ manda $V$ in $RR^m$ si ha $P^t P tilde(M) L = M L$.
  Dunque
  $ (det(M compose L))^2
      &= det((P tilde(M) L)^t (P tilde(M) L)) \
      &= det(L^t tilde(M)^t P^t P tilde(M) L) \
      &= det(L^t tilde(M)^t M L) = det(L^t L) $
  come volevamo dimostrare.
]

#definition[integrale di superficie][
  Sia $B subset RR^k$ un aperto limitato misurabile e sia $A subset RR^n$.
  Data $phi: macron(B) -> A$ di classe $C^1$ e data $f: A subset RR^n -> RR$ di classe $C^0$ definiamo
  $ integral_phi f thin d sigma := integral_B f(phi(x)) sqrt(det((D phi)^t D phi)) thin d x. $ <eq:def_integrale_superficie>
  Le ipotesi su $phi$ e $f$ garantiscono che la funzione integranda al lato destro della @eq:def_integrale_superficie è continua e dunque integrabile su $B$, con integrale finito.
  Per mettere in evidenza la variabile di integrazione si potrà anche scrivere
  $ integral_phi f thin d sigma = integral_phi f(phi(x)) thin d sigma(x) $
  intendendo quindi $d sigma(x) = sqrt(det((D phi)^t D phi)) thin d x$.

  Si può estendere la definizione al caso in cui $B$ non è limitato.
  In tal caso l'integrale potrebbe non esistere e potrebbe essere infinito.
] <def:integrale_superficie>

#theorem[invarianza per riparametrizzazioni][
  Siano $B,C$ aperti misurabili limitati di $RR^k$ e sia $A subset RR^n$.
  Sia $phi: macron(B) -> A$ di classe $C^1$, sia $f: A -> RR$ di classe $C^0$ e sia $u: C -> B$ di classe $C^1$ con $u: C -> B$ bigettiva e $det D u != 0$.
  Allora
  $ integral_(phi compose u) f thin d sigma = integral_phi f thin d sigma. $
]

#proof[
  Si ha
  $ integral_(phi compose u) f thin d sigma
      &= integral_C f(phi(u(x))) sqrt(det((D(phi compose u))^t D(phi compose u))) thin d x \
      &= integral_C f(phi(u(x))) sqrt(det((D u)^t (D phi)^t D phi D u)) thin d x \
      &= integral_C f(phi(u(x))) sqrt(det((D phi)^t D phi)) dot sqrt(det((D u)^t D u)) thin d x \
      &= integral_B f(phi(y)) sqrt(det((D phi)^t D phi)) thin d y \
      &= integral_phi f thin d sigma $
  avendo fatto il cambio di variabile:
  $ y = u(x), quad d y = |det D u| thin d x = sqrt(det((D u)^t D u)) thin d x. $
]

Se $D phi(x)$ ha rango massimo, i vettori colonna $(partial phi) / (partial x_1), dots, (partial phi) / (partial x_k)$ sono linearmente indipendenti e dunque generano uno spazio vettoriale $k$-dimensionale che si chiama spazio tangente alla superficie definita da $phi$ nel punto $phi(x)$.

== ipersuperfici

Se $k=n-1$, $phi: B subset RR^(n-1) -> A subset RR^n$ rappresenta una _ipersuperficie_ in $RR^n$ o superficie di codimensione $1$.
Se $D phi$ ha rango massimo in un punto $x$, i vettori $(partial phi) / (partial x_1), dots, (partial phi) / (partial x_(n-1))$ sono linearmente indipendenti e dunque generano lo spazio tangente alla superficie definita da $phi$ nel punto $phi(x)$.
Per ogni $v in RR^n$ possiamo considerare il determinante $det(v, D phi)$ della matrice quadrata ottenuta aggiungendo la colonna $v$ alla matrice $D phi$.
Chiamiamo $xi_phi$ il vettore che rappresenta l'applicazione lineare $v |-> det(v, D phi)$, cioè $xi_phi$ è definito univocamente dalla proprietà
$ xi_phi dot v = det(v, D phi). $
Chiaramente $xi_phi$ è ortogonale a tutte le colonne di $D phi$ perché $xi_phi dot phi_(x_i) = det(phi_(x_i), D phi) = 0$, dunque $xi_phi$ è un vettore ortogonale allo spazio tangente alla superficie.
Definiamo $nu_phi$ come il versore $nu_phi = xi_phi / abs(xi_phi)$, che è uno dei due versori normali alla ipersuperficie.
La direzione di $nu_phi$ non cambia se si riparametrizza la superficie e il suo verso non cambia se la riparametrizzazione ha jacobiano positivo.

Se $phi$ non è iniettivo è possibile che la superficie si autointersechi o addirittura che si sovrapponga più volte su se stessa.
In questo senso diremo che la superficie ha una _molteplicità_.

Per quanto riguarda il modulo di $xi_phi$ si ha
$ |xi_phi| &= det(nu_phi, D phi) 
    = sqrt(det((nu_phi, D phi)^t (nu_phi, D phi))) \
    &= sqrt(det mat(1, 0; 0, (D phi)^t D phi)) 
    = sqrt(det((D phi)^t D phi)) $
dunque
$ xi_phi = nu_phi sqrt(det(D phi)^t D phi) $
e per ogni $v in RR^n$ si ha
$ det(v, D phi) = xi_phi dot v = (nu_phi dot v) sqrt(det((D phi)^t D phi)). $ <eq:493444>

Formalmente, se $sigma$ rappresenta l'integrazione di superficie vista in precedenza, si ha
$ xi_phi (x) thin d x = nu_phi thin d sigma. $

Nel caso particolare $n=3$, se $phi(u,v) = (x(u,v), y(u,v), z(u,v))$ è la parametrizzazione di una superficie in $RR^3$, si ha
$ (xi_phi (x), v) = det(v, (partial phi) / (partial u), (partial phi) / (partial v)) $
e quindi, in base alla definizione @def:prodotto_vettore, risulta
$ xi_phi = (partial phi) / (partial u) times (partial phi) / (partial v) $
da cui
$ nu_phi thin d sigma = ((partial phi) / (partial u) times (partial phi) / (partial v)) thin d u thin d v. $

== esempi

=== area della sfera

Osservando che la funzione identità: $x: RR^n -> RR^n$ ha divergenza costante $op("div") x = (partial x_1) / (partial x_1) + dots + (partial x_n) / (partial x_n) = n$, e osservando che $x$ è normale alla sfera $partial B_R$, si può usare il teorema della divergenza per calcolare l'area della sfera di raggio $R$:
$ omega_n R^n = |B_R|
    &= 1/n integral_(B_R) op("div") x 
    = 1/n integral_(partial B_R) x dot nu_(partial B_R) thin d sigma \
    &= 1/n integral_(partial B_R) R thin d sigma 
    = R/n dot op("area")(partial B_R) $
da cui
$ op("area")(partial B_R) = n omega_n R^(n-1). $ <eq:area_sfera>

Lo stesso risultato si può ottenere direttamente.
Se $theta: B -> RR^n$ è una qualunque parametrizzazione della sfera $partial B_1$, possiamo parametrizzare la palla $B_R$ con la funzione $phi: B times [0,R] -> RR^n$ definita da $phi(u,rho) = rho theta(u)$.
Si osserva allora che $D phi = (rho D theta, theta)$ e, osservando che $(partial theta) / (partial u_i)$ è tangente alla sfera, e quindi ortogonale a $theta$, mentre $|theta|=1$, risulta
$ D phi^t D phi = mat(rho^2 D theta^t D theta, rho D theta^t theta; rho theta^t D theta, 1) = mat(rho^2 D theta^t D theta, 0; 0, 1) $
da cui l'elemento di volume sulla palla è dato da
$ d V = rho^(n-1) sqrt(det(D theta^t D theta)) thin d u thin d rho = rho^(n-1) d sigma thin d rho $
dove $d sigma$ è l'elemento di area sulla sfera unitaria $partial B_1$.
Allora si ha
$ |B_R| = integral_(partial B_1) integral_0^R rho^(n-1) thin d rho thin d sigma = R^n / n integral_(partial B_1) d sigma = R^n / n op("area")(partial B_1) $
da cui si ottiene nuovamente la @eq:area_sfera.

Il calcolo precedente può essere svolto in maniera più informale usando con più disinvoltura le notazioni del calcolo differenziale.
Se chiamiamo $x$ la variabile che descrive il punto nella palla $B_R$, chiamiamo $theta$ la variabile che descrive il punto sulla sfera unitaria poniamo $rho = abs(x)$, $theta = x / abs(x)$ e dunque $x = rho theta$, i passaggi visti sopra si possono esprimere più espressivamente scrivendo $d x = rho^(n-1) d theta thin d rho$ dove $d theta$ è l'elemento d'area nell'integrazione sulla sfera unitaria.

=== grafico di una funzione

Se $B subset RR^n$ è misurabile e $f: B -> RR$, possiamo rappresentare la ipersuperficie $y=f(x)$ in $RR^(n+1)$ tramite la parametrizzazione $phi: B -> RR^(n+1)$, $phi(x) = (x, f(x))$.
Si può allora osservare che
$ D phi = mat(op("id"); D f), quad (D phi)^t D phi = op("id") + (D f)^t D f = op("id") + nabla f times.o nabla f $
dove $op("id")$ è la matrice identità $n times n$ e $v times.o w = v w^t$ è il prodotto tensore tra i vettori (colonna) $v$ e $w$ cioè la matrice con componenti $(v times.o w)_(i,j) = v_i w_j$.

Per verifica diretta si osserva che $(op("id") + v times.o v)$ è una matrice simmetrica che ha $v$ come autovettore con autovalore $1+|v|^2$ e che ogni vettore ortogonale a $v$ è un autovettore con autovalore $1$.
Dunque il determinante di $(op("id") + v times.o v)$ è dato dal prodotto degli autovalori, e quindi
$ sqrt(det((D phi)^t D phi)) = sqrt(1 + |nabla f|^2). $
La formula per calcolare l'area del grafico di $f$ è dunque
$ op("area")(f) = integral_B sqrt(1 + |nabla f|^2) thin d x. $
Non è difficile calcolare il versore normale al grafico della funzione $f$, basta infatti osservare che il vettore $v = (-D f, 1)$ è ortogonale ad ogni colonna $(partial phi) / (partial x_i) = (e_i, 1)$ della matrice jacobiana $D phi$ e dunque, rinormalizzando, si ottiene la normale al grafico di $f$:
$ nu_f = mat(-nabla f; 1) / sqrt(1 + |nabla f|^2). $
Dunque, se volessimo calcolare un flusso attraverso la superficie, possiamo usare la formula
$ nu_f thin d sigma = mat(-nabla f; 1) d x. $

#example[area dell'iperboloide][
  Consideriamo l'iperboloide $H$ di equazione $z = x^2 - y^2$ con $x^2+y^2 <= R$, grafico della funzione $f(x,y) = x^2 - y^2$ su $B_R = {(x,y) in RR^2 : x^2+y^2 <= R}$.
  Si ha $nabla f = (2x, -2y)$ e dunque, usando le coordinate polari, si ottiene
  $ op("area")(H)
      &= integral_(B_R) sqrt(1 + (nabla f)^2) thin d x thin d y
      = integral_(B_R) sqrt(1 + 4(x^2+y^2)) thin d x thin d y \
      &= integral_0^(2 pi) integral_0^R sqrt(1 + 4 rho^2) dot rho thin d rho thin d theta
      = 2 pi [(1 + 4 R^2)^(3/2) / 12]_0^R \
      &= pi / 6 ((1 + 4 R^2)^(3/2) - 1). $
]

=== superfici di rotazione

Se $gamma: [a,b] -> RR^2$ è una curva di classe $C^1$, posto $gamma(t) = (rho(t), z(t))$, possiamo rappresentare la superficie di rotazione $S$ di equazione $x^2+y^2 = rho(t)^2$, $z=z(t)$ tramite la parametrizzazione $phi(theta, t) = (rho(t) cos theta, rho(t) sin theta, z(t))$.
Si ha
$ D phi &= mat(-rho(t) sin theta, rho'(t) cos theta; rho(t) cos theta, rho'(t) sin theta; 0, z'(t)), \
  sqrt(det(D phi)^t D phi)
    &= sqrt(det mat(rho(t)^2, 0; 0, rho'(t)^2 + z'(t)^2))
    = rho(t) sqrt(rho'(t)^2 + z'(t)^2) \
    &= rho(t) |gamma'(t)|. $
Dunque si ottiene la _formula di Guldino_
$ op("area")(S) 
&= integral_a^b integral_0^(2 pi) rho(t) |gamma'(t)| thin d theta thin d t 
= 2 pi integral_a^b rho(t) |gamma'(t)| thin d t \
&= 2 pi integral_gamma rho thin d s. $ <eq:formula_guldino>
Se denotiamo con
$ macron(rho) = integral.dash_gamma rho = (integral_gamma rho) / (ell(gamma)) $
il baricentro della curva $gamma$, si ottiene $op("area")(S) = 2 pi macron(rho) ell(gamma)$ cioè l'area di $S$ coincide con l'area di un cilindro con base sulla curva $gamma$ e altezza pari alla lunghezza della circonferenza percorsa dal baricentro della curva.

#example[area della superficie di un toro][
  Consideriamo il toro ottenuto facendo ruotare una circonferenza di raggio $r$ attorno ad un asse che dista $R$ dal centro della circonferenza, con $R>r$.
  Il baricentro di una circonferenza è il centro della stessa, dunque l'area del toro è $2 pi R dot 2 pi r = 4 pi^2 R r$.
]