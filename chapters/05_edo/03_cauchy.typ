#import "../../lib.typ": *

= Il problema di Cauchy

Il problema di Cauchy per i sistemi del primo ordine consiste nel trovare una soluzione di un sistema di $n$ equazioni differenziali ordinarie del primo ordine in $n$ incognite $u_1, dots, u_n$ con un dato iniziale fissato.
Cioè dato $x_0 in RR$, e $arrow(y)_0 in RR^n$ si cerca un intervallo $I subset RR$ con $x_0 in I$ e una funzione $arrow(u): I -> RR^n$, $arrow(u) = (u_1, dots, u_n)$, tale che $arrow(u)$ sia derivabile e soddisfi:
$ cases(
  arrow(u)'(x) = arrow(f)(x, arrow(u)(x)) quad forall x in I,
  arrow(u)(x_0) = arrow(y)_0.
) $ <eq:problema_cauchy>

== Esistenza e unicità locale

#theorem[Cauchy-Lipschitz: esistenza e unicità locale][
  Siano $a <= x_0 <= b$, $R>0$, $arrow(y)_0 in RR^n$.
  Posto $K = {arrow(y) in RR^n : |arrow(y) - arrow(y)_0| <= R} subset RR^n$ sia $arrow(f): [a,b] times K -> RR^n$ una funzione con le proprietà:
  + $arrow(f)$ è continua,
  + esiste $L>0$ tale che per ogni $x in [a,b]$, ed ogni $arrow(y)_1, arrow(y)_2 in K$ si ha
    $ |arrow(f)(x, arrow(y)_2) - arrow(f)(x, arrow(y)_1)| <= L |arrow(y)_2 - arrow(y)_1|. $ <eq:hp_lipschitz>

  Allora esiste $delta > 0$ tale che scelto comunque un intervallo $I$ con $x_0 in I subset [a,b] inter [x_0-delta, x_0+delta]$ esiste una unica funzione derivabile $arrow(u): I -> K$ che risolve il problema di Cauchy @eq:problema_cauchy.
] <th:cauchy_lipschitz>

