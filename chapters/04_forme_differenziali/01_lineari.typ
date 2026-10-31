#import "../../lib.typ": *

= Forme differenziali lineari

Se $f: A subset RR^n -> RR$ è una funzione differenziabile il suo differenziale $d f: A -> cal(L)(RR^n, RR)$ è una forma differenziale lineare ($1$-forma).
Si tratta di una funzione che ad ogni punto $x in A$ associa una applicazione lineare $d f_x : RR^n -> RR$ e dunque ad ogni $v in RR^n$ associa un numero reale $d f_x [v]$.
Se sfruttiamo il prodotto scalare standard su $RR^n$ possiamo identificare l'applicazione lineare $d f_x$ con il vettore $nabla f(x)$:
$ d f_x [v] = (partial f) / (partial v)(x) = nabla f(x) dot v. $
Infatti il prodotto scalare su uno spazio vettoriale $V$ induce un isomorfismo $V -> V^*$, $v |-> (w |-> v dot w)$.

#definition[forme differenziali lineari][
  Sia $A subset RR^n$ un aperto.
  Denotiamo con $Omega^1 (A)$ l'insieme di tutte le funzioni $omega: A -> (RR^n)^*$ che ad ogni punto $x in A$ associano una applicazione lineare $omega_x : RR^n -> RR$, $v |-> omega_x [v]$.
]

#remark[
  Le forme differenziali sono funzioni di due variabili: $(x,v) |-> omega_x [v]$.
  La dipendenza da $x$ non è lineare (e in generale lo spazio ambiente potrebbe non essere uno spazio vettoriale, dunque non avrebbe senso richiedere la linearità in $x$) mentre la dipendenza da $v$ è lineare.
  A volte si fissa una delle due variabili ma non l'altra, per questo le due variabili vengono posizionate in modo diverso: una come pedice, una tra parentesi quadre.
  In generale useremo le parentesi quadre per ricordare che la dipendenza da quella variabile è lineare.

  Le forme differenziali si definiscono più in generale sulle _varietà differenziabili_, che sono una generalizzazione a più dimensioni delle superfici regolari.
  La variabile $x$ rappresenta un punto sulla superficie mentre $v$ è un vettore tangente a quel punto. Lo spazio prodotto dove vive la coppia $(x,v)$ si chiama _fibrato tangente_.

  Purtroppo sullo spazio piatto $RR^n$ si può facilmente fare confusione tra le due variabili perché lo spazio tangente ad $RR^n$ in ogni punto è $RR^n$ stesso.
  Bisogna pensare ad $x in RR^n$ come un punto, mentre $v in RR^n$ è un vettore applicato in quel punto.
]

Sappiamo, dall'algebra lineare, che il duale di uno spazio vettoriale di dimensione finita ha la stessa dimensione dello spazio stesso.
Inoltre se $e_1, dots, e_n$ è la base canonica di $RR^n$, la corrispondente base dello spazio duale $(RR^n)^*$ è data dalle applicazioni lineari $lambda_1, dots, lambda_n$ definite da
$ lambda_k [e_j] = delta_(k j) = cases(
  1 &text("se ") k=j,
  0 &text("altrimenti.")
) $
Se denotiamo con $x_k : RR^n -> RR$ la funzione $arrow(x) |-> x_k$ che restituisce la $k$-esima coordinata di un punto $arrow(x) = (x_1, dots, x_n)$, possiamo osservare che $d x_k [e_j] = (partial x_k) / (partial x_j) = delta_(k j)$ e dunque $d x_k = lambda_k$ è in effetti la base canonica di $(RR^n)^*$.
Significa che ogni $omega in Omega^1 (A)$ può essere scritto nella forma
$ omega = xi_1 d x_1 + xi_2 d x_2 + dots + xi_n d x_n. $
Dunque c'è un isomorfismo $omega |-> xi$ che mette in corrispondenza le forme differenziali lineari $omega in Omega^1 (A)$ con i campi vettoriali $xi : A -> RR^n$.
In questo isomorfismo:
$ omega_x [v] = xi(x) dot v $
(abbiamo qui sfruttato il fatto che sullo spazio $RR^n$ è fissato un prodotto scalare canonico che induce un isomorfismo canonico tra $RR^n$ e il suo duale).

= Integrale di una forma differenziale lineare

