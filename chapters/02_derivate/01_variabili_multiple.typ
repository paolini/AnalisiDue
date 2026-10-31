#import "../../lib.typ": *

= Funzioni di più variabili

Uno degli argomenti principali del secondo corso di Analisi Matematica è lo studio delle funzioni di più variabili.
Il nostro ambiente di studio privileged sarà lo spazio vettoriale reale di dimensione $n$.
Si considera assimilata la conoscenza degli spazi vettoriali di dimensione finita.
In particolare si considera come fatto noto che ogni spazio vettoriale reale di dimensione $n$ è isomorfo a $RR^n$.
Spesso lo spazio vettoriale sarà naturalmente dotato di prodotto scalare (spazio euclideo) e, anche in questo caso, sappiamo che è possibile identificare il prodotto scalare dello spazio euclideo con il prodotto scalare canonico di $RR^n$.
Dal prodotto scalare si ottiene la norma euclidea, che induce una metrica e quindi una topologia.

Riprendiamo brevemente questi concetti.

#definition[
  L'insieme $RR^n$ è l'insieme delle $n$-uple (ordinate) di numeri reali $x = (x_1, dots, x_n)$.
  Le operazioni di addizione e di moltiplicazione per uno scalare $t in RR$ sono definite come segue:
  $ x + y &= (x_1+y_1, dots, x_n+y_n) \
    t x &= (t x_1, dots, t x_n). $
  Con queste operazioni $RR^n$ risulta essere uno spazio vettoriale reale di dimensione $n$.

  Possiamo definire il prodotto scalare canonico di $RR^n$ come segue:
  $ x dot y = x_1 y_1 + dots + x_n y_n. $
  La norma euclidea di $x$ è definita come
  $ |x| = sqrt(x dot x) = sqrt(x_1^2 + dots + x_n^2). $
]

Quando $n=2$ o $n=3$ può essere comodo (e certamente è usuale) nominare le coordinate di $RR^2$ come $x$ e $y$ e le coordinate di $RR^3$ come $x$, $y$ e $z$ (invece che $(x_1,x_2)$ e $(x_1,x_2,x_3)$).

Considereremo funzioni con dominio in $A subset RR^n$ e codominio $RR^m$.
Scriveremo $f: A subset RR^n -> RR^m$.
Avremo quindi $y = f(x)$ con $x = (x_1, dots, x_n) in A$ e $y = (y_1, dots, y_m) in RR^m$.
Nel caso $m=1$ la funzione si dice scalare, mentre nel caso $m>1$ la funzione si dice vettoriale.
Nel caso $n=1$ la funzione si dice di una variabile, mentre nel caso $n>1$ la funzione si dice di più variabili ($n$ variabili per la precisione).
Una funzione vettoriale $f$ può essere identificata con una $m$-upla di funzioni scalari $f_1, dots, f_m$ definite su $A$:
$ f(x_1, dots, x_n) = mat(
  f_1(x_1, dots, x_n);
  dots.v;
  f_m(x_1, dots, x_n)
). $

Se $I subset RR$ è un intervallo, una funzione $u: I subset RR -> RR^n$ si chiama _curva_.
Se pensiamo a $t in I$ come il _tempo_, la funzione $t |-> u(t)$ rappresenta la dinamica di un punto che si muove nello spazio $RR^n$.
L'immagine della funzione $u(I) = {u(t) : t in I}$ si chiama _traiettoria_ del punto $u(t)$ o _supporto_ della curva $u$.
A volte si denota con $[u]$.

Se ad esempio fissiamo un punto $x_0 in RR^n$ e un vettore $v in RR^n$, la curva $u(t) = x_0 + t v$ rappresenta il moto rettilineo uniforme di un punto che al tempo $t=0$ si trova in posizione $x_0$ e che si muove con velocità $v$.
Il supporto di $u$ è in questo caso una retta passante per $x_0$ con direttrice $v$.

Per ricondursi allo studio di funzioni di una variabile è spesso utile studiare la composizione della funzione di più variabili con opportune curve.
Se $f: A subset RR^n -> RR^m$ e $u: I subset RR -> A subset RR^n$ possiamo considerare la funzione $g: I -> RR^m$ data da $g(t) = f(u(t))$.
Si avrà $g = (g_1, dots, g_m)$ con $g_k(t) = f_k(u(t))$ dove $f = (f_1, dots, f_m)$.
In definitiva le funzioni $g_k: I subset RR -> RR$ sono funzioni scalari di una variabile, e le possiamo studiare come si è fatto nel corso di Analisi Matematica Uno.

#example[funzioni lineari][
  Fissato $w in RR^n$ consideriamo la funzione lineare $f: RR^n -> RR$ definita da
  $ f(x) = (x, w). $
  Fissato $q in RR^n$ e $v in RR^n$ consideriamo la retta (parametrizzata da) $u(t) = t v + q$.
  Si avrà allora
  $ f(u(t)) = (t v + q, w) = t (v, w) + (q, w). $
  Si osserva ad esempio che se $v$ è ortogonale a $w$, cioè $(v, w)=0$, si ha $f(u(t))= (q, v)$ è costante.
  Abbiamo trovato una _curva di livello_, cioè una curva su cui $f$ risulta costante.
]