#proof[
  _Passo 1._
  Per prima cosa vogliamo dimostrare che una funzione $arrow(u): I -> K subset RR^n$ è derivabile e risolve il problema di Cauchy @eq:problema_cauchy se e solo se $arrow(u)$ è continua e risolve l'equazione integrale
  $ arrow(u)(x) = arrow(y)_0 + integral_(x_0)^x arrow(f)(t, arrow(u)(t)) thin d t. $ <eq:problema_cauchy_integrale>

  Se $arrow(u)$ è derivabile e $arrow(u)'(x) = arrow(f)(x, arrow(u)(x))$ per ogni $x in [a,b]$ allora siccome $arrow(f)$ è continua la funzione $arrow(f)(t, arrow(u)(t))$ è continua (teorema @th:continuita_funzione_composta_metrico) e quindi $arrow(u)$ è di classe $C^1$.
  Posso allora integrare ambo i membri e ottenere:
  $ integral_(x_0)^x arrow(u)'(t) thin d t = integral_(x_0)^x arrow(f)(t, arrow(u)(t)) thin d t. $
  Per il teorema fondamentale del calcolo il lato sinistro è uguale a $arrow(u)(x) - arrow(u)(x_0) = arrow(u)(x) - arrow(y)_0$ e quindi si ottiene la validità della @eq:problema_cauchy_integrale.

  Viceversa se $arrow(u)$ è continua e soddisfa la @eq:problema_cauchy_integrale allora, sempre per il teorema fondamentale del calcolo possiamo affermare che l'integrale nel lato destro nell'uguaglianza @eq:problema_cauchy_integrale è una funzione derivabile con derivata $arrow(f)(x, arrow(u)(x))$ e dunque anche il lato sinistro è derivabile e vale $arrow(u)'(x) = arrow(f)(x, arrow(u)(x))$ per ogni $x in I$.
  Abbiamo già osservato che se $arrow(u)$ è continua questa funzione (che è la derivata di $arrow(u)$) è anch'essa continua e quindi $arrow(u)$ è di classe $C^1$.
  Per $x=x_0$ l'integrale si annulla e quindi si ottiene anche $arrow(u)(x_0) = arrow(y)_0$ concludendo che in effetti $arrow(u)$ risolve il problema di Cauchy @eq:problema_cauchy.

  _Passo 2._
  Visto che $[a,b] times K$ è un insieme chiuso e limitato in $RR times RR^n$ il teorema di Weierstrass garantisce che esiste $M>0$ tale che $|arrow(f)(x,y)| <= M$ per ogni $x in [a,b]$ e ogni $y in K$.
  Scegliamo $delta > 0$ tale che $delta <= R/M$ e $delta < 1/L$ e prendiamo l'intervallo $I = [a,b] inter [x_0-delta, x_0+delta]$.
  Consideriamo ora l'insieme $X = C(I, K) subset C(I, RR^n)$ di tutte le funzioni continue $arrow(u): I -> K$ e mettiamo su $X$ la distanza uniforme $d_infinity$.
  È facile osservare che $X$ è un sottospazio chiuso di $cal(B)(I, RR^n)$ (le funzioni limitate definite su $I$) e visto che quest'ultimo è uno spazio completo (teorema @th:limitate_completo) anche $X$ è completo (teorema @th:chiuso_compatto_completo).

  Definiamo su $X$ l'operatore $T: X -> C(I, RR^n)$ come segue:
  $ T(arrow(u))(x) = arrow(y)_0 + integral_(x_0)^x arrow(f)(t, arrow(u)(t)) thin d t. $
  Osserviamo che l'equazione @eq:problema_cauchy_integrale può essere riscritta come equazione di punto fisso: $T(arrow(u)) = arrow(u)$.
  Il nostro intento è quindi quello di utilizzare il teorema @th:banach-caccioppoli delle contrazioni.

  _Passo 3._
  Dimostriamo innanzitutto che $T(X) subset X$ cosicché possiamo pensare a $T$ come ad un operatore $T: X -> X$ che manda $X$ in sé.
  Posto $arrow(v) = T(arrow(u))$ si ha (teorema @th:stima_modulo_integrale):
  $ |arrow(v)(x) - arrow(y)_0|
      &= |integral_(x_0)^x arrow(f)(t, arrow(u)(t)) thin d t|
      <= |integral_(x_0)^x |arrow(f)(t, arrow(u)(t))| thin d t| \
      &<= |integral_(x_0)^x M thin d t|
      = |x - x_0| dot M <= delta dot M. $
  Visto che abbiamo scelto $delta <= R/M$ si ottiene che $v(x) in K$ per ogni $x in [a,b]$ e quindi effettivamente $T(u) in K$.

  _Passo 4._
  Dimostriamo infine che $T$ è una contrazione.
  Se $arrow(u), arrow(v) in X$ si ha, usando l'ipotesi @eq:hp_lipschitz con $x=t$, $arrow(y)_1 = arrow(u)(x)$, $arrow(y)_2 = arrow(v)(x)$,
  $ |T(arrow(u))(x) - T(arrow(v))(x)|
      &= |integral_(x_0)^x arrow(f)(t, arrow(u)(t)) thin d t - integral_(x_0)^x arrow(f)(t, arrow(v)(t)) thin d t| \
      &<= |integral_(x_0)^x |arrow(f)(t, arrow(u)(t)) - arrow(f)(t, arrow(v)(t))| thin d t| \
      &<= |integral_(x_0)^x L dot |arrow(u)(t) - arrow(v)(t)| thin d t|
      <= |integral_(x_0)^x L dot d_infinity (arrow(u), arrow(v)) thin d t| \
      &= |x - x_0| dot L dot d_infinity (arrow(u), arrow(v))
      <= delta dot L dot d_infinity (arrow(u), arrow(v)). $
  Avendo scelto $delta < 1/L$ si ha $delta L < 1$ e quindi effettivamente l'operatore $T$ è una contrazione.
  Sono dunque verificate le ipotesi del teorema @th:banach-caccioppoli delle contrazioni che garantiscono l'esistenza e unicità del punto fisso $arrow(u)$.

  Ma abbiamo già osservato che $T(arrow(u)) = arrow(u)$ è equivalente al problema di Cauchy @eq:problema_cauchy.
  Abbiamo quindi dimostrato che esiste una unica funzione $arrow(u): I -> K$ che risolve il problema di Cauchy @eq:problema_cauchy.
]