Se $u: [a,b] -> A subset RR^n$ è una curva regolare e $omega in Omega^1 (A)$ è una $1$-forma differenziale, possiamo definire l'integrale della forma differenziale lungo la curva:
$ integral_u omega := integral_a^b omega_(u(t)) [u'(t)] thin d t. $ <def:integrale_forma_1>

Osserviamo che se $omega$ si rappresenta con il campo vettoriale $xi$, si ha $omega_x [v] = xi(x) dot v$ e dunque
$ integral_u omega = integral_a^b xi(u(t)) dot u'(t) thin d t. $
Questo integrale si chiama _circuitazione_ di $xi$ lungo $u$.
Osserviamo che questo integrale è indipendente dalla parametrizzazione della curva $u$ (se si mantiene l'orientazione).
Infatti se $phi: [A,B] -> [a,b]$ con $phi(A)=a$ e $phi(B)=b$ posto $t=phi(s)$ si ha $(u compose phi)'(s) thin d s = u'(phi(s)) phi'(s) thin d s = u'(t) thin d t$.
Dunque la formula del cambio di variabile garantisce l'uguaglianza
$ integral_(u compose phi) omega
    &= integral_A^B omega_(u(phi(s))) [(u compose phi)'(s)] thin d s \
    &= integral_A^B omega_(u(phi(s))) [u'(phi(s))] phi'(s) thin d s \
    &= integral_a^b omega_(u(t)) [u'(t)] thin d t = integral_u omega. $

In generale se $phi: A subset RR^m -> RR^n$ il differenziale $d phi(x)$ calcolato in un punto $x in A$ manda i vettori di $RR^m$ nei vettori di $RR^n$ e permette quindi di definire una forma differenziale su $A$ se abbiamo una forma differenziale su $phi(A)$ (la forma differenziale viene _tirata indietro_ dal codominio al dominio di $phi$).
Formalmente si definisce il _pull-back_ $phi^* : Omega^1 (phi(A)) -> Omega^1 (A)$ tramite la formula
$ (phi^* omega)_x [v] = omega_(phi(x)) [d phi_x [v]]. $

Osserviamo che se $u: I -> A subset RR^n$ con $I$ un intervallo di $RR$ allora $u^* omega in Omega^1 (I)$.
Ma questo spazio ha dimensione $1$, ed è generato dal differenziale $d t$ dell'identità $t |-> t$.
In effetti se pensiamo all'integrale $integral_a^b f(t) thin d t$ come all'integrazione della forma differenziale $f(t) thin d t$ sull'intervallo $[a,b]$, possiamo notare che si ha
$ integral_u omega = integral_I u^* omega $
in quanto (qui $e_1=1$ è l'unico vettore della base canonica di $RR$)
$ (u^* omega)_t [e_1] = omega_(u(t)) [u'(t)] thin d t. $

= Forme chiuse, forme esatte

#definition[forma esatta][
  Una forma differenziale $omega in Omega^1 (A)$ si dice essere _esatta_ se esiste $f: A -> RR$ tale che $omega = d f$.
]

L'integrale di un differenziale esatto risulta banale. Se $omega = d f$
$ integral_u omega
    &= integral_u d f \
    &= integral_a^b d f_(u(t)) [u'(t)] thin d t \
    &= integral_a^b nabla f(u(t)) dot u'(t) thin d t \
    &= integral_a^b (f(u(t)))' thin d t \
    &= f(u(b)) - f(u(a)). $
In questo caso se due curve hanno gli stessi estremi l'integrale è lo stesso, e se la curva è chiusa, cioè se $u(b) = u(a)$, l'integrale è nullo.
Se dobbiamo calcolare l'integrale di una forma differenziale $omega$ sarà dunque interessante capire se tale forma è esatta.

Osserviamo innanzitutto che non tutte le forme differenziali lineari sono il differenziale di una funzione $f: A -> RR$.
Infatti se $f in C^2 (A)$ e $omega = d f$ allora
$ omega = xi_1 d x_1 + dots + xi_n d x_n $
e, per il teorema di Schwarz si ha
$ (partial xi_k) / (partial x_j) = (partial xi_j) / (partial x_k). $ <eq:forma-chiusa>

#definition[forma chiusa][
  Sia $omega in Omega^1 (A)$ una $1$-forma di classe $C^1$ ovvero tale che esiste $xi in C^1 (A, RR^n)$ tale che $omega_x [v] = xi(x) dot v$.
  Diremo che $omega$ è chiusa se vale la @eq:forma-chiusa.
]

Se $d f = omega$ diremo che $f$ è una primitiva di $omega$ e diremo che $omega$ è integrabile.
Abbiamo quindi dimostrato il seguente teorema.

#theorem[condizione necessaria per l'integrabilità][
  Se $omega$ è una $1$-forma di classe $C^1$ ed esiste $f in C^1 (A)$ tale che $omega = d f$ allora $omega$ è chiusa.
] <th:forma-chiusa>

Per le funzioni di una variabile la condizione @eq:forma-chiusa è vuota, perché necessariamente $k=j=1$.
E, in effetti, tutte le funzioni continue, in una variabile, sono integrabili per il teorema fondamentale del calcolo.
In più variabili la condizione non è vuota.

#example[forma differenziale non chiusa][
  Sia $omega_((x,y)) = y d x$, $omega in Omega^1 (RR^2)$ è una forma di classe $C^infinity$ associata al campo vettoriale $xi(x,y) = (y,0)$.
  L'equazione @eq:forma-chiusa diventa $1=0$ e dunque questa forma non è chiusa e non può essere il differenziale di una funzione.
]

