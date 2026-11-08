#import "../../lib.typ": *

== forme differenziali multilineari

Una funzione $lambda: (RR^n)^k -> RR$, $(v_1, dots, v_k) |-> lambda[v_1, dots, v_k]$ con $v_1, dots, v_k in RR^n$ si dice essere _multilineare_ se per ogni $k$ l'applicazione $v_k |-> lambda[v_1, dots, v_k]$ è lineare e se scambiando due ingressi $v_k$, $v_j$ il risultato cambia segno.

#definition[applicazioni multilineari alternanti][
  Sia $V$ uno spazio vettoriale reale.
  Denotiamo con $Lambda^k (V)$ l'insieme delle applicazioni multilineari alternanti.

  Cioè $lambda in Lambda^k (V)$ se $lambda: V^k -> RR$ e
  + è lineare nella prima entrata:
  #note[se è lineare nella prima entrata ed è alternante, allora è lineare in tutte le entrate]
    $ lambda[t v + s v', v_2, dots, v_k] = t lambda[v, v_2, dots, v_k] + s lambda[v', v_2, dots, v_k] $
    (con $t,s in RR$, $v,v',v_2, dots, v_n in V$)
  + è alternante:
    $ lambda[v_(sigma(1)), dots, v_(sigma(k))] = (-1)^sigma lambda[v_1, dots, v_k] $
    per ogni $sigma$ permutazione degli indici ${1, dots, k}$ dove $(-1)^sigma$ è il segno della permutazione.

  Chiaramente $Lambda^k (V)$ è uno spazio vettoriale reale.
]

#example[
  Sia $lambda in Lambda^n (RR^n)$.
  Allora esiste $c in RR$ tale che
  $ lambda[v_1, dots, v_n] = c det mat(v_1, dots, v_n). $
  In particolare $dim Lambda^n (RR^n) = 1$.
]
#proof[
  Questo viene dalla caratterizzazione assiomatica del determinante:
  il determinante è l'unica applicazione multilineare alternante che vale $1$ sulla base canonica di $RR^n$.
]

#remark[
  Si ha banalmente $Lambda^1 (V) = V^*$.
]

#definition[forme differenziali multilineari][
  Sia $A$ un aperto di $RR^n$.
  Una $k$-forma differenziale $omega$ è una funzione $omega: A -> Lambda^k (RR^n)$.
  L'insieme delle $k$-forme su $A$ si denota con $Omega^k (A)$.
]

Abbiamo già considerato lo spazio delle $1$-forme e abbiamo visto che possono essere rappresentate nella forma
$ omega = xi_1 thin d x_1 + dots + xi_n thin d x_n, quad omega_x [v] = xi(x) dot v $
con $xi: A -> RR^n$.

Le $0$-forme sono banalmente le funzioni scalari, in quanto $Lambda^0 (RR^n) = RR$ e dunque $f in Omega^k (A)$ significa $f: A -> RR$.

Visto che $Lambda^n (RR^n)$ contiene solamente i multipli del determinante, anche le $n$-forme in $RR^n$ si rappresentano con una funzione $f: A -> RR$, moltiplicata per il determinante:
$ omega_x [v_1, dots, v_n] = f(x) det(v_1, dots, v_n), quad f(x) = omega_x [e_1, dots, e_n]. $

I casi intermedi sono più complicati da capire.
In primo luogo se $lambda in Lambda^k (RR^n)$ dalla multilinearità deduciamo che $lambda$ è univocamente determinato se conosciamo il suo valore su tutte le $k$-uple di vettori estratti da una base di $RR^n$.
Inoltre sappiamo che se scambiamo due vettori in $lambda[v_1, dots, v_n]$ il risultato cambia segno.
In particolare se ci sono due vettori uguali $v_k = v_j$ con $k != j$, il risultato è nullo, in quanto scambiandoli dovrebbe cambiare segno ma si ottiene lo stesso risultato.
Dunque $lambda$ è non nullo solamente sulle $k$-uple di vettori $(v_1, dots, v_k)$ che non hanno ripetizioni.
E il valore su una $k$-upla di vettori di una base determina il valore su tutte le permutazioni della stessa $k$-upla.
Si capisce dunque che $dim Lambda^k (RR^n) = binom(n, k)$ in quanto possiamo fissare a piacere il valore di $lambda$ su una qualunque delle $k!$ permutazioni di ogni sottoinsieme di $k$ vettori della base di $RR^n$ e il valore di $lambda$ sarà univocamente determinato su tutte le $k$-uple di vettori di $RR^n$.

