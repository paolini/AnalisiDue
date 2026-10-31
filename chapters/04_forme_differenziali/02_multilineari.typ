#import "../../lib.typ": *

= Forme differenziali multilineari

Una funzione $lambda: (RR^n)^k -> RR$, $(v_1, dots, v_k) |-> lambda[v_1, dots, v_k]$ con $v_1, dots, v_k in RR^n$ si dice essere _multilineare_ se per ogni $k$ l'applicazione $v_k |-> lambda[v_1, dots, v_k]$ è lineare e se scambiando due ingressi $v_k$, $v_j$ il risultato cambia segno.

#definition[applicazioni multilineari alternanti][
  Sia $V$ uno spazio vettoriale reale.
  Denotiamo con $Lambda^k (V)$ l'insieme delle applicazioni multilineari alternanti.

  Cioè $lambda in Lambda^k (V)$ se $lambda: V^k -> RR$ e
  + è lineare nella prima entrata:
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
$ (lambda_1 and dots and lambda_k)[v_1, dots, v_k] := sum_(sigma in S_k) (-1)^sigma lambda_1 [v_(sigma(1))] dots lambda_k [v_(sigma(k))] $
dove $S_k$ è l'insieme di tutte le permutazioni degli indici ${1, dots, k}$.
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
  $ hat(lambda)_i := (-1)^(i-1) d x_1 and dots and d x_(i-1) and d x_(i+1) and dots and d x_n $
  con $i=1, dots, n$.
  In pratica $d x_i$ è l'unico differenziale mancante nel prodotto esterno che definisce $hat(lambda)_i$.
  Nell'esempio precedente avevamo $i=3$, $x_1=x$, $x_2=y$, $x_3=z$, $hat(lambda)_1 = d y and d z$, $hat(lambda)_2 = -d x and d z = d z and d x$ e $hat(lambda)_3 = d x and d y$.

  Dunque se $omega in Omega^(n-1)(A)$, $A subset RR^n$, si può scrivere:
  $ omega = sum_(i=1)^n (-1)^i xi_i thin d x_1 and dots and d x_(i-1) and d x_(i+1) and dots and d x_n $
  con $xi: A -> RR^n$.
  Questo sarà il modo standard per rappresentare le $(n-1)$-forme $omega in Omega^(n-1)(A)$, $A subset RR^n$, tramite un campo vettoriale $xi: A -> RR^n$.
]

= Differenziale di una forma

Possiamo definire il _differenziale_ $d omega in Omega^(k+1)(A)$ di una forma differenziale $omega in Omega^k (A)$, definendo il differenziale delle forme _elementari_
$ d(f thin d x_(j_1) and dots and d x_(j_k)) = sum_i (partial f) / (partial x_i) thin d x_i and d x_(j_1) and dots and d x_(j_k). $
Lo si capisce con un esempio.

#example[calcolo del differenziale][
  Sia $omega in Omega(RR^3)$, $omega = f thin d x and d y - g thin d y and d z$ con $f,g: RR^3 -> RR$.
  Allora
  $ d omega
      &= d f and d x and d y - d g and d y and d z \
      &= (f_x thin d x + f_y thin d y + f_z thin d z) and d x and d y - (g_x thin d x + g_y thin d y + g_z thin d z) and d y and d z \
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

= Integrale di una $k$-forma

In generale, se $phi: A subset RR^m -> RR^n$ e se $A$ non è aperto diremo che $phi$ è di classe $C^k$ su $A$ se $phi$ può essere estesa ad una funzione di classe $C^k$ su un aperto contenente $A$.

#definition[integrale di una $k$-forma differenziale][
  Sia $B subset RR^k$ un aperto limitato misurabile, sia $A subset RR^n$ un aperto, sia $phi: B -> A subset RR^n$ una funzione di classe $C^1$ e sia $omega in Omega^k (A)$ una $k$-forma differenziale di classe $C^0$.
  Allora definiamo l'integrale di $omega$ lungo $phi$ come
  $ integral_phi omega := integral_B omega_phi [D phi] $
  dove si intende
  $ integral_B omega_phi [D phi] = integral_B omega_(phi(x)) ((partial phi(x)) / (partial x_1), dots, (partial phi(x)) / (partial x_k)) thin d x. $

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
  Allora per ogni $arrow(u): [0,1]^k -> A$ di classe $C^1$ si ha
  $ integral_phi omega = integral_(phi compose arrow(u)) omega. $
]

