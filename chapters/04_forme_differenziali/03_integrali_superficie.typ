#import "../../lib.typ": *

= Integrali di superficie

#theorem[significato geometrico del determinante jacobiano][
  Sia $L: RR^m -> RR^n$ una funzione lineare e sia $V$ l'immagine di $L$.
  Sia $M: V -> RR^m$ una isometria.
  Sia $E subset RR^m$.
  Allora si ha
  $ |det(M compose L)| dot |E| = sqrt(det(L^t L)) dot |E|. $ <eq:significato_geometrico_jacobiano>
  Visto che le isometrie preservano le aree è naturale definire la $m$-area di $L(E)$ in $RR^n$ come la misura $m$-dimensionale di $M(L(E))$ in $RR^m$.
  Per il teorema @th:geometria_determinante la $m$-area di $L(E)$ è data dal lato sinistro della @eq:significato_geometrico_jacobiano che, guardando il lato destro, non dipende dalla scelta dell'isometria $M$:
  $ m-"area"(L(E)) = sqrt(det(L^t L)) dot |E|. $
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
  Data $phi: bar(B) -> A$ di classe $C^1$ e data $f: A subset RR^n -> RR$ di classe $C^0$ definiamo
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
  Sia $phi: bar(B) -> A$ di classe $C^1$, sia $f: A -> RR$ di classe $C^0$ e sia $u: C -> B$ di classe $C^1$ con $u: C -> B$ bigettiva e $det D u != 0$.
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

= Ipersuperfici

Se $k=n-1$, $phi: B subset RR^(n-1) -> A subset RR^n$ rappresenta una _ipersuperficie_ in $RR^n$ o superficie di codimensione $1$.
Se $D phi$ ha rango massimo in un punto $x$, i vettori $(partial phi) / (partial x_1), dots, (partial phi) / (partial x_(n-1))$ sono linearmente indipendenti e dunque generano lo spazio tangente alla superficie definita da $phi$ nel punto $phi(x)$.
Per ogni $v in RR^n$ possiamo considerare il determinante $det(v, D phi)$ della matrice quadrata ottenuta aggiungendo la colonna $v$ alla matrice $D phi$.
Chiamiamo $xi_phi$ il vettore che rappresenta l'applicazione lineare $v |-> det(v, D phi)$, cioè $xi_phi$ è definito univocamente dalla proprietà
$ xi_phi dot v = det(v, D phi). $
Chiaramente $xi_phi$ è ortogonale a tutte le colonne di $D phi$ perché $xi_phi dot phi_(x_i) = det(phi_(x_i), D phi) = 0$, dunque $xi_phi$ è un vettore ortogonale allo spazio tangente alla superficie.
Definiamo $nu_phi$ come il versore $nu_phi = xi_phi / |xi_phi|$, che è uno dei due versori normali alla ipersuperficie.
La direzione di $nu_phi$ non cambia se si riparametrizza la superficie e il suo verso non cambia se la riparametrizzazione ha jacobiano positivo.

Se $phi$ non è iniettivo è possibile che la superficie si autointersechi o addirittura che si sovrapponga più volte su se stessa.
In questo senso diremo che la superficie ha una _molteplicità_.

Per quanto riguarda il modulo di $xi_phi$ si ha
$ |xi_phi| &= det(nu_phi, D phi) \
    &= sqrt(det((nu_phi, D phi)^t (nu_phi, D phi))) \
    &= sqrt(det mat(1, 0; 0, (D phi)^t D phi)) \
    &= sqrt(det((D phi)^t D phi)) $
dunque
$ xi_phi = nu_phi sqrt(det(D phi)^t D phi) $
e per ogni $v in RR^n$ si ha
$ det(v, D phi) = xi_phi dot v = (nu_phi dot v) sqrt(det((D phi)^t D phi)). $ <eq:493444>

Formalmente, se $sigma$ rappresenta l'integrazione di superficie vista in precedenza, si ha
$ xi_phi (x) thin d x = nu_phi thin d sigma. $