= Continuità e limiti

La norma euclidea definisce una metrica e quindi una topologia su $RR^n$.

#definition[topologia][
  Dato $x in RR^n$ e $rho>0$, la palla aperta di raggio $rho$ centrata in $x$ è
  $ B_rho (x) = {y in RR^n : |y - x| < rho}. $

  Se esiste $rho>0$ per cui $B_rho (x) subset A$, diremo che $x$ è un punto interno di $A$ e diremo che $A$ è un intorno di $x$.
  Possiamo dunque definire la famiglia di intorni di $x$ come segue:
  $ cal(U)_x = {U subset RR^n : exists rho>0 : B_rho (x) subset U}. $

  La _parte interna_ di $A$ è l'insieme dei punti interni di $A$.
  Un sottoinsieme $A subset RR^n$ si dice aperto se è intorno di ogni suo punto.

  Un sottoinsieme $A subset RR^n$ si dice chiuso se il suo complementare $RR^n without A$ è aperto.

  Un punto $x in RR^n$ si dice essere un punto di accumulazione per $A$ se ogni intorno di $x$ contiene almeno un punto di $A$ diverso da $x$.
]

Una successione $a_k in RR^n$ è una funzione $a: NN -> RR^n$.
Ogni punto $a_k$ è una $n$-upla: $a_k = ((a_k)_1, dots, (a_k)_n) in RR^n$.

Una successione $a_k$ converge ad un punto $x in RR^n$ se $|a_k - x| -> 0$.
Scriveremo in tal caso $a_k -> x$ (per $k -> +infinity$).
Notiamo che $|a_k - x|$ è una successione di numeri reali non negativi, e dunque l'abbiamo già studiata nel corso di _Analisi Matematica Uno_.
In particolare, se espandiamo la definizione di limite, si vede che $a_k -> x$ significa:
$ forall epsilon>0 quad exists N in NN quad forall k >= N : |a_k - x| < epsilon. $

#definition[continuità][
  Sia $f: A subset RR^n -> RR^m$.
  Fissato $x_0 in A$ diremo che $f$ è _continua_ nel punto $x_0$ se
  $ forall epsilon>0 quad exists delta>0 quad forall x in A : |x - x_0| < delta => |f(x) - f(x_0)| < epsilon. $

  Una funzione si dice essere _sequenzialmente continua_ nel punto $x_0$ se per ogni successione $a_k in A$ con $a_k -> x_0$ si ha $f(a_k) -> f(x_0)$.

  Una funzione $f: A subset RR^n -> RR^m$ si dice essere continua (o sequenzialmente continua) se è continua (o sequenzialmente continua) in ogni punto $x in A$.
]

#theorem[equivalenza tra continuità e continuità sequenziale][
  Sia $f: A subset RR^n -> RR^m$ e sia $x_0 in A$.
  Allora $f$ è continua in $x_0$ se e solo se $f$ è sequenzialmente continua in $x_0$.
]

#proof[
  La dimostrazione è la stessa già vista nel corso di Analisi Matematica Uno.
]

#theorem[continuità della funzione composta][
  Sia $f: A subset RR^n -> B subset RR^k$ una funzione continua (nel punto $x_0 in A$) e sia $g: B subset RR^k -> RR^m$ una funzione continua (nel punto $y_0=f(x_0) in B$).
  Allora la composizione $g compose f: A subset RR^n -> RR^m$ è continua (nel punto $x_0$).
]

#proof[
  La dimostrazione è la stessa già vista nel corso di Analisi Matematica Uno.
]

= Differenziale

Se $V$ e $W$ sono spazi vettoriali denotiamo con $cal(L)(V,W)$ lo spazio vettoriale delle funzioni lineari e continue da $V$ in $W$.
Se $V$ ha dimensione finita non serve richiedere la continuità, che è sempre garantita dal seguente.

#theorem[continuità delle applicazioni lineari][
  Ogni applicazione lineare $L: RR^n -> RR^m$ è continua.
] <th:lineare_continua>

#proof[
  Sia $e_1, dots, e_n$ la base canonica di $RR^n$.
  Consideriamo
  $ M = max({|L[e_1]|, dots, |L[e_n]|}). $
  Si ha allora, per ogni $x in RR^n$,
  $ |L[x]| = |L[x_1 e_1 + dots + x_n e_n]| <= |x_1 L[e_1]| + dots + |x_n L[e_n]| <= n M |x|. $
  Dunque per $x -> 0$ si ha $|L[x]| -> 0$.
  Significa che $L$ è continua in $0$.

  Ma in ogni altro punto si ha
  $ L[x] - L[x_0] = L[x - x_0] $
  e dunque se $x -> x_0$ si ottiene che $L[x] -> L[x_0]$.
]

#definition[norma operatoriale][
  Sia $L: RR^n -> RR^m$ una applicazione lineare.
  Definiamo la _norma_ di $L$ come:
  $ norm(L) = sup({|L[x]| : |x| <= 1}). $

  Si noti che essendo $L[v]-L[w] = L[v-w]$ per linearità di $L$, la costante $norm(L)$ non è altro che la costante di Lipschitz di $L$.
]

