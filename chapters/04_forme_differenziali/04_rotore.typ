#import "../../lib.typ": *

= Corrispondenza tra integrali di superficie e integrali di forme differenziali

In questo capitolo mettiamo in corrispondenza gli integrali di superficie con gli integrali di forme differenziali nei casi più rilevanti, ovvero per $k=1$ (curve), per $k=n-1$ (ipersuperfici) e per $k=n$ (volumi).
Nel caso rilevante $n=3$ si esaurisce tutta la casistica, lo tratteremo in particolare.

== Curve

Per le curve abbiamo già visto che se $xi$ è un campo vettoriale in $RR^n$ possiamo associare a $xi$ la $1$-forma differenziale $omega$ definita da
$ omega_x [v] = xi(x) dot v. $

In tal modo si ha
$ integral_phi omega = integral_phi xi(x) dot phi'(t) thin d t. $

Se $phi'(t) != 0$ si può definire $tau_phi (t) := phi'(t) / |phi'(t)|$ che geometricamente è il versore tangente alla curva rappresentata da $phi$ e dunque si ha
$ phi'(t) thin d t = tau_phi dot |phi'(t)| thin d t = tau_phi thin d s $
dove $d s$ è l'elemento di lunghezza della curva (ovvero $s$ è il parametro di lunghezza d'arco della curva).
Osserviamo che sebbene $tau_phi$ non ha senso quando $phi'(t) = 0$ il prodotto $tau_phi |phi'(t)| = phi'(t)$ è sempre ben definito, dunque gli integrali della forma
$ integral_phi xi dot tau_phi thin d s $
hanno senso anche se $phi'(t)$ si annulla.

== Ipersuperfici

Ad un campo vettoriale $xi: A subset RR^n -> RR^n$ possiamo associare la $(n-1)$-forma differenziale $omega$ definita da
$ omega_x [v_2, dots, v_n] = det(xi(x), v_2, dots, v_n). $

In tal modo, grazie alla @eq:493444 si ottiene che l'integrale di $omega$ su una ipersuperficie rappresentata da $phi: B subset RR^(n-1) -> RR^n$ coincide con il flusso del campo vettoriale $xi$ attraverso la ipersuperficie rappresentata da $phi$:
$ integral_phi omega
    &= integral_B det(xi(x), D phi(x)) thin d x \
    &= integral_B xi(x) dot nu_phi (x) sqrt(det((D phi)^t D phi)) thin d x \
    &= integral_phi xi dot nu_phi thin d sigma. $

Se $S = op("current") phi_1 + dots + op("current") phi_M$ è una $(n-1)$-superficie parametrizzata ha quindi senso definire
$ integral_S xi dot nu_S thin d sigma := integral_S omega $
dove $omega$ è la $(n-1)$-forma differenziale associata a $xi$ come sopra.

== Volumi

Se $A subset RR^n$ è un aperto limitato e misurabile si può definire $op("current") A: Omega^n (A) -> RR$ tramite
$ integral_(op("current") A) f thin d x_1 and dots and d x_n = integral_A f. $

Se $A$ è sufficientemente regolare sarà possibile scrivere $op("current") A = op("current") phi_1 + dots + op("current") phi_M$ con $phi_i : [0,1]^n -> A$ di classe $C^1$.
In tal caso $op("current") A$ è una $n$-superficie parametrizzata e dunque si potrà definire il suo bordo.

#theorem[
  Sia $A subset RR^n$ un aperto limitato sufficientemente regolare (in modo che $op("current") A$ sia una $n$-superficie parametrizzata).
  Sia $f: bar(A) -> RR^n$ una funzione di classe $C^1$.
  Allora
  $ integral_A op("div") f = integral_(partial op("current") A) f dot nu_(partial op("current") A) thin d sigma. $
]

#proof[
  Consideriamo la $(n-1)$-forma $omega$ associata a $f$.
  Il teorema @th:stokes ci dice che
  $ integral_A op("div") f = integral_(op("current") A) d omega = integral_(op("current") A) omega = integral_(partial op("current") A) f dot nu_(partial op("current") A) thin d sigma. $
]

== Forme differenziali multilineari in $RR^3$

#definition[prodotto vettore][
  Siano $v,w in RR^3$.
  Definiamo il _prodotto vettore_ $v times w in RR^3$ come l'unico vettore tale che per ogni $u in RR^3$ si abbia
  $ u dot (v times w) = det(u, v, w) quad text("(prodotto triplo)"). $
  Questa uguaglianza definisce univocamente $v times w$ in quanto il lato destro è una applicazione lineare in $u$ e dunque c'è un unico vettore che la rappresenta mediante prodotto scalare.
] <def:prodotto_vettore>