Vogliamo ora introdurre una notazione che ci permette di costruire una base canonica di $Lambda^k (RR^n)$ e di $Omega^k (RR^n)$.
Abbiamo già introdotto le $1$-forme $d x_1, dots, d x_n$ che rappresentano la base canonica del duale di $RR^n$: $d x_k [v] = v_k$ per ogni $v in RR^n$.
Se $j_1, dots, j_k$ sono $k$ indici distinti in ${1, dots, n}$, possiamo definire la $k$-forma
$ d x_(j_1) thin and dots and thin d x_(j_k) $
come quella (unica) forma multilineare alternante che vale $1$ sulla $k$-upla di vettori $e_(j_1), dots, e_(j_k)$ e vale $0$ su tutte le altre $k$-uple di vettori della base canonica che non siano permutazioni di $e_(j_1), dots, e_(j_k)$.
Più in generale dati $lambda_1, dots, lambda_k in (RR^n)^*$ possiamo definire la $k$-forma (prodotto esterno) $lambda_1 and dots and lambda_k$ con la seguente formula:
$ (lambda_1 and dots and lambda_k)[v_1, dots, v_k] 
:= sum_(sigma in S_k) (-1)^sigma lambda_1 [v_(sigma(1))] thin dots.c thin lambda_k [v_(sigma(k))] $
dove $S_k$ è l'insieme di tutte le permutazioni degli indici ${1, dots, k}$ e $(-1)^sigma$ è il segno della permutazione $sigma$.
Una base di $Lambda^k (RR^n)$ è quindi data dalle $k$-forme:
$ d x_(j_1) thin and dots and thin d x_(j_k) $
al variare di $1 <= j_1 < j_2 < dots < j_k <= n$.

Osserviamo che il prodotto esterno $lambda_1 and dots and lambda_k$ è anch'esso multilineare e alternante, infatti se scambiamo due indici $j_m$ e $j_l$ è come aggiungere uno scambio a tutte le permutazioni $sigma$ e dunque si ottiene un cambio di segno.

#example[
  Ad esempio fissati $i,j in {1, dots, n}$ possiamo considerare la $2$-forma $d x_i and d x_j in Omega^2 (RR^n)$ e avremo
  $ (d x_i and d x_j)[v,w] = d x_i [v] d x_j [w] - d x_i [w] d x_j [v] = v_i w_j - v_j w_i. $
  Se $omega in Omega^2 (RR^n)$ posto $xi_(i,j)(x) = omega_x [v_i, v_j]$ per ogni $1 <= i < j <= n$ si avrà
  $ omega_x = sum_(1 <= i < j <= n) xi_(i j)(x) thin d x_i and d x_j. $
]

#example[$2$-forme in $RR^3$][
  Denotiamo con $x,y,z$ le tre coordinate di $RR^3$ (invece che $x_1,x_2,x_3$).
  Ricordiamo che $binom(3, 2) = 3$.
  Tre applicazioni bilineari alternanti che generano $Lambda^2 (RR^3)$ sono $d y and d z$, $d z and d x$ e $d x and d y$ (le ordino in base all'unico differenziale mancante, $d x$ nella prima, $d y$ nella seconda e $d z$ nella terza).
  Sia $omega in Omega^2 (RR^3)$.
  Allora
  $ omega = xi_1 thin d y and d z + xi_2 thin d z and d x + xi_3 thin d x and d y. $
  Dunque $omega$ si rappresenta con un campo vettoriale $xi = (xi_1, xi_2, xi_3): A -> RR^3$.
]