#theorem[proprietà della norma operatoriale][
  Sia $L: V -> W$ una applicazione lineare.
  Allora
  + $norm(L) < +infinity$;
  + $norm(t L) = |t| dot norm(L)$ per ogni $t in RR$;
  + $norm(L+M) <= norm(L) + norm(M)$ per ogni $M in cal(L)(RR^n,RR^m)$;
  + se $norm(L) = 0$ allora $L=0$;
  + $norm(L)$ è la costante ottimale per cui vale la stima:
    $ |L[v]| <= norm(L) dot |v|, quad forall v in RR^n, $ <eq:stima_norma_operatoriale>
    inoltre esiste $v in RR^n$ per cui vale l'uguaglianza;
  + se $M in cal(L)(W,U)$ è un'altra applicazione lineare si ha
    $ norm(M compose L) <= norm(M) dot norm(L). $
]

#proof[
  Per il teorema @th:lineare_continua la funzione $|L|$ è continua, dunque per il teorema di Weierstrass ammette massimo sul disco unitario ${x in RR^n : |x| <= 1}$.
  Dunque $norm(L) in RR$ è finito ed è realizzato su un vettore di norma unitaria.
  Se $t in RR$ e $v$ è unitario si ha
  $ |L[t v]| = |t| dot |L[v]| <= |t| dot norm(L) dot |v| = norm(L) dot |t v| $
  da cui si ottiene anche la @eq:stima_norma_operatoriale.
  Ovviamente se $norm(L)=0$ si ottiene $L[v]=0$ per ogni $v in V$ e dunque $L=0$.
  La condizione $norm(L+M) <= norm(L) + norm(M)$ discende direttamente dalle proprietà del $sup$, ricordando che per definizione $(L+M)[v] = L[v] + M[v]$.
  Per l'ultimo punto osserviamo che per ogni $v in RR^n$ si ha
  $ norm(M L[v]) = norm(M[L[v]]) <= norm(M) dot |L[v]| <= norm(M) dot norm(L) |v|. $
  Passando al $sup$ sui $v$ unitari si ottiene il risultato.
]

#definition[differenziale di Fréchet][
  Siano $V$ e $W$ spazi vettoriali normati.
  Sia $f: A subset V -> W$ e sia $x_0 in A$.
  Diremo che $f$ è differenziabile in $x_0$ se esiste $L in cal(L)(V,W)$ tale che
  $ f(x) = f(x_0) + L[x - x_0] + o(|x - x_0|), quad text("per ") x -> x_0. $ <eq:def_differenziale>
  L'applicazione lineare $L$ si chiama _differenziale_ di $f$ nel punto $x_0$ e si denota con $D f(x_0)$.
]

#remark[
  Le notazioni per le derivate delle funzioni di più variabili cambiano a seconda degli ambiti di applicazione in maniera spesso incoerente.
  Invece che $D f(x_0)$ si può usare il simbolo $nabla f(x_0)$ oppure, nell'ambito della geometria differenziale, il simbolo $d f_(x_0)$.
  Cercheremo in questo testo di mantenere una notazione coerente, ma invitiamo il lettore a comprendere che testi diversi possono avere notazioni diverse.
]

#theorem[proprietà delle funzioni differenziabili][
  Sia $f: A subset V -> W$ una funzione differenziabile nel punto $x_0 in A$. Allora
  + $f$ è continua in $x_0$;
  + se $x_0$ è un punto interno di $A$ il differenziale è unico.
]

#proof[
  Visto che le applicazioni lineari sono continue si ha $D f(x_0)[x - x_0] -> 0$ per $x -> x_0$ e dunque dalla definizione @eq:def_differenziale si ottiene che $f(x) - f(x_0) -> 0$ per $x -> x_0$.

  Siano ora $L,M in cal(L)(V,W)$ che soddisfano entrambi la condizione @eq:def_differenziale e sia $v in V$ un qualunque vettore unitario.
  Facendo la differenza si ottiene
  $ (L-M)[x - x_0] = o(|x-x_0|), quad text("per ") x -> x_0. $
  Preso $x = x_0 + t v$ osserviamo che essendo $x_0$ interno ad $A$ avremo che per $t$ sufficientemente piccolo si ha effettivamente $x in A$.
  Dunque, per $t -> 0$ si ha $x -> x_0$ e quindi
  $ (L-M)[t v] = o(|t| dot |v|) = o(t) = t o(1) $
  da cui
  $ (L-M)[v] = o(1). $
  Visto che il lato sinistro non dipende da $t$ significa che $(L-M)[v]=0$ per ogni $v$ unitario.
  Questo significa che $L-M = 0$ ovvero $L=M$.
]