#theorem[Lemma di Poincaré][
  Sia $A$ un aperto _stellato_ di $RR^n$ (cioè esiste $x_0 in A$ tale che per ogni $y in A$ si ha $[x_0,y] subset A$).
  Sia $omega in Omega^1 (A)$ una forma differenziale chiusa.
  Allora $omega$ è esatta (cioè esiste $f: A -> RR$ tale che $d f = omega$).
] <th:lemma-poincare>

#proof[
  Senza perdita di generalità possiamo supporre $x_0 = 0 in A$.
  Sia $xi$ il campo vettoriale che rappresenta $omega$.
  Definiamo $f: A -> RR$ come l'integrale di $omega$ lungo il segmento che congiunge $0$ ad $x$:
  $ f(x) = integral_([0,x]) omega = integral_0^1 xi(t x) dot x thin d t = integral_0^1 sum_j x_j xi_j (t x) thin d t. $
  Ricordiamo che se $omega$ è chiusa si ha $(partial xi_j) / (partial x_k) = (partial xi_k) / (partial x_j)$.
  Dunque
  $ (partial) / (partial x_k) sum_j x_j xi_j (t x)
      &= sum_j sum_i delta_(i k) t x_j (partial xi_j) / (partial x_i)(t x) + sum_j delta_(j k) xi_j (t x) \
      &= sum_j t x_j (partial xi_j) / (partial x_k)(t x) + xi_k (t x) \
      &= sum_j t x_j (partial xi_k) / (partial x_j)(t x) + xi_k (t x) \
      &= t d / (d t) xi_k (t x) + xi_k (t x) = d / (d t) (t xi_k (t x)). $
  Dunque
  $ (partial f) / (partial x_k)(x) = integral_0^1 d / (d t) (t xi_k (t x)) thin d t = [t xi_k (t x)]_0^1 = xi_k (x). $
  Significa che $omega = d f$ come volevamo dimostrare.
]

#example[forma chiusa ma non esatta][
  Si consideri $A = RR^2 without {(0,0)}$.
  Sia $omega in Omega^1 (A)$
  $ omega := (-y d x + x d y) / (x^2 + y^2). $
  Allora $omega$ è chiusa ma non è esatta.
]

#proof[
  Poniamo
  $ a(x,y) = (-y) / (x^2 + y^2), quad b(x,y) = x / (x^2 + y^2) $
  cosicché $omega = a d x + b d y$.
  Allora da verifica diretta si osserva che
  $ (partial a) / (partial y) = (partial b) / (partial x) = (y^2 - x^2) / (x^2 + y^2)^2 $
  e quindi effettivamente $omega$ è chiusa.
  Se la forma fosse esatta si avrebbe $integral_u omega = 0$ su ogni curva chiusa $u$.
  Prendiamo invece $u: [0, 2 pi] -> A$ la circonferenza di raggio $rho$:
  $u(t) = rho (cos t, sin t)$.
  Cioè $x = rho cos t$, $y = rho sin t$, $d x = -rho sin t thin d t$, $d y = rho cos t thin d t$
  da cui
  $ integral_u omega
      &= integral_0^(2 pi) (-rho sin t (-rho sin t) + rho cos t dot rho cos t) / (rho^2 cos^2 t + rho^2 sin^2 t) thin d t \
      &= integral_0^(2 pi) 1 thin d t = 2 pi. $
  Dunque $omega$ non può essere esatta.
]

L'esempio precedente non viola il teorema @th:lemma-poincare perché $A$ è un esempio di aperto non stellato.
Osserviamo che se da $A$ rimuoviamo l'asse delle $y$, la funzione
$ f(x,y) = arctan(y / x) $
è ben definita e si ha
$ d f = 1 / (1 + y^2 / x^2) dot ((-y) / x^2 d x + 1 / x d y) = (-y d x + x d y) / (x^2 + y^2). $
Si capisce dunque che l'esattezza di una forma chiusa dipende sostanzialmente dal dominio in cui la forma è definita.