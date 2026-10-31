#import "../../lib.typ": *

= Classificazione

Le equazioni differenziali sono una classe di _equazioni funzionali_ ovvero equazioni in cui l'incognita non è un numero (come accade nelle equazioni algebriche) ma è una funzione. La funzione incognita $u$, sarà quindi funzione di una variabile indipendente $u=u(x)$.
Ad esempio $u$ potrebbe essere la traiettoria di un proiettile che descrive la posizione nello spazio in funzione del tempo $x$. Se nelle equazioni algebriche il nome di gran lunga più utilizzato per l'incognita è $x$, nelle equazioni funzionali a seconda dei contesti le convenzioni possono cambiare in maniera drastica. Si dovrà utilizzare un nome per la funzione e un nome per la sua variabile indipendente: $x=x(t)$, $y=y(x)$, $y=y(t)$, $u=u(x)$ sono alcune delle scelte più utilizzate.
Se l'incognita è una funzione $u=u(x)$ le operazioni che possono comparire nell'equazioni sono, oltre le usuali operazioni algebriche che agiscono sui singoli valori $u(x)$ della funzione, anche operatori che agiscono sulla funzione $u$ in sé.
Se l'equazione funzionale oltre alle operazioni algebriche comprende anche l'operatore derivata, si dirà che è una _equazione differenziale_.
Di contro ci potranno ad esempio essere equazioni che coinvolgono l'operatore integrale e si chiameranno _equazioni integrali_.

Ci sono quindi diversi concetti che possono aiutare a classificare le equazioni differenziali.
Innanzitutto supporremo sempre che le nostre equazioni siano _senza ritardo_ (o _senza memoria_) cioè che la funzione $u$ e le sue derivate $u'$, $u''$ dots, vengano tutte calcolate nello stesso punto $x$.
In caso contrario si parla di equazioni _differenziali funzionali_ (in particolare _equazioni con ritardo_ perché le derivate dipendono tipicamente dai valori assunti nel passato), argomento che non toccheremo.