Se $V$ ha dimensione finita, scelta una base $e_1, dots, e_n$ di $V$ è possibile mettere in corrispondenza $V$ con $RR^n$ tramite un isomorfismo che associa ad ogni $v in V$ la $n$-upla delle sue coordinate $x=(x_1, dots, x_n)$ rispetto alla base scelta.
Per questo non è riduttivo supporre che dominio e codominio siano $V=RR^n$ e $W=RR^m$, nel qual caso le coordinate coincidono con i vettori.
Se $f: RR^n -> RR^m$ per ogni $x in RR^n$ l'applicazione lineare $D f(x): RR^n -> RR^m$ si identifica con una matrice $m times n$ che con lieve abuso di notazione denoteremo sempre con $D f(x_0)$ (potremmo usare la notazione $d f_(x_0)$ per denotare specificatamente l'applicazione lineare).
Dunque $D f(x_0)[v] = D f(x_0) v$ si può intendere come prodotto matrice/vettore.
La matrice $D f$ si chiama _matrice Jacobiana_ e a volte si denota con $J_f (x_0)$.

Nel caso $m=1$, cioè $f: RR^n -> RR$, la matrice Jacobiana è formata da una singola riga e si identifica quindi con un vettore di $RR^n$.
Tale vettore si chiama _gradiente_ di $f$ e si indica con $nabla f(x)$.
Si ha dunque
$ D f(x) v = chevron.l nabla f(x), v chevron.r. $

In generale se $f: RR^n -> RR^m$ si può scrivere $f = (f_1, dots, f_m)$ con $f_k: RR^n -> RR$ e si troverà quindi che le righe della matrice $D f$ jacobiana di $f$ sono i vettori gradiente $nabla f_1, dots, nabla f_m$.

Nel caso $n=1$, cioè $f: A subset RR -> RR^m$, $x in A$, la matrice Jacobiana è formata da una singola colonna che si denota con $f'(x) in RR^n$.
Il differenziale si scrive nella forma $D f(x)[h] = h f'(x_0)$.
La definizione di differenziale diventa
$ f(x) = f(x_0) + f'(x_0) dot (x-x_0) + o(x-x_0) $
che è equivalente a
$ (f(x) - f(x_0)) / (x-x_0) = f'(x_0) + o(1) $
cioè la definizione di derivata vista nel corso di Analisi Matematica Uno.
Per le funzioni di una variabile _differenziabile_ è quindi equivalente a _derivabile_.

#example[
  Si consideri la funzione $f: RR^2 -> RR$, $f(x,y)=(x-1)(y+2)$.
  Si ha
  $ f(x,y) = -2 + 2x - y + x y = f(0,0) + chevron.l (2,-1), (x,y) chevron.r + x y. $
  Visto che $|x y| <= x^2+y^2 = o(sqrt(x^2+y^2))$ abbiamo verificato che $f$ è differenziabile nel punto $(0,0)$ e che $nabla f(0,0) = (2,-1)$.
] <ex:48993>

#theorem[differenziale della composizione][
  Sia $f: A subset RR^n -> B subset RR^k$, $g: B subset RR^k -> RR^m$, $x_0 in A$.
  Se $f$ è differenziabile in $x_0$ e $g$ è differenziabile in $y_0 = f(x_0)$ allora la funzione composta $g compose f: A subset RR^n -> RR^m$ è differenziabile in $x_0$ e si ha
  $ D (g compose f)(x_0) = D g(y_0) D f(x_0). $
  Dove il prodotto a secondo membro indica la composizione delle applicazioni lineari ovvero il prodotto delle matrici corrispondenti.
]

#proof[
  Facendo il cambio di variabile $y = f(x)$ nella formula @eq:def_differenziale applicata a $g$ nel punto $y_0$ e inserendo la formula corrispondente per $f$ nel punto $x_0$ si ottiene
  $ g(f(x))
      &= g(y_0) + D g(y_0)[f(x)-f(x_0)] + o(|f(x)-f(x_0)|) \
      &= g(y_0) + D g(x_0)[D f(x_0)[x - x_0] + o(|x - x_0|)] + o(|D f(x_0)[x - x_0] + o(|x - x_0|)|) \
      &= g(f(x_0)) + D g(x_0)[D f(x_0)[x - x_0]] + (norm(D g(x_0)) + norm(D f(x_0)) + 1) dot o(|x - x_0|) $
  che è la condizione di differenziabilità per $g compose f$ nel punto $x_0$ con differenziale $D g(y_0) D f(x_0)$.
]

== Derivata direzionale

Nel caso particolare in cui $f: A subset RR^n -> RR^m$ e $u: I subset RR -> A subset RR^n$, la formula per la derivata della funzione composta diventa
$ d / (d t) f(u(t)) = D f(u(t))[u'(t)] $
che nel caso $m=1$ si può anche scrivere usando il gradiente
$ d / (d t) f(u(t)) = chevron.l nabla f(u(t)), u'(t) chevron.r. $

Dato $v in RR^n$ possiamo considerare la retta con direzione $v$ passante per un punto $x in RR^n$: $u(t) = x + t v$.
Definiamo allora la _derivata direzionale_ di $f$ nel punto $x$ in direzione $v$ come la derivata della funzione composta:
$ (partial f) / (partial v) (x) = lr([(d / (d t) f(u(t)))])_(t=0). $
È possibile che la derivata direzionale esista anche se la funzione $f$ non è differenziabile, perché questa definizione coinvolge i valori della funzione solamente sulla retta scelta.
Ma se $f$ è differenziabile in $x$, visto che $u(t)= x + t v$ è derivabile con derivata $u'(t) = v$ si ha
$ (partial f) / (partial v) (x) = D f(x) [v]. $
E nel caso scalare $m=1$:
$ (partial f) / (partial v) (x) = chevron.l nabla f(x), v chevron.r. $

#example[
  Si consideri la funzione $f(x,y) = (x-1)(y+2)$.
  Scelto $v=(alpha,beta) in RR^2$ possiamo calcolare
  $ (partial f) / (partial v)(0,0)
      &= lr([d / (d t) ((alpha t-1)(beta t+2))])_(t=0) \
      &= lr([d / (d t) (-2 + (2alpha-beta)t + alpha beta t^2)])_(t=0) \
      &= lr([2alpha-beta + 2alpha beta t])_(t=0) = 2alpha-beta. $
  Effettivamente sapendo dall'esempio @ex:48993 che $nabla f(0,0) = (2,-1)$ si verifica che
  $ 2alpha - beta = chevron.l nabla f(0,0), (alpha,beta) chevron.r. $
]