#definition[Cauchy-Lipschitz][
  Diremo che una funzione $arrow(f): Omega subset RR times RR^n -> RR^m$ soddisfa la _proprietà di Cauchy-Lipschitz_ se $f$ è continua e se per ogni $(x_0, arrow(y)_0) in Omega$ esistono $a<x_0$, $b>x_0$, $R>0$ ed $L>0$ tali che le ipotesi del teorema @th:cauchy_lipschitz sono verificate.
] <def:cauchy_lipschitz>

#proposition[
  Sia $Omega subset RR times RR^n$ un insieme aperto.
  Se $arrow(f) in C^1(Omega, RR^m)$ allora $f$ soddisfa la condizione di Cauchy-Lipschitz (definizione @def:cauchy_lipschitz).
  Più precisamente è sufficiente che $f$ e tutte le derivate parziali $(partial f) / (partial y_j)$, $j=1, dots, n$ siano continue.

  In particolare, grazie al teorema @th:cauchy_lipschitz per ogni $(x_0, arrow(y)_0) in Omega$ esiste un intervallo aperto $I$ contenente il punto $x_0$ ed esiste una unica soluzione $u$ del problema di Cauchy @eq:problema_cauchy definita su tale intervallo $I$.
]

#proof[
  Se prendiamo un qualunque cilindro $[a,b] times K$ con
  $ K = {arrow(y) in RR^n : |arrow(y) - arrow(y)_0| <= R}, $
  $arrow(y)_0 in Omega$, $K subset Omega$ sappiamo che ogni derivata parziale $(partial f_k) / (partial y_j)$ è continua ed è quindi limitata (per il teorema di Weierstrass) su $[a,b] times K$.
  Sia $L_(k,j)$ il massimo di |(partial f_k) / (partial y_j)| su $K$ e sia $L$ il massimo degli $L_(k,j)$ per $k=1, dots, m$ e $j=1, dots, n$.
  Allora presi $arrow(y), arrow(z) in K$ si può scomporre l'incremento vettoriale $arrow(z) - arrow(y)$ lungo le $n$ direzioni coordinate e applicare il teorema di Lagrange lungo ogni direzione.
  Per ogni $k = 1, dots, m$ si ha quindi:
  $ |f_k (x, arrow(z)) - f_k (x, arrow(y))|
      &<= sum_(j=1)^n |f_k (x, z_1, dots, z_j, y_(j+1), dots, y_n) - f_k (x, z_1, dots, z_(j-1), y_j, dots, y_n)| \
      &<= sum_(j=1)^n L_(k,j) |z_j - y_j|
      <= sum_(j=1)^n L_(k,j) |arrow(z) - arrow(y)|
      <= n L |arrow(z) - arrow(y)| $
  da cui
  $ |arrow(f)(x, arrow(z)) - arrow(f)(x, arrow(y))|
      &= sqrt(sum_(k=1)^m |f_k (x, arrow(z)) - f_k (x, arrow(y))|^2)
      <= sqrt(sum_(k=1)^m n^2 L^2 |arrow(z) - arrow(y)|^2) \
      &<= n sqrt(m) L |arrow(z) - arrow(y)| = L' |arrow(z) - arrow(y)|. $
]

#definition[soluzione/intervallo massimale][
  Sia $I subset RR$ un intervallo non vuoto e sia $arrow(u): I -> RR^n$ una soluzione di una equazione differenziale.

  Se $J supset I$, $J != I$ è un intervallo, se $arrow(v): J -> RR^n$ risolve la stessa equazione differenziale e se $arrow(v)(x) = arrow(u)(x)$ per ogni $x in I$, diremo che $arrow(v)$ è una _estensione della soluzione_ $u(x)$.

  Se la soluzione $arrow(u)$ non ammette estensioni, diremo che $arrow(u)$ è una soluzione definita su un intervallo massimale o, più semplicemente, diremo che $arrow(u)$ è una _soluzione massimale_.
]