#proof[
  Osserviamo che, in base al lemma @lm:549867, si ha
  $ omega[D(phi compose u)] = omega[D phi] dot det D u. $
  Dunque si tratta di applicare il teorema @th:cambio_variabile_generalizzato di cambio di variabile, $x=u(t)$, $d x = |det D u(t)| thin d t = det D u(t) thin d t$ per ottenere
  $ integral_(phi compose arrow(u)) omega
      &= integral_C omega_(phi compose u)[D(phi compose u)]
      = integral_C omega_(phi compose u)[D phi] dot det D u \
      &= integral_B omega_phi [D phi] = integral_phi omega. $
]

= Pull-back

Se $phi: A subset RR^m -> B subset RR^n$ (con $A$ e $B$ aperti) è una funzione differenziabile e $omega in Omega^k (B)$ possiamo definire il pull-back $phi^* omega in Omega^k (A)$ tramite la formula
$ (phi^* omega)_x [v_1, dots, v_k] = omega_(phi(x))[d phi(x)[v_1], dots, d phi(x)[v_k]]. $

Osserviamo che visto che il pull-back di una composizione è ovviamente la composizione dei pull-back, se $arrow(u): C subset RR^k -> B subset RR^m$, $phi: B subset RR^m -> A subset RR^n$ e $omega in Omega^k (A)$ si ha
$ integral_(phi compose arrow(u)) omega = integral_C omega_(phi compose arrow(u))[D(phi compose arrow(u))] = integral_C omega_(arrow(u))[D arrow(u)] = integral_arrow(u) phi^* omega. $

#theorem[scambio differenziale e pull-back][
  Sia $phi: A subset RR^m -> B subset RR^n$ una funzione di classe $C^1$ e sia $omega in Omega^k (B)$ una $k$-forma differenziale di classe $C^1$.
  Allora si ha
  $ phi^* (d omega) = d(phi^* omega). $ <eq:pullback-differenziale>
]

#proof[
  Denotiamo con $x_1, dots, x_m$ le coordinate di $RR^m$ e con $y_1, dots, y_n$ le coordinate di $RR^n$ così da avere $arrow(y) = phi(arrow(x))$.
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

= Superfici parametrizzate

Abbiamo visto che l'integrale $integral_phi omega$ è invariante per riparametrizzazioni.
Questo ci dà l'idea che $phi$ è una rappresentazione di una $k$-superficie orientata, e che dunque sia possibile definire la superficie $S$ rappresentata da $phi$ come una classe di equivalenza di parametrizzazioni equivalenti.
Portiamo oltre questo ragionamento per permettere di definire una superficie dividendola a pezzi e rappresentando ogni pezzo con una parametrizzazione.
In questo modo potremo prendere in considerazione solamente le parametrizzazione definite sul cubo $[0,1]^k$ con l'idea che superfici più generali possono essere ottenute incollando insieme più pezzi rappresentati da parametrizzazioni definite sui cubi.
Ancora più banalmente questo ci permette di considerare superfici non connesse, come ad esempio l'unione di due circonferenze, rappresentando ogni circonferenza tramite una parametrizzazione definita su un intervallo.
Abbiamo anche visto che permutando l'ordine dei parametri di $phi$ si ottiene un cambio di segno nell'integrale (dato dal segno della permutazione), dunque è naturale pensare che due parametrizzazioni che si corrispondono tramite un cambio di variabile con determinante negativo rappresentano la stessa superficie ma con orientazione opposta.
Sarà quindi possibile sommare e sottrarre superfici rappresentate da parametrizzazioni.

Per avere la massima generalità nel riconoscere quando due superfici rappresentate da parametrizzazioni diverse sono in realtà la stessa superficie, decidiamo di identificare due superfici quando il loro integrale è lo stesso contro ogni forma differenziale $omega$.