#example[
  Si consideri la funzione $f: RR^2 -> RR$ definita da
  $ f(x,y) = cases(
    (x^2 y) / (x^2+y^2) &text("se ") (x,y) != (0,0),
    0 &text("se ") (x,y)=(0,0).
  ) $
  Se fissiamo un qualunque vettore $v=(alpha,beta)$ possiamo facilmente calcolare la derivata direzionale nel punto $(0,0)$:
  $ (partial f) / (partial v)(0,0)
      &= lr([d / (d t) f(alpha t, beta t)])_(t=0) \
      &= lr([d / (d t) ((alpha^2 beta) / (alpha^2+beta^2) t)])_(t=0) \
      &= (alpha^2 beta) / (alpha^2+beta^2). $
  Osserviamo che in questo caso $(partial f) / (partial v)$ non è lineare in $v$ e quindi $f$ non può essere differenziabile in $(0,0)$.
]

== Derivate parziali

Si capisce che per determinare il differenziale di una funzione differenziabile è sufficiente calcolare le derivate direzionali lungo gli $n$ vettori di una base.
In particolare se si scelgono i vettori della base canonica si ottengono le cosiddette _derivate parziali_:
$ (partial f) / (partial x_k) = (partial f) / (partial e_k) = lr([d / (d t) f(x + t e_k)])_(t=0) = d / (d x_k) f(x_1, dots, x_k, dots, x_n) $
Calcolare le derivate parziali è molto semplice perché si tratta di derivare la funzione $x_k |-> f(x_1, dots, x_n)$ come se fosse una funzione di una sola variabile, $x_k$, mentre le altre variabili $x_j$ con $j != k$ vanno considerate costanti.

Se poi scriviamo $f = (f_1, dots, f_m)$ possiamo quindi determinare tutte le componenti della matrice jacobiana:
$ (D f(x))_(j k) = D f_j (x) e_k = chevron.l nabla f_j(x), e_k chevron.r = (d f_j)_x [e_k] = (partial f_j) / (partial x_k)(x). $
Dunque
$ D f(x) = mat(
  (partial f_1) / (partial x_1), dots, (partial f_1) / (partial x_n);
  dots.v, dots.down, dots.v;
  (partial f_m) / (partial x_1), dots, (partial f_m) / (partial x_n)
) $
e nel caso $m=1$
$ nabla f (x) = mat(
  (partial f) / (partial x_1);
  dots.v;
  (partial f) / (partial x_n)
). $

Useremo anche una notazione più compatta che utilizza gli indici per le derivate parziali:
$ f_(x_k) = (partial f) / (partial x_k). $

Le derivate parziali sono uno strumento molto efficace per calcolare le componenti del differenziale di una funzione di più variabili.
Il problema è che l'esistenza delle derivate parziali non garantisce la differenziabilità.
Risulta quindi molto utile il seguente.

#theorem[del differenziale][
  Sia $A subset RR^n$ aperto e sia $f: A -> RR^m$ una funzione tale che per ogni $x in A$ esistono tutte le derivate parziali $(partial f_k) / (partial x_j)$ (la funzione è _derivabile_).
  Supponiamo inoltre che le derivate parziali siano tutte continue.
  Allora $f$ è differenziabile in ogni punto.
]