#proposition[caratterizzazione delle soluzioni massimali][
  Sia $Omega subset RR times RR^n$ un insieme aperto e supponiamo che $arrow(f): Omega subset RR times RR^n -> RR^n$ sia una funzione continua che soddisfa la condizione di Cauchy-Lipschitz (definizione @def:cauchy_lipschitz).
  Allora una soluzione $arrow(u)$ dell'equazione
  $ arrow(u)'(x) = arrow(f)(x, arrow(u)(x)) $ <eq:edo_normale_ordine_uno>
  definita su un intervallo $I$ è massimale se e solo se $I$ è aperto e per ogni $K$ compatto $K subset Omega$ e per ogni $x_0 in I$ esistono $x_1, x_2 in I$, $x_1 < x_0 < x_2$ tali che $(x_1, arrow(u)(x_1)) not in K$ e $(x_2, arrow(u)(x_2)) not in K$.
  Significa cioè che il grafico di $arrow(u)$ cioè la curva $(x, arrow(u)(x))$ esce da qualunque compatto $K subset Omega$ sia facendo crescere $x$ verso destra che facendo calare $x$ verso sinistra.
  Intuitivamente il grafico della soluzione massimale tende ad arrivare ai limiti di $Omega$.
] <prop:edo_massimale>

#proof[
  _Prima implicazione._
  Supponiamo che $arrow(u): I -> RR^n$ sia una soluzione di @eq:edo_normale_ordine_uno definita su un intervallo massimale $I$. Dovrà essere $(x, arrow(u)(x)) in Omega$ per ogni $x in I$.

  Mostriamo innanzitutto che $I$ è un intervallo aperto a destra: se non lo fosse si avrebbe che $x_0 = sup I in I$.
  Allora $(x_0, arrow(u)(x_0)) in Omega$ e per il teorema di esistenza e unicità locale potremmo trovare un piccolo intervallino $J = [x_0, x_0+delta]$ una funzione $arrow(v): J -> RR^n$ che risolve @eq:edo_normale_ordine_uno con $arrow(v)(x_0) = arrow(u)(x_0)$.
  Facendo l'unione dei due grafici ottengo una estensione di $arrow(u)$ a tutto l'intervallo $I union J$ che è strettamente più grande di $I$.
  Dunque $arrow(u)$ non poteva essere una soluzione massimale.

  Mostriamo ora che la curva $(x, arrow(u)(x))$ esce da ogni compatto $K subset Omega$ sia da destra che da sinistra.
  Supponiamo per assurdo che esista un compatto $K$ tale che $(x, arrow(u)(x)) in K$ per ogni $x in I$.
  Il grafico $(x, arrow(u)(x))$ è limitato per $x in I$ dunque certamente $I$ deve essere limitato.
  Inoltre abbiamo visto che $I$ è aperto e quindi $I=(a,b)$ con $a,b in RR$, $a<b$.

  Allora per ogni $x in I=(a,b)$ si ha
  $ |arrow(u)'(x)| = |arrow(f)(x, arrow(u)(x))| <= sup_K |arrow(f)|. $
  Visto che $arrow(f)$ è continua la funzione $|arrow(f)|$ ha massimo su $K$ per il teorema di Weierstrass e quindi la funzione limitata $arrow(u)$ ha derivata $arrow(u)'(x) = arrow(f)(x, arrow(u)(x))$ anch'essa limitata.
  Si può quindi applicare l'esercizio \@ex:estensione_continua_derivata_limitata oppure il teorema @th:estensione_uniformemente_continua (avendo osservato che $arrow(u)$ è lipschitziana per il teorema @th:lipschitz_uniformemente_continua e quindi uniformemente continua) per dedurre che $arrow(u)$ può essere estesa con continuità agli estremi $a$ e $b$ dell'intervallo $I$.

  Visto che $(x, arrow(u)(x)) in K$ per ogni $x in (a,b)$ e visto che $arrow(v)(b) = lim_(x -> b^-) arrow(u)(x)$ essendo $K$ chiuso possiamo affermare che $(b, arrow(v)(b)) in K$.
  Lo stesso vale per $x -> a^+$ dunque $(a, arrow(v)(a)) in K$ e dunque $(x, arrow(v)(x)) in K subset Omega$ per ogni $x in [a,b]$.
  Vogliamo ora verificare che $arrow(v)$ è soluzione dell'equazione differenziale @eq:edo_normale_ordine_uno.
  Chiaramente $arrow(v)$ soddisfa l'equazione per ogni $x in (a,b)$ in quanto su $(a,b)$ coincide con $arrow(u)$ che è soluzione.
  Consideriamo l'estremo $b$.
  Visto che $arrow(v)$ è continua in $b$ e $arrow(f)$ è continua in $(b, arrow(v)(b))$ si ha
  $ lim_(x -> b^-) arrow(v)'(x) = lim_(x -> b^-) arrow(f)(x, arrow(v)(x)) = arrow(f)(b, arrow(v)(b)) in RR^n. $
  Sappiamo però che se il limite della derivata di una funzione continua esiste ed è finito, allora la funzione è derivabile nel punto limite e la derivata è continua in quel punto (proposizione \@prop:4384774).
  Dunque $arrow(v)$ è derivabile in $b$ e anche in quel punto soddisfa l'equazione differenziale. Lo stesso vale nel punto $a$. Dunque siamo riusciti a trovare una estensione $arrow(v)$ di $arrow(u)$ contraddicendo l'ipotesi che $arrow(u)$ fosse una soluzione massimale.

  _Seconda implicazione._
  Supponiamo ora $arrow(u): I -> RR^n$ sia una soluzione dell'equazione differenziale @eq:edo_normale_ordine_uno definita su un intervallo $I$ e tale che la curva $(x, arrow(u)(x))$ esca da ogni compatto $K$ al variare di $x in I$.
  Vogliamo dimostrare che $arrow(u)$ è soluzione massimale.
  Innanzitutto $I$ non può essere compatto, altrimenti anche $K = {(x, arrow(u)(x)) : x in I}$ sarebbe un compatto di $Omega$ e ovviamente la curva non esce da $K$.
  Sia $a = inf I$ e $b = sup I$.
  Siccome $I$ non è chiuso esso non contiene uno dei due estremi: supponiamo sia $b$.
  Allora se $arrow(u)$ fosse estendibile a destra esisterebbe una estensione continua $arrow(v): (a,b] -> RR^n$ che coincide con $arrow(u)$ su $(a,b)$ e che è continua nel punto $x=b$ e che soddisfa l'equazione differenziale quindi, in particolare, $(b, arrow(v)(b)) in Omega$.
  Ma allora scelto $x_0 in (a,b)$ prendiamo $K = {(x, arrow(v)(x)) : x in [x_0, b]}. $
  Visto che $arrow(v): [x_0, b] -> RR^n$ è continua è facile verificare che $K$ è chiuso e limitato, $K subset Omega$. Ma ovviamente $(x, arrow(v)(x)) in K$ per ogni $x >= x_0$, contro le ipotesi.
]