Ovviamente il vettore $v times w$ è perpendicolare sia a $v$ che a $w$, perché $v dot (v times w) = det(v,v,w) = 0$ e $w dot (v times w) = det(w,v,w) = 0$.
Posto $nu = (v times w) / |v times w|$ si ha che $nu$ è un versore normale al piano generato da $v$ e $w$.
Inoltre
$ |v times w| = nu dot (v times w) = det(nu, v, w) $
è il volume del prisma retto generato da $v$ e $w$ in direzione $nu$ ed essendo $nu$ unitario è anche l'area del parallelogramma generato da $v$ e $w$ in $RR^3$.
Significa che $v times w$ è un vettore con modulo pari all'area del parallelogramma generato da $v$ e $w$ e con direzione $nu$ perpendicolare a $v$ e $w$ secondo la regola della mano destra (in modo che $det(v, w, nu) > 0$).
Se $u$ e $v$ sono tra loro paralleli, si ha $u times v = 0$.

In coordinate, se $xi = v times w$ con $v=(v_1,v_2,v_3)$, $w=(w_1,w_2,w_3)$ si ha dunque $xi=(xi_1,xi_2,xi_3)$ con
$ xi_1 &= arrow(e)_1 dot xi = det(arrow(e)_1, v, w) = v_2 w_3 - v_3 w_2, \
  xi_2 &= arrow(e)_2 dot xi = det(arrow(e)_2, v, w) = v_3 w_1 - v_1 w_3, \
  xi_3 &= arrow(e)_3 dot xi = det(arrow(e)_3, v, w) = v_1 w_2 - v_2 w_1. $

Più espressivamente si può scrivere
$ xi = det mat(arrow(e)_1, v_1, w_1; arrow(e)_2, v_2, w_2; arrow(e)_3, v_3, w_3) = (v_2 w_3 - v_3 w_2) arrow(e)_1 + (v_3 w_1 - v_1 w_3) arrow(e)_2 + (v_1 w_2 - v_2 w_1) arrow(e)_3. $

Se $omega in Omega^2 (A)$ è rappresentata dal campo vettoriale $xi: A -> RR^3$ e $phi: B subset RR^2 -> A subset RR^3$ osserviamo che $phi_x = (partial phi) / (partial x)$ e $phi_y = (partial phi) / (partial y)$ sono due vettori tangenti alla superficie parametrizzata da $phi$ e dunque
$ nu_phi = (phi_x times phi_y) / |phi_x times phi_y| $
è il versore normale alla superficie in $phi(x,y)$ con direzione che dipende dall'orientazione di $phi$.
L'integrale di $omega$ lungo la superficie parametrizzata da $phi$ si scrive dunque come
$ integral_phi omega
    &= integral_B omega(phi_x, phi_y) thin d x thin d y
    = integral_B det(xi, phi_x, phi_y) thin d x thin d y \
    &= integral_B xi dot (phi_x times phi_y) thin d x thin d y
    = integral_B xi dot nu_phi thin d sigma $
dove $d sigma = |phi_x times phi_y| thin d x thin d y$ rappresenta l'elemento di area della superficie parametrizzata da $phi$.
Dunque $integral_phi omega$ è il flusso del campo vettoriale $xi$ attraverso la superficie parametrizzata da $phi$.

#definition[rotore][
  Sia $A$ un aperto di $RR^3$ e $xi: A -> RR^3$ una funzione differenziabile.
  Sia $arrow(e)_1, arrow(e)_2, arrow(e)_3$ la base canonica di $RR^3$.
  Definiamo allora il _rotore_ di $xi$ come il vettore $op("rot") xi in RR^3$ definito da
  $ op("rot") xi = nabla times xi
      = det mat(arrow(e)_1, partial_x, xi_1; arrow(e)_2, partial_y, xi_2; arrow(e)_3, partial_z, xi_3)
      = mat((partial xi_3) / (partial y) - (partial xi_2) / (partial z); (partial xi_1) / (partial z) - (partial xi_3) / (partial x); (partial xi_2) / (partial x) - (partial xi_1) / (partial y)). $

  Ricordiamo anche gli operatori _gradiente_ e _divergenza_
  $ op("grad") f = nabla f = mat((partial f) / (partial x); (partial f) / (partial y); (partial f) / (partial z)), quad op("div") f = nabla dot xi = (partial xi_1) / (partial x) + (partial xi_2) / (partial y) + (partial xi_3) / (partial z). $
  In tutte queste notazioni abbiamo usato l'operatore _nabla_: $nabla = (partial_x, partial_y, partial_z)$ dove $partial_x = (partial) / (partial x)$, $partial_y = (partial) / (partial y)$, $partial_z = (partial) / (partial z)$.
]