Se la funzione incognita è funzione di una singola variabile si dirà che l'equazione è una _equazione differenziale ordinaria_ (abbreviato _EDO_ in italiano, _ODE_ per gli anglosassoni).
Di contro se la funzione incognita è funzione di più variabili l'equazione si chiamerà _equazione differenziale alle derivate parziali_ (abbreviato _EDP_ in italiano e _PDE_ in lingua inglese).
In questo corso, centrato sulle funzioni di una variabile, tratteremo quindi solamente le equazioni differenziali ordinarie.
L'_ordine_ dell'equazione differenziale è il numero massimo di derivate successive che vengono applicate alla funzione incognita.
La funzione $u$ sarà definita su un intervallo $I$ della retta reale: $u: I -> RR$ e la funzione e le derivate vengono tutte valutate nello stesso punto. In tal caso la forma più generale di equazione differenziale ordinaria di ordine $n$ si potrà dunque scrivere come:
$F(x, u(x), u'(x), u''(x), dots, u^((n))(x)) = 0$ <eq:3784643>
con $F: Omega -> RR$ una funzione data, definita su un insieme $Omega subset I times RR^(n+1)$.
Una funzione $u: I -> RR$ si dice essere una _soluzione dell'equazione differenziale_ @eq:3784643 se $u$ è derivabile almeno $n$ volte in ogni punto $x in I$ e se @eq:3784643 è soddisfatta per ogni $x in I$.

Usualmente si tende a semplificare la notazione evitando di scrivere sempre esplicitamente il punto $x$ in cui viene calcolata la funzione.
Sarà quindi usuale scrivere l'equazione @eq:3784643 nella forma abbreviata:
$F(x, u, u', u'', dots, u^((n))) = 0$
rendendo anche più evidente il fatto che l'incognita è $u$, l'intera funzione, e non un singolo valore $u(x)$.

Se ad esempio scegliamo $n=2$ e $F(x,u,v,z) = z + sin u + v$ otteniamo l'equazione differenziale:
$u''(x) + sin u(x) + u'(x) = 0$ <eq:39872>
che, in opportune unità di misura, è l'equazione del moto di un pendolo smorzato, dove $x$ rappresenta il tempo e $u$ la misura dell'angolo di inclinazione del pendolo rispetto alla verticale.
Osserviamo che nell'esempio precedente la funzione $F$ non dipende direttamente dalla variabile $x$. Equazioni con questa proprietà si dicono _equazioni autonome_ ed è immediato osservare che se $u(x)$ è soluzione anche una sua traslazione temporale $v(x) = u(x-x_0)$ è soluzione dell'equazione (il moto del pendolo non dipende dall'ora in cui si svolge).

Una equazione scritta nella forma @eq:3784643 si dice _equazione in forma implicita_ e per analogia con le equazioni algebriche (si pensi all'equazione $u^2 (x) + x^2 = 1$) ci si aspetta che le soluzioni di tale equazioni siano meglio rappresentate da curve piuttosto che da grafici di funzione.
Risulta in effetti che la teoria delle equazioni differenziali si applica con molta maggiore efficacia alle _equazioni in forma normale_ che sono le equazioni differenziali di ordine $n$ che possono essere scritte esplicitando la dipendenza dalla derivata di ordine massimo:
$u^((n))(x) = f(x, u(x), u'(x), dots, u^(n-1)(x))$ <eq:366793>
dove $f: Omega -> RR$ è una funzione definita su $Omega subset I times RR^n$.
L'equazione del pendolo si può scrivere in questa forma, scegliendo $f(x,u,v) = -sin u - v$.

Più in generale potremmo considerare _sistemi di equazioni differenziali_ in più incognite.
Possiamo rappresentare un sistema di $k$ equazioni ordinarie in $m$ incognite nella forma:
$arrow(F)(x, arrow(u)(x), arrow(u)'(x), dots, arrow(u)^(n)(x)) = arrow(0)$ <eq:375456>
dove $arrow(u)$ è una funzione vettoriale $arrow(u): I -> RR^m$ le cui componenti sono le $m$ funzioni incognite:
$arrow(u)(x) = (u_1 (x), dots, u_m (x))$
mentre la funzione $arrow(F): I times (RR^m)^(n+1) -> RR^k$ è stavolta una funzione a valori vettoriali $arrow(F) = (F_1, dots, F_k)$ cosicché l'equazione vettoriale @eq:375456 è effettivamente equivalente ad un sistema di $k$ equazioni:
$cases( F_1 (x, arrow(u)(x), arrow(u)'(x), dots, arrow(u)^((n))(x)) = 0, F_2 (x, arrow(u)(x), arrow(u)'(x), dots, arrow(u)^((n))(x)) = 0, dots.v, F_k (x, arrow(u)(x), arrow(u)'(x), dots, arrow(u)^((n))(x)) = 0 )$
Vedremo che per le equazioni ordinarie del primo ordine è naturale, come accade per le equazioni algebriche, avere lo stesso numero di equazioni e di incognite dunque è tipico avere singole equazioni scalari del primo ordine (cioè in cui l'incognita è una funzione a valori nel campo degli scalari $RR$) o sistemi di $k=m$ equazioni del primo ordine con incognita una funzione vettoriale $arrow(u)$ (cioè una funzione a valori nello spazio vettoriale $RR^m$) ovvero con $m$ incognite $u_1, dots, u_m$ funzioni scalari.

Una importante osservazione è il fatto generale che una equazione differenziale di ordine $n$ può essere ricondotta ad un sistema di $n$ equazioni differenziali del primo ordine.
Basta infatti considerare come incognita il vettore (chiamato _jet_)
$arrow(u) = (u, u', u'', dots, u^((n-1)))$
comprendente tutte le derivate della funzione scalare $u$ fino all'ordine $n-1$.
L'equazione @eq:3784643, di ordine $n$, risulta infatti equivalente al sistema di $n$ equazioni del primo ordine nella variabile $arrow(u) = (u_1, dots, u_n)$
$cases( u_2 (x) = u_1 '(x), u_3 (x) = u_2 '(x), dots.v, u_n (x) = u_(n-1)'(x), F(x, u_1 (x), u_2 (x), dots, u_n (x), u_n '(x)) = 0 )$
Nel caso, più interessante, delle equazioni in forma normale l'equazione @eq:366793 di ordine $n$ diventa un sistema di $n$ equazioni normali del primo ordine in $n$ incognite
$cases( u_1 '(x) = u_2 (x), u_2 '(x) = u_3 (x), dots.v, u_(n-1)'(x) = u_n (x), u_n '(x) = f(x, u_1 (x), u_2 (x), dots, u_n (x)) )$
ovvero una equazione differenziale vettoriale del primo ordine
$arrow(u)'(x) = arrow(f)(x, arrow(u)(x)).$

Nell'esempio del pendolo @eq:39872 si avrà come incognita una funzione vettoriale $arrow(u)(x) = (u(x), u'(x))$ le cui componenti sono posizione e velocità angolare.
Il codominio di tale funzione si chiama _spazio delle fasi_.
L'equazione (essendo autonoma tralasciamo la dipendenza da $x$) si scriverà nella forma $arrow(u)' = arrow(f)(arrow(u))$ con $arrow(f)(y_1, y_2) = (y_2, -sin(y_1) - y_2)$.

== Equazioni lineari

Un caso molto particolare ma decisamente importante è quello in cui la funzione $F$ (per le equazioni in forma implicita) o la funzione $f$ (per le equazioni in forma normale) sono funzioni lineari per ogni $t$ rispetto alla variabile $u$.
In tal caso diremo che l'equazione è _lineare omogenea_.
Più precisamente si avrà#footnote[Per evidenziare il fatto che una funzione $L$ è lineare tenderemo ad utilizzare le parentesi quadre (invece che le tonde) per racchiudere l'argomento della funzione: $L[v] = L(v)$.]
$F(x, u(x), u'(x), dots, u^((n))(x)) = A_x [u(x), u'(x), dots, u^((n))(x)]$
con $A_x : RR^(n+1) -> RR$ operatore lineare per ogni $x$ ovvero $A_x$ si rappresenta tramite un vettore i cui coefficienti sono funzioni della variabile $x$:
$A_x [arrow(y)] = sum_(k=0)^n a_k (x) y_k$
e l'equazione differenziale si scrive nella forma
$a_0 (x) u(x) + a_1 (x) u'(x) + dots + a_n (x) u^((n))(x) = 0.$
Nel caso in cui i coefficienti $a_k (t)$ non dipendano da $x$ (cioè siano funzioni costanti) diremo che l'equazione è lineare _a coefficienti costanti_.

È facile osservare che l'insieme delle soluzioni di una equazione lineare omogenea è uno spazio vettoriale: $u=0$ è sempre soluzione, se $u$ è una soluzione e $lambda in RR$ anche $lambda u$ è soluzione e se $u$ e $v$ sono due soluzioni anche $u+v$ è soluzione (principio di sovrapposizione).

In effetti se le funzioni $u$ sono definite su un intervallo $I$ possiamo identificare $F$ con un funzionale $L: RR^I -> RR^I$ definito da
$L[u](x) = F(x, u(x), u'(x), dots, u^((n))(x))$
Se l'equazione differenziale è lineare allora $L$ è un operatore lineare sullo spazio vettoriale $RR^I$ e lo spazio delle soluzioni dell'equazione differenziale non è altro che $op("ker") L$, il nucleo dell'operatore, ed è noto che $op("ker") L$ è un sottospazio vettoriale.
Nonostante $RR^I$ sia uno spazio vettoriale di dimensione infinita scopriremo che (sotto opportune ipotesi) lo spazio vettoriale delle soluzioni ha dimensione finita $n$, uguale al grado dell'equazione.

Nel caso in cui la funzione $F$ (o la corrispondente $f$) sia affine#footnote[Una funzione $f: V -> W$ definita tra due spazi vettoriali si dice essere _affine_ se può essere scritta nella forma $f(v) = L[v] + q$ con $L: V -> W$ operatore lineare e $q in W$ fissato. Una equazione lineare $L[v]=w$ può quindi sempre essere scritta nella forma $f(v)=0$ con $f$ affine.] si dirà che l'equazione differenziale è una equazione _lineare (non omogenea)_.
L'equazione non omogenea avrà la forma:
$a_0 (x) u(x) + a_1 (x) u'(x) + dots + a_n (x) u^((n))(x) = g(x).$
Se $v_0$ e $v_1$ sono due soluzioni di questa equazione è chiaro che la differenza $u = v_1 - v_0$ è soluzione dell'equazione omogenea
$a_0 (x) u(x) + a_1 (x) u'(x) + dots + a_n (x) u^((n))(x) = 0.$
Dunque quest'ultima si chiama equazione omogenea associata alla non omogenea e se $v_0$ è una soluzione particolare (qualunque) dell'equazione non omogenea ogni soluzione $v$ dell'equazione non omogenea si scrive nella forma
$v = v_0 + u$
con $u$ soluzione dell'omogenea associata.
Per trovare tutte le soluzioni di una equazione non omogenea è dunque sufficiente trovare una soluzione particolare della non omogenea e tutte le soluzioni della equazione omogenea associata.

L'equazione del pendolo @eq:39872 non è lineare ma quando l'angolo $u$ è piccolo (cioè per _piccole oscillazioni_) si ha $sin u tilde u$.
Facendo questa _linearizzazione_ si ottiene l'equazione
$u''(x) + u(x) + u'(x) = 0.$
Questa è una equazione lineare omogenea.
Se sul pendolo agisce una forza esterna (pendolo forzato) l'equazione diventa
$u''(x) + u(x) + u'(x) = g(x)$
dove $g(x)$ rappresenta l'entità di una forza esterna variabile nel tempo.
Questa equazione è lineare non omogenea.

Come nel caso generale le equazioni lineari di ordine $n$ si riconducono a sistemi lineari di $n$ equazioni del primo ordine.

== Problema di Cauchy

Andremo a dimostrare non solo che le equazioni lineari di ordine $n$ (omogenee o non omogenee) hanno come insieme delle soluzioni uno spazio lineare (vettoriale o affine) di dimensione $n$, ma, più in generale, che l'insieme delle soluzioni di una equazione differenziale anche non lineare, può essere descritto tramite $n$ parametri (dunque tale insieme di soluzioni può essere pensato come una "superficie" di dimensione $n$ nello spazio vettoriale di dimensione infinita di tutte le funzioni derivabili).

L'idea è che le equazioni ordinarie di ordine $n$ hanno una forma di _determinismo_: se conosco la soluzione $u(x_0)$ in un istante $x_0$ e conosco anche tutte le sue derivate $u'(x_0), u''(x_0), dots, u^((n-1))(x_0)$ in quell'ist