#proof[
  _Passo 1:_ facciamo il caso $n=2$, $m=1$.
  Scriveremo $(x,y)$ al posto di $x$ e $(x_0,y_0)$ al posto di $x_0$.
  Il vettore obliquo $(x,y)-(x_0,y_0)$ può essere decomposto nella somma dei due vettori paralleli agli assi coordinati $(x,y)-(x_0,y)$ e $(x_0,y)-(x_0,y_0)$.
  Alla funzione ristretta alle direzioni orizzontale e verticale possiamo applicare il teorema di Lagrange per ottenere
  $ f(x,y) - f(x_0,y_0)
      &= f(x,y) - f(x_0,y) + f(x_0,y) - f(x_0,y_0) \
      &= f_x (tilde(x),y) dot (x-x_0) + f_y (x_0,tilde(y)) dot (y-y_0) $
  con $tilde(x) in (x_0,x)$ e $tilde(y) in (y_0,y)$.
  I valori di $tilde(x)$ e $tilde(y)$ dipendono da $x$ e da $y$, ma tendono rispettivamente a $x_0$ e $y_0$ quando $(x,y) -> (x_0,y_0)$.
  Vogliamo dimostrare che $f$ è differenziabile in $(x_0,y_0)$.
  Se lo è, necessariamente il suo differenziale si scriverà nella forma $d f [h,k] = h f_x + k f_y$.
  La formula @eq:def_differenziale diventa quindi per $(x,y) -> (x_0,y_0)$
  $ &f(x,y) - f(x_0,y_0) - f_x (x_0,y_0) dot (x-x_0) - f_y (x_0,y_0) dot (y-y_0) \
      &= (f_x (x_0,y_0) - f_x (tilde(x), y)) (x-x_0) + (f_y (x_0,y_0) - f_y (x_0,tilde(y))) (y-y_0) \
      &= o(1) dot (x-x_0) + o(1) dot (y-y_0) $
  in quanto per l'ipotesi di continuità delle derivate parziali le parentesi quadre tendono a zero quando $(x,y) -> (x_0,y_0)$.
  Osservando infine che $|x-x_0|, |y-y_0| <= sqrt((x-x_0)^2 + (y-y_0)^2)$ si ottiene il risultato voluto.

  _Passo 2:_ $n>2$, $m=1$.
  Si procede esattamente come nel passo 1, salvo che per passare dal punto $x_0$ al punto $x$ bisogna seguire $n$ segmenti paralleli agli assi su ognuno dei quali si applica il teorema di Lagrange.

  _Conclusione._ Se $m>1$ basta applicare il risultato alle componenti $f_1, dots, f_m$ di $f$ e osservare che la formula @eq:def_differenziale è equivalente alle $m$ formule:
  $ f_k(x) = f_k(x_0) + (d f_k)_(x_0)[x-x_0] + o(|x-x_0|). $
]

#example[
  Si consideri la funzione $f(x,y) = (x-1)(y+2)$.
  Allora si ha
  $ f_x (x,y) = d / (d x) f(x,y) = y + 2, quad f_y (x,y) = d / (d y) f(x,y) = x - 1. $
  Visto che le derivate parziali sono continue la funzione risulta essere differenziabile e $nabla f(x,y) = (y+2,x-1)$.
]

#example[
  Si consideri la funzione $f(x,y) = (x-1)(y+2)$ e la curva $u(t) = (t, t^2)$.
  Si ha
  $ d / (d t) f(u(t)) = ((t-1)(t^2+2))' = (t^3 - t^2 + 2t - 2)' = 3t^2 - 2t + 2. $
  Tralasciando le dipendenze si scriverà più semplicemente $f = (x-1)(y+2)$, $x=t$, $y=t^2$.
  La formula per la derivata della funzione composta diventa quindi
  $ (d f) / (d t)
      &= (partial f) / (partial x) dot (d x) / (d t) + (partial f) / (partial y) dot (d y) / (d t) \
      &= (y+2) + (x-1) 2t = t^2 + 2 + (t - 1) 2t \
      &= 3t^2 - 2t + 2. $

  Visto che $x=t$ possiamo anche più direttamente scrivere $y=x^2$.
  In tal caso si scriverà
  $ (d f) / (d x)
      &= (partial f) / (partial x) + (partial f) / (partial y) dot (d y) / (d x) \
      &= (y+2) + (x-1) 2x = x^2 + 2 + (x - 1) 2x \
      &= 3x^2 - 2x + 2. $
  e si capisce quindi la necessità di distinguere tra derivata parziale $(partial f) / (partial x)$ e derivata totale $(d f) / (d x)$.
]

= Derivate successive

In generale possiamo definire il differenziale di una funzione $f: V -> W$ definita tra due spazi vettoriali normati $V$ e $W$.
Il differenziale risulta essere allora una funzione $d f: V -> cal(L)(V,W)$ che manda ogni punto $x in V$ in cui la funzione è differenziabile nell'applicazione lineare e continua $D f(x) in cal(L)(V,W)$.
Lo spazio $cal(L)(V,W)$ risulta a sua volta essere uno spazio normato (dalla norma operatoriale).
È quindi possibile iterativamente differenziare il differenziale.