#definition[$k$-superfici parametrizzate][
  Sia $A subset RR^k$ un compatto misurabile e sia $phi: A -> RR^n$ una funzione di classe $C^1$.
  Denotiamo con $op("current") phi: Omega^k (RR^n) -> RR$ il funzionale lineare definito da
  $ op("current") phi [omega] := integral_phi omega = integral_A phi^* omega. $

  Un funzionale lineare $S: Omega^k (RR^n) -> RR$ si dice essere una $k$-superficie parametrizzata se esistono $phi_1, dots, phi_M : [0,1]^k -> RR^n$ di classe $C^1$ tali che per ogni $omega in Omega^k (RR^n)$ si ha
  $ S = op("current") phi_1 + dots + op("current") phi_M. $

  Scriveremo, in modo più suggestivo,
  $ integral_S omega := S[omega] = sum_(j=1)^M op("current") phi_j [omega] = sum_(j=1)^M integral_(phi_j) omega. $

  Se $B subset RR^(n-1)$ è un compatto misurabile e $f: B -> RR$ è una funzione di classe $C^1$, il grafico di $f$ può essere parametrizzato dalla funzione $phi: B -> RR^n$ definita da $phi(x) = (x,f(x))$ e dunque il grafico di $f$ rappresenta una $(n-1)$-superficie parametrizzata: scriveremo $op("current") f = op("current") phi$ per denotare la superficie rappresentata dal grafico di $f$.

  Se $B subset RR^n$ è un compatto misurabile denotiamo con $op("current") B := op("current") (op("id")|_B)$ la $n$-superficie parametrizzata rappresentata dall'identità $op("id"): B -> RR^n$.
  In pratica si ha $integral_(op("current") B) f thin d x_1 and dots.c and d x_n = integral_B f$ se $f: B -> RR$ è una funzione di classe $C^0$.
]

Chiaramente se $S$ è una $k$-superficie parametrizzata, allora anche $-S$ (cioè il funzionale $omega |-> -S[omega]$) è una $k$-superficie parametrizzata, in quanto basta invertire le orientazioni delle parametrizzazioni $phi_j$ per ottenere il cambio di segno.
Inoltre è chiaro che la somma di due $k$-superfici parametrizzate è ancora una $k$-superficie parametrizzata.
Dunque è possibile sommare e sottrarre $k$-superfici parametrizzate.
Tramite somma ripetuta è anche possibile moltiplicare una $k$-superficie parametrizzata per un numero intero, si otterrà una superficie _con molteplicità_.

#example[la superficie sferica][
  Ci sono molti modi per rappresentare la superficie di una sfera in $RR^3$.
  Ad esempio possiamo considerare la usuale parametrizzazione data da _latitudine_ e _longitudine_, ovvero $psi: [-pi, pi] times [-pi/2, pi/2] -> RR^3$ definita da
  $ psi(theta, phi.alt) = (sin theta cos phi.alt, sin theta sin phi.alt, cos theta) $
  e definire la sfera $S = op("current") psi$.
  Osserviamo che $psi$ è definita su un rettangolo invece che su un quadrato unitario.
  Ma è ovvio che a meno di riparametrizzazione possiamo scrivere $op("current") psi = op("current") psi'$ dove $psi'$ è definita su $[0,1]^2$.

  Anzi, possiamo anche definire la sfera $S$ come somma delle due semisfere ottenute come grafico della funzione $f: B_1 (0) subset RR^2 -> RR$ definita da:
  $ f(x,y) = sqrt(1 - x^2 - y^2). $
  Si potrebbe infatti dimostrare che $S = op("current") psi = op("current") f - op("current") (-f)$.
]

Vogliamo ora definire il _bordo_ $partial S$ di una $k$-superficie parametrizzata $S$.
Per fare questo è sufficiente capire qual è il bordo di un cubo per poi estendere la definizione a tutte le $k$-superfici parametrizzate.