#proposition[separazione delle soluzioni][
  Se $arrow(f): Omega subset RR times RR^n -> RR^n$ verifica la condizione di Cauchy-Lipschitz (definizione @def:cauchy_lipschitz), se $arrow(u): I -> RR^n$ e $arrow(v): J -> RR^n$ sono due soluzioni dell'equazione differenziale $arrow(u)'(x) = arrow(f)(x, arrow(u)(x))$ definite su due intervalli $I,J subset RR$ e se esiste $x_0 in I inter J$ tale che $arrow(u)(x_0) = arrow(v)(x_0)$ allora $arrow(u)(x) = arrow(v)(x)$ per ogni $x in I inter J$.
  Detto in altri termini: nelle ipotesi del teorema di esistenza e unicità i grafici di due soluzioni diverse definite in un intervallo non possono toccarsi.
] <prop:separazione_soluzioni>

#proof[
  Sia $x_0 in I inter J$ un punto in cui $arrow(u)(x_0) = arrow(v)(x_0)$ e supponiamo per assurdo che esista $x_2 in I inter J$ tale che $arrow(u)(x_2) != arrow(v)(x_2)$. In tal caso possiamo considerare il punto
  $ x_1 = sup {x in [x_0, x_2] : arrow(u)(x) = arrow(v)(x)}. $
  Su tutto l'intervallo $[x_0, x_1)$ si ha quindi $arrow(u)(x) = arrow(v)(x)$ e per continuità dovrà dunque anche essere $arrow(u)(x_1) = arrow(v)(x_1)$.
  In pratica $x_1$ è l'ultimo punto di contatto tra le due soluzioni.
  Ponendo allora il punto $(x_1, arrow(u)(x_1))$ come dato iniziale del problema di Cauchy scopriamo che $arrow(u)$ e $arrow(v)$ sono localmente due soluzioni di tale problema. Per l'unicità locale le due soluzioni devono coincidere in un piccolo intorno del punto $x_1$, diciamo in particolare che devono coincidere su $[x_1, x_1+epsilon]$ ma questo è in contraddizione con la definizione di $x_1$.
]