Nel caso in cui $W = RR$ si definisce $V' = cal(L)(V,RR)$ (lo spazio duale) e dunque il differenziale $D f$ è a sua volta una funzione $D f: V -> V'$.
Lo spazio duale può essere messo in corrispondenza con $V$ se rappresentiamo ogni $L in V'$ mediante un vettore $xi in V$ tramite il prodotto scalare su $V$: $L[v] = chevron.l xi, v chevron.r$.
Il vettore di $V$ che rappresenta il differenziale è il gradiente $nabla f$: $D f(x)[v] = chevron.l nabla f, v chevron.r$.
Il differenziale del differenziale in ogni punto è una funzione lineare $D^2 f(x) in cal(L)(V,V')$ ovvero $D^2 f: V -> cal(L)(V,V')$.
Un elemento di $cal(L)(V,V')$ rappresenta una forma bilineare perché ad ogni $v in V$ viene associata una applicazione lineare che ad ogni $w in V$ restituisce uno scalare:
$ D^2 f(x)[v,w] = chevron.l D^2 f(x)[v], w chevron.r = (partial^2 f) / (partial w partial v)(x). $
Dunque $D^2 f(x)$ si rappresenta mediante una matrice chiamata _matrice hessiana_ le cui componenti sono
$ (D^2 f(x))_(j k) = D^2 f(x)[e_j,e_k] = (partial^2 f) / (partial x_k partial x_j) $
ovvero
$ D^2 f = mat(
  (partial^2 f) / (partial x_1)^2, dots, (partial^2 f) / (partial x_n dots partial x_1);
  dots.v, dots.down, dots.v;
  (partial^2 f) / (partial x_n partial x_1), dots, (partial^2 f) / (partial x_n)^2
). $

Per le derivate $k$-esime il differenziale $D^k f$ rappresenta una forma $k$-lineare $(v_1, dots, v_k) |-> D^k f(x)[v_1, dots, v_k]$ e si rappresenta mediante un tensore a $k$ indici.

#definition[classi di regolarità][
  Sia $A subset RR^n$ un aperto.
  Definiamo $C^0 (A,RR^m)$ l'insieme delle funzioni continue $f: A -> RR^m$.
  Per induzione si definisce la classe $C^k (A,RR^m)$ delle funzioni che hanno tutte le prime $k$ derivate parziali continue:
  $ C^k (A,RR^m) = {f: A -> RR^m : f_(x_1), dots, f_(x_n) in C^(k-1)(A,RR^m)}. $
  Definiamo inoltre
  $ C^infinity (A, RR^m) = {f: A -> RR^m : f in C^k (A,RR^m) quad forall k in NN}. $

  Si intende poi $C^k (A) = C^k (A,RR)$, $C^infinity (A) = C^infinity (A,RR)$.
]

#theorem[Schwarz][
  Sia $A subset RR^n$ un aperto e sia $f: A subset RR^n -> RR$.
  Fissati $k,j in {1, dots, n}$ supponiamo che in tutti i punti di $A$ esistano le derivate parziali $(partial f) / (partial x_k)$ e $(partial f) / (partial x_j)$ e che a loro volta esistano le derivate seconde miste $(partial^2 f) / (partial x_j partial x_k)$ e $(partial^2 f) / (partial x_k partial x_j)$.
  Supponiamo infine che le derivate seconde miste siano continue in un punto $x_0 in A$. Allora sono uguali:
  $ (partial^2 f) / (partial x_j partial x_k)(x_0) = (partial^2 f) / (partial x_k partial x_j)(x_0). $
]

#proof[
  _Passo 1:_ supponiamo $n=2$ e usiamo le variabili $x,y$ invece che $x_1,x_2$.
  L'idea è che le derivate seconde miste approssimano l'incremento che si ottiene per andare dal punto $(x_0,y_0)$ al punto $(x,y)$ seguendo due diversi percorsi, il primo incrementando prima la $x$ e poi la $y$ e il secondo incrementando prima la $y$ e poi la $x$.
  Consideriamo quindi la seguente identità:
  $ (f(x,y)-f(x_0,y_0)) - (f(x,y_0) - f(x_0,y_0)) = (f(x,y) - f(x,y_0)) - (f(x_0,y) - f(x_0, y_0)) $
  e applichiamo il teorema di Lagrange a sinistra alla funzione $f(x,dot) - f(x_0,dot)$ nell'intervallo $[y_0,y]$ e a destra alla funzione $f(dot,y) - f(dot,y_0)$ nell'intervallo $[x_0,x]$.
  Si ottiene quindi
  $ ((partial f) / (partial y)(x,tilde(y)) - (partial f) / (partial y)(x_0,tilde(y))) (y-y_0) = ((partial f) / (partial x)(tilde(x),y) - (partial f) / (partial x)(tilde(x),y_0)) (x-x_0) $
  per qualche $tilde(x) in (x_0,x)$ e $tilde(y) in (y_0,y)$.
  Applichiamo ora nuovamente il teorema di Lagrange a sinistra sull'intervallo $[x_0,x]$ e a destra sull'intervallo $[y_0,y]$ per ottenere
  $ (partial^2 f) / (partial x partial y)(hat(x),tilde(y)) (x-x_0)(y-y_0) = (partial^2 f) / (partial y partial x)(tilde(x),hat(y)) (y-y_0)(x-x_0) $
  ovvero
  $ (partial^2 f) / (partial x partial y)(hat(x),tilde(y)) = (partial^2 f) / (partial y partial x)(tilde(x),hat(y)) $
  per qualche $hat(x) in (x_0,x)$ e $hat(y) in (y_0,y)$.

  Per $(x,y) -> (x_0,y_0)$ si ha $tilde(x), hat(x) -> x_0$ e $tilde(y), hat(y) -> y_0$ e grazie all'ipotesi di continuità delle derivate seconde miste passando al limite si conclude:
  $ (partial^2 f) / (partial x partial y)(x_0, y_0) = (partial^2 f) / (partial y partial x)(x_0, y_0). $

  _Caso generale._
  Consideriamo la funzione di due variabili ottenuta da $f$ fissando tutte le coordinate diverse da $j$ e $k$ ai valori delle corrispondenti coordinate del punto $x_0$.
  Si può quindi applicare il passo precedente.
]