Nel caso particolare $n=3$, se $phi(u,v) = (x(u,v), y(u,v), z(u,v))$ è la parametrizzazione di una superficie in $RR^3$, si ha
$ (xi_phi (x), v) = det(v, (partial phi) / (partial u), (partial phi) / (partial v)) $
e quindi, in base alla definizione \@def:prodotto_vettore, risulta
$ xi_phi = (partial phi) / (partial u) times (partial phi) / (partial v) $
da cui
$ nu_phi thin d sigma = ((partial phi) / (partial u) times (partial phi) / (partial v)) thin d u thin d v. $

= Esempi

== Area della sfera

Osservando che la funzione identità: $x: RR^n -> RR^n$ ha divergenza costante $op("div") x = (partial x_1) / (partial x_1) + dots + (partial x_n) / (partial x_n) = n$, e osservando che $x$ è normale alla sfera $partial B_R$, si può usare il teorema della divergenza per calcolare l'area della sfera di raggio $R$:
$ omega_n R^n = |B_R|
    &= 1/n integral_(B_R) op("div") x \
    &= 1/n integral_(partial B_R) x dot nu_(partial B_R) thin d sigma \
    &= 1/n integral_(partial B_R) R thin d sigma \
    &= R/n dot op("area")(partial B_R) $
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
Se chiamiamo $x$ la variabile che descrive il punto nella palla $B_R$, chiamiamo $theta$ la variabile che descrive il punto sulla sfera unitaria poniamo $rho = |x|$, $theta = x / |x|$ e dunque $x = rho theta$, i passaggi visti sopra si possono esprimere più espressivamente scrivendo $d x = rho^(n-1) d theta thin d rho$ dove $d theta$ è l'elemento d'area nell'integrazione sulla sfera unitaria.

== Grafico di una funzione

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
      = 2 pi [(1 + 4 R^2)^(3/2) / 12]_0^R
      = pi / 6 ((1 + 4 R^2)^(3/2) - 1). $
]

== Superfici di rotazione

Se $gamma: [a,b] -> RR^2$ è una curva di classe $C^1$, posto $gamma(t) = (rho(t), z(t))$, possiamo rappresentare la superficie di rotazione $S$ di equazione $x^2+y^2 = rho(t)^2$, $z=z(t)$ tramite la parametrizzazione $phi(theta, t) = (rho(t) cos theta, rho(t) sin theta, z(t))$.
Si ha
$ D phi &= mat(-rho(t) sin theta, rho'(t) cos theta; rho(t) cos theta, rho'(t) sin theta; 0, z'(t)), \
  sqrt(det(D phi)^t D phi)
    &= sqrt(det mat(rho(t)^2, 0; 0, rho'(t)^2 + z'(t)^2))
    = rho(t) sqrt(rho'(t)^2 + z'(t)^2) \
    &= rho(t) |gamma'(t)|. $
Dunque si ottiene la _formula di Guldino_
$ op("area")(S) = integral_a^b integral_0^(2 pi) rho(t) |gamma'(t)| thin d theta thin d t = 2 pi integral_a^b rho(t) |gamma'(t)| thin d t = 2 pi integral_gamma rho thin d s. $ <eq:formula_guldino>
Se denotiamo con
$ bar(rho) = integral.dash_gamma rho = (integral_gamma rho) / (ell(gamma)) $
il baricentro della curva $gamma$, si ottiene $op("area")(S) = 2 pi bar(rho) ell(gamma)$ cioè l'area di $S$ coincide con l'area di un cilindro con base sulla curva $gamma$ e altezza pari alla lunghezza della circonferenza percorsa dal baricentro della curva.

#example[area della superficie di un toro][
  Consideriamo il toro ottenuto facendo ruotare una circonferenza di raggio $r$ attorno ad un asse che dista $R$ dal centro della circonferenza, con $R>r$.
  Il baricentro di una circonferenza è il centro della stessa, dunque l'area del toro è $2 pi R dot 2 pi r = 4 pi^2 R r$.
]