Il cubo $[0,1]^k$ in $RR^k$ ha $2k$ facce ognuna isometrica a $[0,1]^(k-1)$.
Le facce possono essere identificate tramite il loro versore normale uscente dal cubo.
Infatti ogni punto della frontiera topologica $partial [0,1]^k$ in $RR^k$ è un punto che ha tutte le coordinate in $[0,1]$ ma almeno una coordinata è uguale a $0$ o a $1$.
Se una sola delle coordinate è uguale a $0$ o a $1$ allora il punto non si trova su uno spigolo ed è univocamente definito il versore normale uscente dal cubo in quel punto: si tratta del versore $e_k$ (il $k$-esimo vettore della base canonica) se è la $k$-esima coordinata ad essere uguale a $1$ e del versore $-e_k$ se la $k$-esima coordinata è uguale a $0$.

Dunque se $Q^k = op("current")([0,1]^k)$ è la $k$-superficie in $RR^k$ che rappresenta il cubo $[0,1]^k$ è naturale definire il bordo $partial Q^k$ di $Q^k$ come la somma delle superfici che parametrizzano le $2k$ facce del cubo, con l'opportuno segno per tenere conto dell'orientazione (il segno è positivo se il versore normale uscente è $e_k$ e negativo se è $-e_k$).

Definiamo quindi le funzioni $psi_i^compose : [0,1]^(k-1) -> RR^k$ in modo che $+- op("current") psi_i^compose$ sia la faccia del cubo $Q^k$ con versore uscente uguale ad $+- e_i$:
$ psi_i^+ (t_1, dots, t_(k-1)) &= (t_1, dots, t_(i-1), 1, t_i, dots, t_(k-1)), \
  psi_i^- (t_1, dots, t_(k-1)) &= (t_1, dots, t_(i-1), 0, t_i, dots, t_(k-1)) $
e poniamo
$ partial Q^k := sum_(i=1)^k (-1)^(i-1) (op("current") psi_i^+ - op("current") psi_i^-). $

Ad esempio per $k=2$ il quadrato $Q^2$ ha quattro lati parametrizzati da $psi_1^+ (t) = (1,t)$ (lato superiore percorso verso destra), $psi_1^- (t) = (0,t)$ (lato inferiore percorso verso destra), $psi_2^+ (t) = (t,1)$ (lato destro percorso verso l'alto) e $psi_2^- (t) = (t,0)$ (lato sinistro percorso verso l'alto).
Notiamo che i segni che abbiamo scelto nella definizione di $partial Q^2$ corrispondono a considerare una orientazione antioraria dei lati del quadrato:
$ partial Q^2 = op("current") psi_1^+ - op("current") psi_1^- - op("current") psi_2^+ + op("current") psi_2^-. $

Nel caso $k=3$ il cubo $Q^3$ ha sei facce parametrizzate da $psi_1^+ (t_1,t_2) = (1,t_1,t_2)$, $psi_1^- (t_1,t_2) = (0,t_1,t_2)$, $psi_2^+ (t_1,t_2) = (t_1,1,t_2)$, $psi_2^- (t_1,t_2) = (t_1,0,t_2)$, $psi_3^+ (t_1,t_2) = (t_1,t_2,1)$ e $psi_3^- (t_1,t_2) = (t_1,t_2,0)$.
In questo caso si ha
$ partial Q^3 = op("current") psi_1^+ - op("current") psi_1^- - op("current") psi_2^+ + op("current") psi_2^- + op("current") psi_3^+ - op("current") psi_3^-. $
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
Si può verificare che il dominio di $psi$ ha forma di una croce e che $psi$ è continua. Sarà $op("current") psi = partial Q^3$ (si veda la @fig:sviluppocubo).

#figure(
  [ _[Diagramma: Sviluppo del bordo del cubo con i sei quadrati che rappresentano le sei facce del cubo]_ ],
  caption: [
    Il dominio della funzione $psi$ definita nella @eq:defpsicubo è lo sviluppo del bordo del cubo con i sei quadrati che rappresentano le sei facce del cubo.
  ],
) <fig:sviluppocubo>