#example[
  Si consideri la funzione $f(x,y,z) = (x+y^2) sin z$.
  Si ha
  $ f_x = sin z, quad f_y = 2 y sin z, quad f_z = (x+y^2) cos z $
  e
  $ f_(x x) = 0, quad &f_(x y) = 0, quad &f_(x z) = cos z \
    f_(y x) = 0, quad &f_(y y) = 2 sin z, quad &f_(y z) = 2y cos z \
    f_(z x) = cos z, quad &f_(z y) = 2y cos z, quad &f_(z z) = -(x+y^2) sin z. $
  Dunque abbiamo verificato che le derivate seconde commutano: $f_(x y)=f_(y x)$, $f_(x z)=f_(z x)$, $f_(y z)=f_(z y)$ e la matrice hessiana è simmetrica:
  $ D^2 f(x,y) = mat(
    0, 0, cos z;
    0, 2 sin z, 2y cos z;
    cos z, 2y cos z, -(x+y^2) sin z
  ). $
]

#theorem[Formula di Taylor][
  Sia $A subset RR^n$ aperto e sia $f: A subset RR^n -> RR$ una funzione di classe $C^2$.
  Allora fissato $x_0 in A$ si ha, per $x -> x_0$
  $ f(x) = f(x_0) + chevron.l nabla f(x_0), x - x_0 chevron.r + 1/2 chevron.l D^2 f(x_0) (x - x_0), x - x_0 chevron.r + o(|x - x_0|^2). $ <eq:taylor_secondo>

  Più in generale, se $f$ è di classe $C^m$ si avrà
  $ f(x) = f(x_0) + sum_(k=1)^m 1 / (k!) D^k f(x_0)[x-x_0, dots, x-x_0] + o(|x - x_0|^k). $
]

#proof[
  _Caso $m=2$ (secondo ordine)._
  Fissato $x$ (oltre che $x_0$) consideriamo il vettore $v = x - x_0$ e restringiamo la funzione alla retta passante per $x_0$ con direzione $v$.
  Otteniamo una funzione
  $ g(t) = f(x_0 + t v) $
  le cui derivate sono:
  $ g'(t) &= chevron.l nabla f(x_0 + t v), v chevron.r, \
    g''(t) &= chevron.l D^2 f(x_0+t v)[v], v chevron.r. $
  Usando la formula di Taylor con resto di Lagrange per le funzioni di una variabile vista nel corso di Analisi Matematica Uno, si ottiene
  $ g(t) = g(0) + g'(0) t + 1/2 g'' (bar(t)(x)) t^2 $
  per un qualche $bar(t)(x) in (0,t)$.
  Abbiamo quindi
  $ f(x) = f(x_0) + chevron.l nabla f(x_0), x - x_0 chevron.r + 1/2 chevron.l D^2 f(x_0 + bar(t)(x)(x - x_0))[x-x_0], x-x_0 chevron.r. $
  Visto che per $x -> x_0$ si ha $bar(t)(x) -> 0$, per la continuità delle derivate seconde si ha
  $ D^2 f(x_0 + bar(t)(x)(x - x_0)) -> D^2 f(x_0) $
  e dunque segue la tesi.

  _Caso generale._
  La dimostrazione è analoga, con una discreta complicazione delle notazioni.
]

= Ottimizzazione

Data una funzione $f: A subset RR^n -> RR$ ci poniamo il problema di determinare eventuali punti di massimo e minimo di $f$ su $A$.

Se $x_0 in A$ diremo che $x_0 in A$ è un minimo assoluto (o globale) di $f$ su $A$ se $f(x_0) <= f(x)$ per ogni $x in A$.
Diremo che è un massimo assoluto se $f(x_0) >= f(x)$ per ogni $x in A$.
Diremo che $x_0$ è un punto di massimo (o minimo) relativo (o locale) se è un massimo (o minimo) assoluto per $f$ in un intorno di $x_0$.

#theorem[condizioni al primo ordine][
  Sia $f: A subset RR^n -> RR$ e sia $x_0$ un punto di massimo o minimo relativo di $f$.
  Se $x_0$ è un punto interno di $A$ e se $f$ è derivabile in $x_0$ allora $nabla f(x_0)=0$.
  Un punto $x_0$ in cui si ha $nabla f(x_0) = 0$ si chiama _punto critico_.
]

#proof[
  Se $x_0$ è minimo (o massimo) relativo per $f$ allora la funzione $g_k (t) = f(x_0+t e_k)$ ha minimo (o massimo) relativo nel punto $t=0$.
  Tale funzione è definita in un intorno di $t=0$ dunque per i criteri già visti nel corso di Analisi Matematica Uno si deve avere $g_k' (0)=0$.
  Ma $g_k' (0) = (partial f) / (partial x_k)(x_0)$.
  Questo è vero per ogni $k=1, dots, n$, si ottiene quindi $nabla f(x_0)=0$.
]