#example[$(n-1)$-forme in $RR^n$][
  L'esempio precedente si generalizza al caso di codimensione $1$, ovvero al caso di $(n-1)$-forme in $RR^n$.
  In questo caso lo spazio vettoriale $Lambda^(n-1)(RR^n)$ è generato da $n$ applicazioni multilineari alternanti.
  Una base naturale è data dalle forme:
  $ hat(lambda)_i 
    &:= (-1)^(i-1) d x_1 and dots and d x_(i-1) and d x_(i+1) and dots and d x_n    \
    &= (-1)^(i-1) d x_1 and dots and cancel(d x_i) and dots and d x_n 
  $
  con $i=1, dots, n$.
  In pratica $d x_i$ è l'unico differenziale mancante nel prodotto esterno che definisce $hat(lambda)_i$.
  Nell'esempio precedente avevamo $i=3$, $x_1=x$, $x_2=y$, $x_3=z$, $hat(lambda)_1 = d y and d z$, $hat(lambda)_2 = -d x and d z = d z and d x$ e $hat(lambda)_3 = d x and d y$.

  Dunque se $omega in Omega^(n-1)(A)$, $A subset RR^n$, si può scrivere:
  $ omega = sum_(i=1)^n (-1)^i xi_i thin d x_1 and dots and cancel(d x_i) and dots and d x_n $
  con $xi: A -> RR^n$.
  Questo sarà il modo standard per rappresentare le $(n-1)$-forme $omega in Omega^(n-1)(A)$, $A subset RR^n$, tramite un campo vettoriale $xi: A -> RR^n$.
]

== differenziale di una forma

Possiamo definire il _differenziale_ $d omega in Omega^(k+1)(A)$ di una forma differenziale $omega in Omega^k (A)$, definendo il differenziale delle forme _elementari_
$ d(f thin d x_(j_1) and dots and d x_(j_k)) 
= d f and d x_(j_1) and dots and d x_(j_k)
= sum_i (partial f) / (partial x_i) thin d x_i and d x_(j_1) and dots and d x_(j_k). $
Lo si capisce con un esempio.

#example[calcolo del differenziale][
  Sia $omega in Omega(RR^3)$, $omega = f thin d x and d y - g thin d y and d z$ con $f,g: RR^3 -> RR$.
  Allora
  $ d omega
      &= d f and d x and d y - d g and d y and d z \
      &= (f_x thin d x + f_y thin d y + f_z thin d z) and d x and d y \
      & quad - (g_x thin d x + g_y thin d y + g_z thin d z) and d y and d z \
      &= f_z thin d z and d x and d y - g_x thin d x and d y and d z \
      &= (f_z - g_x) thin d x and d y and d z. $
  Ricordiamo che termini come $d x and d x and d y$ o $d y and d x and d y$ sono nulli in quanto si ripete due volte lo stesso differenziale.
  Invece $d z and d x and d y = d x and d y and d z$ perché si tratta di una permutazione pari (due trasposizioni). Si avrebbe invece $d x and d z and d y = - d x and d y and d z$.
]

#definition[
  Diremo che una $k$-forma $omega$ di classe $C^1$ è _chiusa_ se $d omega = 0$. Diremo che una $k$-forma $omega$ di classe $C^0$ è _esatta_ se esiste una $(k-1)$-forma $eta$ di classe $C^1$ tale che $d eta = omega$.
]

Abbiamo già visto sulle $1$-forme che se $omega = d f$ (cioè $omega$ è esatta) allora $d omega = d(d f) = 0$ (cioè $omega$ è chiusa).
Dagli esempi fatti si intuisce che questo è un fatto generale.

#theorem[nilpotenza del differenziale][
  Sia $omega in Omega^k (A)$, $A subset RR^n$, una $k$-forma differenziale di classe $C^2$.
  Allora
  $ d(d omega) = 0. $
]

#proof[
  Grazie alla multilinearità è sufficiente dimostrare il risultato per le forme elementari:
  $ omega = f thin d x_(j_1) and dots and d x_(j_k). $
  Si ha
  $ d omega = d f and d x_(j_1) and dots and d x_(j_k) = sum_(i=1)^n (partial f) / (partial x_i) thin d x_i and d x_(j_1) and dots and d x_(j_k) $
  e
  $ d^2 omega &= d(d omega) = d(sum_(i=1)^n (partial f) / (partial x_i)) thin d x_i and d x_(j_1) and dots and d x_(j_k) \
      &= sum_(i=1)^n sum_(l=1)^n (partial^2 f) / (partial x_l partial x_i) thin d x_l and d x_i and d x_(j_1) and dots and d x_(j_k). $
  Osserviamo ora che se $l=i$ si ha $d x_l and d x_i = 0$ e dunque i termini con $l=i$ sono nulli.
  Inoltre scambiando $d x_l$ con $d x_i$ si ottiene un cambio di segno, dunque possiamo raccogliere i due termini con $d x_l and d x_i$ e con $d x_i and d x_l$ supponendo $l < i$.
  Si ottiene dunque
  $ d^2 omega = sum_(i=2)^n sum_(l=1)^(i-1) ((partial^2 f) / (partial x_l partial x_i) - (partial^2 f) / (partial x_i partial x_l)) d x_l and d x_i and d x_(j_1) and dots and d x_(j_k) = 0 $
  per il teorema di Schwarz sulla commutazione delle derivate parziali seconde.
]