#theorem[esistenza di soluzioni massimali][
  Sia $arrow(u): I -> RR^n$ una soluzione dell'equazione differenziale @eq:edo_normale_ordine_uno definita su un intervallo non vuoto $I subset RR$ e supponiamo che tale equazione soddisfi il teorema di esistenza e unicità locale (questo succede ad esempio se $f in C^1$).
  Se $arrow(u)$ non è essa stessa una soluzione massimale, esiste sempre una estensione massimale $arrow(v): J -> RR^n$, $J supset I$.
] <th:edo_esistenza_massimali>

#proof[
  Supponiamo che $arrow(u)$ non sia massimale, dunque $arrow(u)$ ammette estensioni.

  Sia $cal(F)$ l'insieme di tutte le estensioni di $arrow(u)$.
  Più precisamente ogni $arrow(w) in cal(F)$ è una funzione $arrow(w): J_(arrow(w)) -> RR^n$ definita su un intervallo aperto $J_(arrow(w)) supset I$ che soddisfa l'equazione differenziale @eq:edo_normale_ordine_uno e che coincide con $arrow(u)$ su $I$.
  Definiamo $arrow(v): J -> RR^n$ come segue:
  $ J = union_(arrow(w) in cal(F)) J_(arrow(w)) $
  $ arrow(v)(x) = arrow(w)(x) quad text("se ") x in J_(arrow(w)). $
  Si osservi che dato $x in I$ se $arrow(w)_1, arrow(w)_2 in cal(F)$ sono due estensioni entrambe definite su un punto $x$, allora esse coincidono in $x$ per la proposizione @prop:separazione_soluzioni, dunque $arrow(v)(x)$ è univocamente definita.

  Chiaramente $J$ deve essere un intervallo, in quanto tutti i $J_(arrow(w))$ hanno in comune i punti di $I$.
  Verifichiamo ora che $arrow(v)$ soddisfa l'equazione differenziale.
  Preso un punto $x in J$ deve esistere $arrow(w)$ tale che $x in J_(arrow(w))$.
  Inoltre se $x$ non è un estremo di $J$ posso scegliere $arrow(w)$ in modo che $x$ non sia un estremo di $J_(arrow(w))$.
  Sappiamo che $arrow(w)'(x) = f(x, arrow(w)(x))$ e visto che $arrow(u)$ coincide con $arrow(w)$ su $J_(arrow(w))$ possiamo dedurre che $arrow(u)$ è derivabile e che le derivate coincidono:
  $ arrow(u)'(x) = arrow(w)'(x) = f(x, arrow(w)(x)) = f(x, arrow(u)(x)). $
  Dunque anche $arrow(u)$ è soluzione di @eq:edo_normale_ordine_uno.
  In pratica abbiamo verificato che $arrow(v) in cal(F)$ ed è quindi una estensione di $arrow(u)$.
  Questa è una estensione massimale perché se ci fosse una estensione definita su un intervallo più grande sarebbe anch'essa inclusa in $cal(F)$.
]

== Esistenza globale

#theorem[esistenza globale][
  Sia $I = (a,b) subset RR$ un intervallo aperto, $Omega = I times RR^n$ e sia $arrow(f): Omega -> RR^n$, $arrow(f) = arrow(f)(x, arrow(y))$ una funzione che soddisfa la proprietà di Cauchy-Lipschitz e che sia sublineare in $arrow(y)$ uniformemente rispetto a $x$, cioè esistono $m,q in RR$ tali che:
  $ |arrow(f)(x, arrow(y))| <= m |arrow(y)| + q, quad forall (x, arrow(y)) in Omega. $
  Allora per ogni $x_0 in I$ e per ogni $arrow(y)_0 in RR^n$ esiste una funzione $arrow(u): I -> RR^n$ (definita su tutto $I$) soluzione del problema di Cauchy @eq:problema_cauchy.

  Più in generale il risultato è vero se vale la stima
  $ |arrow(f)(x, arrow(y))| <= m(x) |arrow(y)| + q(x), quad forall (x, arrow(y)) in Omega $
  dove $m,q: I -> RR$ sono funzioni continue.
] <th:edo_esistenza_globale>