Abbiamo già visto che una $1$-forma $omega$ in un aperto $A$ di $RR^3$ può essere rappresentata con un campo vettoriale $xi: A subset RR^3 -> RR^3$ in modo tale che si abbia
$ omega_((x,y,z)) [v] = xi(x,y,z) dot v. $

Se consideriamo $f: A subset RR^3 -> RR$ una $0$-forma, il suo differenziale $omega = d f$ è una $1$-forma, che si rappresenta con il vettore $nabla f$:
$ d f = (partial f) / (partial x) thin d x + (partial f) / (partial y) thin d y + (partial f) / (partial z) thin d z. $

Se $omega in Omega^1 (A)$, possiamo scrivere $omega$ nella forma
$ omega = g_1 thin d x + g_2 thin d y + g_3 thin d z $
in modo che $arrow(g): A -> RR^3$ sia il campo vettoriale che rappresenta $omega$.
In questo caso si ha
$ d omega
    &= (partial_x arrow(g)_1 d x + partial_y arrow(g)_1 d y + partial_z arrow(g)_3 d z) and d x \
    &quad + (partial_x arrow(g)_2 d x + partial_y arrow(g)_2 d y + partial_z arrow(g)_3 d z) and d y \
    &quad + (partial_x arrow(g)_3 d x + partial_y arrow(g)_3 d y + partial_z arrow(g)_3 d z) and d z \
    &= (partial_y arrow(g)_3 - partial_z arrow(g)_2) thin d y and d z + (partial_z arrow(g)_1 - partial_x arrow(g)_3) thin d z and d x \
    &quad + (partial_x arrow(g)_2 - partial_y arrow(g)_1) thin d x and d y \
    &= (op("rot") arrow(g))_1 thin d y and d z + (op("rot") arrow(g))_2 thin d z and d x + (op("rot") arrow(g))_3 thin d x and d y. $
Dunque se rappresentiamo $d omega in Omega^2 (A)$, tramite il campo vettoriale $xi: A -> RR^3$ definito da
$ xi_1 (arrow(p)) = omega_arrow(p) [arrow(e)_2, arrow(e)_3], quad xi_2 (arrow(p)) = omega_arrow(p) [arrow(e)_3, arrow(e)_1], quad xi_3 (arrow(p)) = omega_arrow(p) [arrow(e)_1, arrow(e)_2] $
si avrà
$ d omega = xi_1 thin d y and d z + xi_2 thin d z and d x + xi_3 thin d x and d y. $ <eq:fkjtpd>
Abbiamo quindi verificato che se $xi$ è il campo vettoriale che rappresenta la $1$-forma $omega$, il campo (pseudo)-vettoriale che rappresenta $d omega$ è $op("rot") xi$.

Consideriamo infine $omega in Omega^2 (A)$ una $2$-forma definita su un aperto $A subset RR^3$.
Sappiamo che $omega$ si rappresenta tramite un campo vettoriale $xi: A subset RR^3 -> RR^3$ come nella @eq:fkjtpd.
Osserviamo che allora si ha
$ omega[v,w]
    &= xi_1 (v_1 w_3 - v_3 w_2) + xi_2 (v_3 w_1 - v_1 w_3) + xi_3 (v_1 w_2 - v_2 w_1) \
    &= det(xi, v, w) = xi dot (v times w). $
Inoltre
$ d omega
    &= (partial_x xi_1 d x + partial_y xi_1 d y + partial_z xi_1 d z) and d y and d z \
    &quad + (partial_x xi_2 d x + partial_y xi_2 d y + partial_z xi_2 d z) and d z and d x \
    &quad + (partial_x xi_3 d x + partial_y xi_3 d y + partial_z xi_3 d z) and d x and d y \
    &= (partial_x xi_1 + partial_y xi_2 + partial_z xi_3) thin d x and d y and d z \
    &= (op("div") xi) thin d x and d y and d z. $
Dunque la funzione che rappresenta la $3$-forma $d omega$ è la divergenza del campo vettoriale che rappresenta la $2$-forma $omega$.

Possiamo quindi esprimere il teorema @th:stokes in termini di rotore.

#theorem[del rotore][
  Sia $xi: A -> RR^3$ un campo vettoriale di classe $C^1$.
  Allora si ha
  $ integral_S op("rot") xi = integral_(partial S) xi. $
]