Non dimostriamo (e non useremo) il seguente teorema che però è bene tenere presente.
Ovviamente questa è una estensione del teorema @th:lemma-poincare.

#theorem[lemma di Poincaré multilineare][
  Sia $A subset RR^n$ un aperto stellato e sia $omega in Omega^k (A)$, una $k$-forma di classe $C^1$ tale che $d omega = 0$.
  Allora esiste una $(k-1)$-forma $eta in Omega^(k-1)(A)$ di classe $C^1$ tale che $d eta = omega$.
]

Si dirà che la catena di morfismi
$ 0 thin -->^d thin Omega^0 thin -->^d thin Omega^1 thin -->^d thin dots thin -->^d thin Omega^(n-1) thin -->^d thin Omega^n thin -->^d thin 0 $
è una _successione esatta_, in quanto l'immagine di un morfismo è uguale al nucleo di quello successivo (sugli aperti stellati).

== integrale di una $k$-forma

In generale, se $phi: A subset RR^m -> RR^n$ e se $A$ non è aperto diremo che $phi$ è di classe $C^k$ su $A$ se $phi$ può essere estesa ad una funzione di classe $C^k$ su un aperto contenente $A$.

#definition[integrale di una $k$-forma differenziale][
  Sia $B subset RR^k$ un aperto limitato misurabile, sia $A subset RR^n$ un aperto, sia $phi: B -> A subset RR^n$ una funzione di classe $C^1$ e sia $omega in Omega^k (A)$ una $k$-forma differenziale di classe $C^0$.
  Allora definiamo l'integrale di $omega$ lungo $phi$ come
  $ integral_phi omega := integral_B omega_phi [D phi] $
  dove si intende
  $ integral_B omega_phi [D phi] 
  = integral_B omega_(phi(x)) [(partial phi(x)) / (partial x_1), dots, (partial phi(x)) / (partial x_k)] thin d x. $

  Si noti che questa definizione estende la definizione @def:integrale_forma_1 già data per l'integrazione di una forma differenziale lineare lungo una curva.
]

#lemma[
  Sia $lambda in Lambda^k (RR^n)$ e sia $M$ una matrice $n times n$ ed $A$ una matrice $n times k$.
  Allora
  $ lambda[A M] = lambda[A] dot det M. $
  Si intende che $lambda[X] = lambda[X^1, dots, X^k]$ dove $X^1, dots, X^k$ sono le colonne della matrice $X$.
] <lm:549867>

#proof[
  Osserviamo che l'applicazione multilineare che manda le $k$ colonne di $M$ in $lambda[A M]$ è un'applicazione multilineare alternante.
  Infatti scambiando due colonne di $M$ si ottiene uno scambio corrispondente nelle due colonne di $A M$ ed essendo $lambda$ alternante si ottiene un cambio di segno nel risultato.
  La linearità rispetto alle colonne di $M$ è ovvia, perché ogni colonna di $A M$ si ottiene applicando $A$ alla corrispondente colonna di $M$ e dunque essendo $A$ lineare e $lambda$ multilineare si ottiene la multilinearità rispetto alle colonne di $M$.

  Per la caratterizzazione assiomatica del determinante sappiamo dunque che fissato $A$ l'applicazione multilineare alternante $M |-> lambda[A M]$ è un multiplo del determinante di $M$ cioè $lambda[A M] = c dot det M$ per qualche $c in RR$.
  Ma sostituendo l'identità al posto di $M$ si ottiene $lambda[A] = c$ da cui il risultato atteso.
]