#definition[bordo di una $k$-superficie parametrizzata][
  Sia $S$ una $k$-superficie parametrizzata, cioè
  $ S = sum_(j=1)^M op("current") phi_j $
  con $phi_j : [0,1]^k -> RR^n$ di classe $C^1$.
  Definiamo la $(k-1)$-superficie parametrizzata $partial S$ come:
  $ partial S = sum_(j=1)^M sum_(i=1)^k (-1)^(i-1) (op("current") (phi_j compose psi_i^+) - op("current") (phi_j compose psi_i^-)). $
]

#theorem[teorema della divergenza per il cubo][
  Sia $xi: [0,1]^k -> RR^k$ un campo vettoriale di classe $C^1$.
  Allora si ha
  $ integral_([0,1]^k) op("div") xi = sum_(i=1)^n integral_([0,1]^(k-1)) (xi_i compose psi_i^+ - xi_i compose psi_i^-). $
  Si osservi che $+- xi_i compose psi_i^compose$ corrisponde al prodotto scalare $xi dot (+- e_i)$ tra il campo vettoriale $xi$ e il vettore $+- e_i$ che non è altro che il versore normale alla superficie della faccia parametrizzata da $psi_i^compose$ dunque l'integrale sul lato destro dell'uguaglianza corrisponde all'integrale del flusso di $xi$ attraverso la frontiera del cubo.
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
  Grazie alla linearità è sufficiente dimostrare il risultato quando $S = op("current") phi$ con $phi: [0,1]^k -> RR^n$ di classe $C^1$.
  Allora osserviamo che $phi^* omega$ è una $(k-1)$-forma differenziale su $[0,1]^k$ e dunque si rappresenta tramite un campo vettoriale $xi: [0,1]^k -> RR^k$ con la proprietà:
  $ phi^* omega &= sum_(i=1)^k (-1)^(i-1) xi_i thin d x_1 and dots and d x_(i-1) and d x_(i+1) and dots and d x_k \
    phi^* (d omega) &= d(phi^* omega) = (op("div") xi) thin d x_1 and dots and d x_k. $
  Stiamo usando la notazione $x_1, dots, x_k$ per le coordinate di $[0,1]^k$, mentre useremo le coordinate $t_1, dots, t_(k-1)$ per le coordinate di $[0,1]^(k-1)$.
  Si ha dunque, usando il teorema precedente,
  $ integral_S d omega
      &:= integral_phi d omega
      = integral_([0,1]^k) phi^* (d omega)
      = integral_([0,1]^k) op("div") xi
      = sum_(i=1)^n integral_([0,1]^(k-1)) (xi_i compose psi_i^+ - xi_i compose psi_i^-) $
  Osserviamo ora che se $i != j$ si ha
  $ (d psi_i^compose)_1 and dots and (d psi_i^compose)_(j-1) and (d psi_i^compose)_(j+1) and dots and (d psi_i^compose)_k = 0 $
  (in quanto $(psi_i^compose)_i$ è costante e quindi ha derivata nulla) e dunque, posto $(x_1, dots, x_k) = psi_i^compose (t_1, dots, t_(k-1))$, si ha
  $ (psi_i^compose)* (phi^* omega)
      &= sum_(j=1)^(k-1) (-1)^(j-1) (xi_j compose psi_i^compose) (d psi_i^compose)_1 and dots and (d psi_i^compose)_(j-1) and (d psi_i^compose)_(j+1) and dots and (d psi_i^compose)_k \
      &= (-1)^(i-1) (xi_i compose psi_i^compose) thin d t_1 and dots and d t_(k-1) $
  da cui
  $ integral_(psi_i^compose) phi^* omega
      &= integral_([0,1]^(k-1)) (psi_i^compose)* (phi^* omega)
      = (-1)^(i-1) integral_([0,1]^(k-1)) (xi_i compose psi_i^compose) $
  e quindi
  $ integral_(partial S) omega
      &:= sum_(i=1)^n (-1)^(i-1) (integral_(psi_i^+) phi^* omega - integral_(psi_i^-) phi^* omega)
      = integral_S d omega. $
]