#lemma[Gronwall][
  Siano $a,b in RR$ con $a<b$ e siano $m,q >= 0$.
  Sia $arrow(u): [a,b[ -> RR^n$ una funzione di classe $C^1$ tale che
  $ |arrow(u)'(t)| <= m |arrow(u)(t)| + q quad forall t in [a,b[. $
  Allora $arrow(u)$ è limitata.
]

#proof[
  Ricordando che
  $ (|arrow(u)|^2)' = (arrow(u) dot arrow(u))' = 2 arrow(u) dot arrow(u)' $
  per ogni $x in [a,b[$ possiamo fare la seguente stima:
  $ [ln(1 + |arrow(u)(t)|^2)]_a^x
      &= integral_a^x (ln(1 + |arrow(u)(t)|^2))' thin d t
      = integral_a^x (2 arrow(u)(t) dot arrow(u)'(t))/(1 + |arrow(u)(t)|^2) thin d t \
      &<= 2 integral_a^x (|arrow(u)(t)| |arrow(u)'(t)|)/(1 + |arrow(u)(t)|^2) thin d t
      <= 2 integral_a^x (|arrow(u)(t)| (m |arrow(u)(t)| + q))/(1 + |arrow(u)(t)|^2) thin d t \
      &<= 2 integral_a^x (m + (q |arrow(u)(t)|)/(1 + |arrow(u)(t)|^2)) thin d t \
      &<= (x-a)(2m + q) <= (b-a)(2m+q) $
  avendo anche sfruttato la disuguaglianza $s/(1+s^2) <= 1/2$ con $s = |arrow(u)(t)|$.
  Dunque
  $ ln(1 + |arrow(u)(x)|^2) <= ln(1 + |arrow(u)(a)|^2) + (b-a)(2m+q) $
  è una funzione limitata e di conseguenza anche $|arrow(u)(x)|$ è limitata.
]

#proof[Dimostrazione teorema @th:edo_esistenza_globale][
  Sia $arrow(u)$ una soluzione massimale del problema di Cauchy e sia $J subset I$ l'intervallo massimale su cui $arrow(u)$ è definita.
  Sia $b = sup J$. Sappiamo quindi che $arrow(u)$ è definita su $[x_0, b[$ e quindi per il lemma precedente deve essere limitata: esiste cioè $M>0$ per cui $|arrow(u)(x)| <= M$ per ogni $x in [x_0, b[$.
  Se consideriamo il compatto
  $ K = [x_0, b] times overline(B_M (arrow(0))) = {(x, arrow(y)) in RR times RR^n : x in [x_0, b], |arrow(y)| <= M} $
  abbiamo quindi verificato che $(x, arrow(u)(x)) in K$ per ogni $x in [a_0, b[$.
  Se fosse $b in I$ si avrebbe $K subset Omega$ e quindi questo sarebbe in contraddizione con la proposizione @prop:edo_massimale che ci dice che ogni soluzione massimale esce da qualunque compatto contenuto in $Omega$. Significa allora che $b not in I$ e cioè che $b = sup J = sup I$ (non può essere $sup J > sup I$ in quanto $J subset I$).

  In maniera analoga (o per simmetria) si può dimostrare che $inf J = inf I$ e dunque $J=I$ come volevamo dimostrare.

  Nel caso in cui $m=m(x)$ e $q=q(x)$ siano funzioni continue basta osservare che su ogni intervallo compatto $[alpha, beta] subset I$ le funzioni $m$ e $q$ sono limitate, dunque si applica il passo precedente ottenendo che $arrow(u)$ è definita su ogni $[alpha, beta] subset I$ e quindi su tutto $I$.
  In questo caso è possibile che la soluzione $u$ abbia un asintoto verticale, ma solo agli estremi dell'intervallo $I$.
]

#theorem[dipendenza continua dai dati iniziali][
  Sia $Omega subset RR times RR^n$ un insieme aperto e sia $arrow(f): Omega -> RR^n$ una funzione che soddisfa la condizione di Cauchy-Lipschitz (definizione @def:cauchy_lipschitz).
  Sia $(x_0, arrow(y)_0) in Omega$ e sia $arrow(u): I -> RR^n$ la soluzione massimale del problema di Cauchy @eq:problema_cauchy.
  Fissato $x_1 in I$ e $epsilon > 0$ esiste $delta > 0$ tale che se $|z_0 - y_0| < delta$ allora se $arrow(v): J -> RR^n$ è la soluzione massimale del problema di Cauchy con la stessa equazione differenziale ma con dato iniziale $(x_0, arrow(z)_0)$ allora $x_1 in J$ e $|arrow(v)(x) - arrow(u)(x)| < epsilon$ per ogni $x in [x_0, x_1]$.
] <th:edo_dipendenza_continua>

#lemma[Gronwall bis][
  Sia $u: I -> RR$ una funzione continua e derivabile sull'intervallo $I subset RR$, e supponiamo che esista $L in RR$ tale che
  $ u'(x) <= L u(x), quad forall x in I. $
  Allora per ogni $x_0, x in I$, $x>x_0$ si ha
  $ u(x) <= u(x_0) e^(L(x-x_0)). $
] <lm:gronwall_bis>

#proof[
  Si tratta di una disequazione differenziale lineare del primo ordine, dunque possiamo usare lo stesso metodo del fattore integrante che abbiamo usato per risolvere le equazioni. Si ha
  $ (u(x) e^(-L x))' = (u'(x) - L u(x)) e^(-L x) <= 0 $
  da cui si evince che $u(x) e^(-L x)$ è decrescente. Dunque $u(x) e^(-L x) <= u(x_0) e^(-L x_0)$ da cui si ottiene la tesi.
]

#proof[Dimostrazione teorema @th:edo_dipendenza_continua][
  Consideriamo il grafico della funzione $u$ ristretta all'intervallo $[x_0, x_1]$:
  $ Gamma = {(x, arrow(u)(x)) : x in [x_0, x_1]}. $
  Questo è un compatto di $Omega$ e può essere ricoperto quindi con un numero finito di aperti di $Omega$ su ciascuno dei quali è verificata la stima di Lipschitz con costante $L$.
  Prendendo il massimo delle costanti di Lipschitz possiamo dunque supporre che esista un aperto $U$ con $Gamma subset U subset Omega$ ed esista $L in RR$ tale che
  $ |f(x, arrow(y)_1) - f(x, arrow(y)_2)| <= L |arrow(y)_1 - arrow(y)_2| $
  per ogni $x, arrow(y)_1, arrow(y)_2$ tali che $(x, arrow(y)_1), (x, arrow(y)_2) in U$.
  Prendiamo $0 < rho < epsilon$ tale che dati $x in [x_0, x_1]$ e $arrow(y)$ con $|arrow(y) - arrow(u)(x)| < rho$ si abbia $(x, arrow(y)) in U$.
  Supponiamo $delta$ sia abbastanza piccolo da garantire che se $|z_0 - y_0| < delta$ allora il punto $(x_0, arrow(z)_0)$ sia contenuto in $U$.
  Consideriamo $arrow(v): J -> RR^n$ la soluzione massimale del problema di Cauchy con dato iniziale $(x_0, arrow(z)_0)$ e consideriamo la funzione $w(x) = |arrow(v)(x) - arrow(u)(x)|$ definita su $I inter J$.
  Possiamo supporre che sia $z_0 != y_0$ altrimenti la tesi è banale.
  Ma allora $w(x) > 0$ perché due diverse soluzioni non possono mai toccarsi (proposizione @prop:separazione_soluzioni).
  Significa che $w$ è derivabile e si ha
  $ w'(x) = ((arrow(v)(x) - arrow(u)(x)) dot (arrow(v)'(x) - arrow(u)'(x)))/|arrow(v)(x) - arrow(u)(x)| <= |arrow(v)'(x) - arrow(u)'(x)| <= L w(x). $
  Dunque per il lemma @lm:gronwall_bis di Gronwall si ottiene (supponiamo qui $x>x_0$ ma il caso $x<x_0$ è analogo)
  $ w(x) <= w(x_0) e^(L(x-x_0)) = |z_0 - y_0| e^(L(x-x_0)) <= delta e^(L(x_1 - x_0)). $
  Dunque $w(z) < epsilon$ se $delta$ è sufficientemente piccolo.

  Dobbiamo infine osservare che la soluzione $arrow(v)$ deve essere definita su tutto l'intervallo $[x_0, x_1]$ altrimenti, per la proposizione @prop:edo_massimale, la soluzione $arrow(v)$ non uscirebbe dal compatto $\{(x,y) in Omega : x in [x_0, x_1]\}$.
]