#theorem[invarianza per riparametrizzazione][
  Siano $B$ e $C$ aperti misurabili limitati di $RR^k$.
  e sia $u: C -> B$ una funzione di classe $C^1$ bigettiva con $det D u > 0$ su tutto $C$.
  Sia $A$ un aperto di $RR^n$ e sia $phi: B -> A$ una funzione di classe $C^1$.
  Sia $omega in Omega^k (A)$ una $k$-forma differenziale di classe $C^0$.
  Allora per ogni $vec(u): [0,1]^k -> A$ di classe $C^1$ si ha
  $ integral_phi omega = integral_(phi compose vec(u)) omega. $
]

#proof[
  Osserviamo che, in base al lemma @lm:549867, si ha
  $ omega[D(phi compose u)] = omega[D phi] dot det D u. $
  Dunque si tratta di applicare il teorema @th:cambio_variabile_generalizzato di cambio di variabile, $x=u(t)$, $d x = |det D u(t)| thin d t = det D u(t) thin d t$ per ottenere
  $ integral_(phi compose vec(u)) omega
      &= integral_C omega_(phi compose u)[D(phi compose u)]
      = integral_C omega_(phi compose u)[D phi] dot det D u \
      &= integral_B omega_phi [D phi] = integral_phi omega. $
]

== pull-back

Se $phi: A subset RR^m -> B subset RR^n$ (con $A$ e $B$ aperti) è una funzione differenziabile e $omega in Omega^k (B)$ possiamo definire il pull-back $phi^* omega in Omega^k (A)$ tramite la formula
$ (phi^* omega)_x [v_1, dots, v_k] = omega_(phi(x))[d phi(x)[v_1], dots, d phi(x)[v_k]]. $

Osserviamo che visto che il pull-back di una composizione è ovviamente la composizione dei pull-back, se $vec(u): C subset RR^k -> B subset RR^m$, $phi: B subset RR^m -> A subset RR^n$ e $omega in Omega^k (A)$ si ha
$ integral_(phi compose vec(u)) omega 
  = integral_C omega_(phi compose vec(u))[D(phi compose vec(u))] 
  = integral_C omega_(vec(u))[D vec(u)] 
  = integral_(vec(u)) phi^* omega. $

#theorem[scambio differenziale e pull-back][
  Sia $phi: A subset RR^m -> B subset RR^n$ una funzione di classe $C^1$ e sia $omega in Omega^k (B)$ una $k$-forma differenziale di classe $C^1$.
  Allora si ha
  $ phi^* (d omega) = d(phi^* omega). $ <eq:pullback-differenziale>
]

#proof[
  Denotiamo con $x_1, dots, x_m$ le coordinate di $RR^m$ e con $y_1, dots, y_n$ le coordinate di $RR^n$ così da avere $vec(y) = phi(vec(x))$.
  Grazie alla multilinearità è sufficiente dimostrare il risultato per le forme elementari:
  $ omega = f thin d y_(j_1) and dots and d y_(j_k). $
  Si ha
  $ phi^* omega &= (f compose phi) thin d phi_(j_1) and dots and d phi_(j_k), \
    d omega &= d f and d y_(j_1) and dots and d y_(j_k) \
      &= sum_(i=1)^n (partial f) / (partial y_i) thin d y_i and d y_(j_1) and dots and d y_(j_k), \
    phi^* (d omega) &= sum_(i=1)^n (partial f) / (partial y_i) compose phi thin d phi_i and d phi_(j_1) and dots and d phi_(j_k), \
    d(phi^* omega) &= d(f compose phi) thin d phi_(j_1) and dots and d phi_(j_k) \
      &= sum_(l=1)^m (partial (f compose phi)) / (partial x_l) thin d x_l and d phi_(j_1) and dots and d phi_(j_k) \
      &= sum_(l=1)^m sum_(i=1)^n ((partial f) / (partial y_i) compose phi) (partial phi_i) / (partial x_l) thin d x_l and d phi_(j_1) and dots and d phi_(j_k) \
      &= sum_(i=1)^n ((partial f) / (partial y_i) compose phi) thin d phi_i and d phi_(j_1) and dots and d phi_(j_k) \
      &= phi^* (d omega). $
]

