#import "../../lib.typ": *

= Metodi risolutivi

Una tipologia di equazioni differenziali che abbiamo già trattato è data dalle equazioni della forma:
$ u'(x) = f(x). $

Banalmente l'insieme delle soluzioni è dato dalle primitive di $f$:
$ u in integral f. $

Se $f$ è definita su un intervallo tutte le soluzioni sono definite sullo stesso intervallo e, grazie al teorema \@th:primitive si scrivono quindi nella forma
$ u(x) = F(x) + c $
dove $F$ è una qualunque primitiva di $f$ e $c in RR$ è una costante additiva arbitraria.
Se $f$ è continua e consideriamo il problema di Cauchy:
$ cases(
  u'(x) = f(x),
  u(x_0) = y_0
) $
possiamo identificare una unica soluzione che si scrive nella forma:
$ u(x) = y_0 + integral_(x_0)^x f(t) thin d t. $

== Equazioni lineari del primo ordine

Le equazioni differenziali ordinarie del primo ordine in forma normale possono essere scritte nella forma:
$ u'(x) + a(x) u(x) = b(x). $ <eq:47744>

Per risolvere queste equazioni si cerca di ricondurre la somma nel lato sinistro alla derivata di un prodotto.
Per fare ciò si considera una qualunque primitiva $A in integral a$ e si moltiplicano ambo i membri per $e^(A(x))$:
$ e^(A(x)) u'(x) + a(x) e^(A(x)) u(x) = b(x) e^(A(x)) $
essendo $A'(x) = a(x)$ si osserva che il lato sinistro è ora la derivata di un prodotto:
$ (e^(A(x)) u(x))' = b(x) e^(A(x)) $
da cui
$ e^(A(x)) u(x) in integral b(x) e^(A(x)) thin d x. $
Moltiplicando ambo i membri per $e^(-A(x))$ (visto che l'esponenziale non si annulla mai questa operazione non modifica lo spazio delle soluzioni) si ottiene
$ u(x) = e^(-A(x)) integral b(x) e^(A(x)) thin d x, quad A(x) in integral a(x) thin d x. $

Più esplicitamente scelta una qualunque primitiva del lato destro
$ F(x) in integral b(x) dot e^(A(x)) thin d x $
su ogni intervallo in cui $a(x)$ e $b(x)$ sono definite si ha
$ u(x) = e^(-A(x)) dot (F(x) + c) $
per qualche $c in RR$.

Se $b(x)=0$ l'equazione è lineare omogenea, possiamo scegliere $F(x) = 0$ e quindi lo spazio delle soluzioni in questo caso è dato da
$ u(x) = c dot e^(-A(x)) $
ed è quindi lo spazio vettoriale unidimensionale generato dalla funzione $e^(-A(x))$.

Ogni soluzione della equazione non omogenea si può scrivere come somma di una soluzione particolare $u_0$ della equazione non omogenea più una generica soluzione dell'equazione omogenea associata. Infatti:
$ u(x) = u_0 (x) + c e^(-A(x)) $
dove
$ u_0 (x) = e^(-A(x)) F(x) $
è una particolare soluzione dell'equazione non omogenea.

Osserviamo che se $a(x)$ e $b(x)$ sono funzioni continue definite su uno stesso intervallo $I$, anche la soluzione è definita su tutto $I$.
Si dirà quindi che la soluzione esiste _globalmente_.

#exercise[autovettori dell'operatore derivata][
  Fissato $lambda in RR$ trovare tutte le soluzioni dell'equazione
  $ u'(x) = lambda u(x). $
] <ex:58230978>

#proof[Svolgimento][
  Scriviamo l'equazione nella forma
  $ u'(x) - lambda u(x) = 0. $
  Nelle notazioni precedenti abbiamo $a(x) = -lambda$ e quindi possiamo scegliere $A(x) = -lambda x in integral a$.
  Moltiplicando ambo i membri per $e^(A(x))$ si ottiene
  $ e^(-lambda x) u'(x) - lambda e^(-lambda x) u(x) = 0 $
  cioè
  $ (e^(-lambda x) dot u(x))' = 0 $
  da cui su ogni intervallo in cui $u$ è definita esiste una costante $c$ tale che
  $ e^(-lambda x) u(x) = c $
  ovvero
  $ u(x) = c e^(lambda x). $
  Abbiamo dunque trovato che le soluzioni sono definite su tutto $RR$, una soluzione è $e^(lambda x)$ e ogni altra soluzione è multiplo di questa.
]

#exercise[
  + Trovare le soluzioni dell'equazione differenziale
    $ u' - u/x = x^2. $
  + Trovare le soluzioni dell'equazione differenziale
    $ x u' - u = x^3. $
]

#proof[Svolgimento][
  La prima è una equazione lineare non omogenea del primo ordine del tipo @eq:47744. Il fattore integrante è $e^(A(x))$ con
  $ A(x) in integral a(x) thin d x = - integral 1/x thin d x in.rev - ln |x|. $
  Dunque $e^(A(x)) = 1/|x|$. Dovremmo dunque dividere ambo i membri dell'equazione per $|x|$. Osserviamo che l'equazione non è definita per $x=0$ e possiamo dunque distinguere i casi $x>0$ e $x<0$. Decidiamo quindi, per semplicità, di cambiare segno all'equazione per $x<0$ cosicché possiamo dividere per $x$ invece che per $|x|$.
  Si ottiene dunque:
  $ (u')/x - u/x^2 = x $
  cioè
  $ (u dot 1/x)' = x $
  da cui
  $ u/x in integral x thin d x in.rev x^2 / 2. $
  Dunque la funzione $u(x)/x$ differisce da $x^2 / 2$ per una costante su ognuno dei due intervalli $x>0$ e $x<0$. Su ognuno dei due intervalli si ha dunque:
  $ (u(x))/x = x^2 / 2 + c $
  da cui
  $ u(x) = x^3 / 2 + c x $
  per qualche $c in RR$. Per come è stato posto il problema, la soluzione non deve essere definita per $x=0$ e la costante $c$ può essere quindi diversa se $x>0$ o $x<0$.

  La seconda equazione è equivalente alla prima se $x != 0$. Ma non è in forma normale e le soluzioni potranno essere definite anche per $x=0$.
  Si avrà quindi
  $ u(x) = x^3 / 2 + c x $
  come prima ma affinché la funzione sia derivabile in $x=0$ la costante $c$ dovrà essere uguale per $x>0$ e per $x<0$.

  Si osservi che ogni soluzione soddisfa la condizione iniziale $u(0) = 0$ e che quindi nessuna soluzione soddisfa la condizione $u(0) = q$ se $q != 0$.
]

#exercise[
  Risolvere l'equazione differenziale:
  $ u' + u / ((1+x^2) op("arctg") x) = 1. $
]

#proof[Svolgimento][
  Osserviamo che l'equazione è definita solo per $x != 0$. Cercheremo quindi le soluzioni sui due intervalli $x<0$ e $x>0$.
  Moltiplicando ambo i membri dell'equazione per $op("arctg") x$ si ottiene
  $ op("arctg") x dot u'(x) + 1/(1+x^2) u(x) = op("arctg") x $
  cioè:
  $ (op("arctg") x dot u(x))' = op("arctg") x $
  da cui
  $ op("arctg") x dot u(x) in integral op("arctg") x thin d x in.rev x op("arctg") x - 1/2 ln(1+x^2). $
  Dunque su ogni intervallo su cui la soluzione è definita esisterà $c in RR$ tale che
  $ op("arctg") x dot u(x) = x op("arctg") x - 1/2 ln(1+x^2) + c $
  da cui essendo $x != 0$ si può dividere per $op("arctg") x$ e ottenere
  $ u(x) = x - (ln(1+x^2))/(2 op("arctg") x) + c / (op("arctg") x). $
  Abbiamo quindi una famiglia di soluzioni definite per $x<0$ e una famiglia di soluzioni definite per $x>0$.
]

== Equazioni a variabili separabili

Si chiamano equazioni a variabili separabili le equazioni del tipo:
$ u'(x) = f(x) dot g(u(x)). $ <eq:edo_separabile>

Questa è una equazione del primo ordine in forma normale:
$ u'(x) = F(x, u(x)) $
dove nella funzione $F$ risulta possibile separare le due variabili in un prodotto:
$ F(x, y) = f(x) dot g(y). $

Se $u$ è una soluzione dell'equazione @eq:edo_separabile e se $x$ è un punto in cui $g(u(x)) != 0$, possiamo dividere ambo i membri dell'equazione per $g(u(x))$ per ottenere:
$ (u'(x))/(g(u(x))) = f(x). $
Vogliamo ora scrivere il lato sinistro come la derivata della funzione composta. Se scegliamo una primitiva di $1/g$:
$ H(u) in integral 1/(g(u)) thin d u $
si osserva che
$ (H(u(x)))' = H'(u(x)) dot u'(x) = (u'(x))/(g(u(x))) = f(x). $
dunque se $F in integral f$, su ogni intervallo in cui $g(u(x)) != 0$ dovrà esistere $c in RR$ tale che
$ H(u(x)) = F(x) + c. $
Se supponiamo inoltre che $H$ sia invertibile si avrà:
$ u(x) = H^(-1)(F(x) + c). $

#example[
  Risolviamo l'equazione
  $ u' = x^2 e^u. $ <eq:separabile>
]

#proof[Svolgimento][
  Visto che $e^u != 0$ possiamo dividere ambo i membri dell'equazione per $e^u$:
  $ (u'(x))/(e^(u(x))) = x^2 $
  prendendo le primitive di ambo i membri otteniamo
  $ integral (u'(x))/(e^(u(x))) thin d x = integral x^2 thin d x $
  e facendo il cambio di variabili: $u=u(x)$, $d u = u'(x) thin d x$ otteniamo:
  $ [integral e^(-u) thin d u]_(u=u(x)) = x^3 / 3 + c $
  da cui
  $ -e^(-u(x)) = x^3 / 3 + c $
  ovvero $u(x) = - ln(-c - x^3 / 3)$.
  Posto $b=-c$ si ottiene
  $ u(x) = - ln(b - x^3 / 3). $
  Dunque per ogni $b in RR$ si ottiene una soluzione $u: ]-infinity, root(3, 3b)[ -> RR$.
]

#figure(
  image("../../figure/fig_edo_separabile.pdf", width: 80%),
  caption: [
    I grafici delle soluzioni dell'equazione differenziale @eq:separabile.
    Si noti che ogni soluzione ha un asintoto verticale, dunque le singole soluzioni non sono definite su tutto $RR$.
    Ma scelto un qualunque punto del piano c'è una soluzione che passa per quel punto e inoltre due diverse soluzioni non si incontrano mai.
    Queste proprietà sono garantite dal teorema @th:banach-caccioppoli.
  ],
) <fig:separabile>

#example[
  Risolviamo l'equazione
  $ u' = x u^2 + x. $ <eq:43856>
]

#proof[Svolgimento][
  È una equazione del primo ordine in forma normale.
  Raccogliendo $x$ al lato destro si ottiene una equazione a variabili separabili.
  Dividendo ambo i membri per $u^2+1$ (che è sempre diverso da zero) si ottiene l'equazione equivalente
  $ (u')/(1+u^2) = x. $
  Integrando il lato sinistro si ottiene:
  $ integral (u'(x))/(1+u^2 (x)) thin d x = [integral (d u)/(1+u^2)]_(u=u(x)) in.rev op("arctg")(u(x)) $
  mentre per il lato destro si ottiene
  $ integral x thin d x in.rev x^2 / 2. $
  Dunque su ogni intervallo si deve avere
  $ op("arctg")(u(x)) = x^2 / 2 + c. $
  Visto che l'arcotangente assume valori compresi tra $-pi/2$ e $pi/2$ anche il lato destro dovrà rimanere in tale intervallo. Dovrà quindi essere:
  $ - pi/2 < x^2 / 2 + c < pi/2 . $ <eq:4856>
  Con questa condizione possiamo invertire l'arcotangente ottenendo finalmente una espressione per la soluzione:
  $ u(x) = op("tg")(x^2 / 2 + c). $ <eq:45876314>

  #figure(
    image("../../figure/fig_43856.pdf", width: 80%),
    caption: [
      I grafici delle soluzioni dell'equazione differenziale @eq:43856.
    ],
  ) <fig:43856>

  Osserviamo che la condizione @eq:4856 equivale a richiedere che l'argomento della tangente stia nell'intervallo $[-pi/2, pi/2]$.
  In tal caso dovrà essere $c < pi/2$ e si osserva che se $c > -pi/2$ la soluzione $u(x)$ è definita su un intervallo aperto centrato in $x=0$ mentre se $c <= -pi/2$ la soluzione è definita su una coppia di intervalli simmetrici con ampiezza che tende a zero quando $c -> -infinity$.
  Agli estremi di tali intervalli la soluzione ha degli asintoti verticali.

  In questo caso possiamo osservare che la condizione @eq:4856 può essere trascurata, visto che la funzione $op("tg")$ è $pi$-periodica e quindi è possibile sommare a $c$ un multiplo intero di $pi$ senza che la soluzione venga modificata.
  Nell'equazione @eq:45876314 si potrebbe quindi considerare la funzione $op("tg")$ definita su tutto il suo dominio osservando che in tal caso si può supporre che sia $c in ]-pi/2, pi/2]$.
  Invece di ottenere un singolo intervallo per ogni $c$ si ottengono così tutti gli infiniti intervalli.
]

#remark[
  L'esempio precedente mette in evidenza il fatto che le soluzioni massimali possono essere definite su intervalli arbitrariamente piccoli anche se l'equazione differenziale non presenta singolarità. Diremo in questo caso che la soluzione non è globale.

  D'altra parte si osserva che i grafici delle soluzioni riempiono tutto il piano senza mai toccarsi l'uno con l'altro (si dice a volte che sono una _fibrazione_).
  Questo è dovuto al fatto che questa equazione soddisfa il teorema @th:cauchy_lipschitz e quindi per ogni punto del piano passa una ed una sola soluzione.
]

#example[
  Si voglia risolvere l'equazione
  $ u' = u^2. $
  Si tratta di una equazione in forma normale, del primo ordine, autonoma.
  In particolare è a variabili separabili $u' = f(u(x)) dot g(x)$ con $f(u)=u^2$ e $g(x)=1$.
  Osserviamo innanzitutto che $u(x) = 0$ è soluzione in quanto $u'(x) = u^2 (x) = 0$.
  Se $u$ è una soluzione non identicamente nulla ci saranno dei punti in cui $u(x) != 0$.
  In un intorno di tali punti possiamo dividere ambo i membri dell'equazione per $u^2 (x)$ ottenendo:
  $ (u')/u^2 = 1. $
  Integrando il lato sinistro tramite cambio di variabile $u=u(x)$, $d u = u'(x) thin d x$ si ottiene:
  $ integral (u'(x))/(u^2 (x)) thin d x = [- 1/u]_(u=u(x)) = - 1/(u(x)) $
  mentre integrando il lato destro si ha
  $ integral 1 thin d x in.rev x. $
  Dunque su ogni intervallo in cui $u(x) != 0$ deve esistere una costante $c in RR$ tale che
  $ - 1/(u(x)) = x + c $
  ovvero, ponendo $x_0 = -c$
  $ u(x) = - 1/(x+c) = 1/(x_0 - x). $ <eq:5782196>

  In conclusione abbiamo trovato una soluzione costante $u(x)=0$ e una famiglia di soluzioni definite sugli intervalli $]-infinity, x_0[$ e $]x_0, +infinity[$ rappresentante dall'equazione @eq:5782196.
  Dovremmo ora chiederci se è possibile che queste soluzioni vengano mescolate tra loro, ovvero se una soluzione può valere zero in alcune zone e soddisfare @eq:5782196 in altre.

  In questo caso la risposta è no.
  Basta osservare che una funzione $u$ che soddisfa l'equazione @eq:5782196 può tendere a zero solamente quando $x -> +infinity$ o $x -> -infinity$.
  Questo significa che se consideriamo una soluzione $u(x)$ definita su un intervallo $I$ e se in almeno un punto la soluzione è diversa da zero, allora la soluzione è diversa da zero su tutto $I$ e soddisfa l'equazione @eq:5782196 in quanto la soluzione nulla e la soluzione @eq:5782196 non sono tra loro compatibili (non possono essere incollate con continuità).

  Vedremo più avanti un risultato (proposizione @prop:separazione_soluzioni) che garantisce in ipotesi molto generali che due diverse soluzioni non possono mai incontrarsi.
]

#exercise[
  Fissato $p>1$ si risolva l'equazione differenziale
  $ u' = u^p $
  e si osservi che la soluzione presenta sempre un asintoto verticale (dunque non c'è esistenza globale).
]

#example[baffo di Peano][
  Si determinino tutte le soluzioni del problema di Cauchy
  $ cases(
    u'(x) = root(3, u(x)),
    u(0) = 0
  ) $ <eq:94467>
]

#proof[Svolgimento][
  #figure(
    image("../../figure/fig_94467.pdf", width: 90%),
    caption: [
      Il baffo di Peano formato dalle soluzioni del problema di Cauchy @eq:94467.
    ],
  ) <fig:94467>

  Osserviamo che la funzione nulla $u(x)=0$ è soluzione dell'equazione e soddisfa la condizione $u(0)=0$.
  Ma a priori non possiamo escludere che ci siano altre soluzioni dell'equazione che verifichino la stessa condizione (vedremo che la proposizione @prop:separazione_soluzioni non si applica in questo caso particolare).

  Nei punti in cui $u(x) != 0$ possiamo riscrivere l'equazione nella forma
  $ (u'(x))/root(3, u(x)) = 1. $
  Integrando il lato sinistro tramite il cambio di variabili $u=u(x)$, $d u = u'(x) thin d x$, si ottiene
  $ integral (u'(x))/root(3, u(x)) thin d x = [integral (d u)/root(3, u)]_(u=u(x)) in.rev 3/2 root(3, u^2 (x)). $
  integrando anche il lato destro troviamo dunque che su ogni intervallo su cui $u$ è definita e $u(x) != 0$ deve esistere una costante $c$ tale che
  $ 3/2 root(3, u^2 (x)) = x + c. $
  Risolvendo in $u(x)$:
  $ u(x) = +/- sqrt((2/3 (x+c))^3). $ <eq:476937568>
  Osserviamo che la proprietà precedente può essere soddisfatta solamente se $x >= -c$ ma affinché sia $u(x) != 0$ dobbiamo imporre $x > -c$.
  Ma per $x -> -c^+$ si ha $u(x) -> 0$ e anche $u'(x) = root(3, u(x)) -> 0$.
  Significa che una soluzione definita su $x>c$ mediante la @eq:476937568 può essere estesa a tutto $RR$ ponendo $u(x)=0$ per $x <= c$.
  Affinché valga la condizione $u(0)=0$ sarà dunque sufficiente imporre la restrizione $-c >= 0$.

  Il nostro problema ha dunque infinite soluzioni definite su tutto $RR$. Per la precisione, per ogni $c >= 0$ (cambiamo segno alla costante trovata prima, in modo che risulti positiva) si hanno le soluzioni
  $ u(x) = cases(
    0 &text("per ") x <= c,
    sqrt((2/3 (x-c))^3) &text("per ") x > c
  ) $
  e
  $ u(x) = cases(
    0 &text("per ") x <= c,
    - sqrt((2/3 (x-c))^3) &text("per ") x > c
  ) $
]

== Altri metodi risolutivi

Nella sezione precedente abbiamo visto che le equazioni lineari del primo ordine e le equazioni a variabili separabili possono essere ricondotte al calcolo di una primitiva.
Nella sezione @sec:edo_lineari verranno esposti i metodi risolutivi per le equazioni lineari di ordine $n$ a coefficienti costanti.

Ci sono molti altri tipi di equazioni che possono essere ricondotti alle equazioni lineari o alle equazioni a variabili separabili.
Non potremo dilungarci su questi metodi ma può essere utile, come riferimento non esaustivo, un elenco di alcune tipologie di equazioni per le quali esiste un metodo risolutivo.

+ _Equazione del secondo ordine senza dipendenza da $u$_
  $ F(x, u', u'') = 0 $
  si riconduce al primo ordine ponendo $u'(x) = v(x)$, $u''(x) = v'(x)$.

+ _Equazione del secondo ordine autonoma_
  $ F(u, u', u'') = 0 $
  si riconduce al primo ordine ponendo $u'(x) = v(u(x))$, $u''(x) = v'(u(x)) dot v(u(x))$.

+ _Equazioni del primo ordine omogenee_
  $ u' = h(x, u(x)) $
  dove $h$ è omogenea, cioè: $h(t x, t y) = h(x, y)$ per ogni $t in RR$.
  Si riconduce ad una equazione a variabili separabili facendo la sostituzione $u(x) = x dot v(x)$.

+ _Equazione di Bernoulli_
  $ u' = a(x) u + b(x) u^alpha $
  si riconduce ad una equazione lineare dividendo tutto per $u^alpha$ e ponendo $u(x)^(1-alpha) = v(x)$, $(u')/u^alpha = (v')/(1-alpha)$.

+ _Equazione di Clairaut_
  $ u = x u' + f(u'); $
  derivando l'equazione si ottiene $u' = u' + x u'' + f'(u') u''$ che si fattorizza: $u'' dot (x + f'(u')) = 0$.
  Il secondo fattore ci permette di determinare $u'(x)$ e inserendo $u'$ nell'equazione originaria troviamo $u(x)$.
  Il primo fattore $u''=0$ ci dà come soluzione una retta che, sostituendone l'equazione nella equazione originaria, scopriamo essere tangente alla soluzione trovata precedentemente.
  A queste soluzioni bisogna aggiungere le soluzioni non $C^2$ formate da un tratto della curva iniziale e che poi si staccano lungo le semirette tangenti.

+ _Equazione di Riccati_
  $ u' = u^2 + b(x) u + c(x). $
  si ponga $u(x) = - (v'(x))/(v(x))$ per ricondursi ad una equazione lineare del secondo ordine in $v$:
  $ v'' - b(x) v' + c v = 0. $

#example[equazione di Newton][
  Un sistema fisico unidimensionale soggetto a forze che dipendono solamente dalla posizione può essere descritto da un problema di Cauchy:
  $ cases(
    u''(x) = F(u(x)),
    u(x_0) = u_0,
    u'(x_0) = v_0
  ) $
  (ad esempio per il pendolo si ha $F(y) = - sin y$).
  La funzione $v$ definita da $v(u(x)) = u'(x)$ mette in relazione la velocità con la posizione e descrive quindi il moto nel cosiddetto _spazio delle fasi_. Con tale sostituzione si trova
  $ u''(x) = v'(u(x)) u'(x) = v'(u(x)) v(u(x)) $
  che sostituita in $u'' = F(u)$ ci dà una equazione differenziale del primo ordine per $v=v(u)$:
  $ v' v = F(u). $
  Questa è una equazione del primo ordine a variabili separabili che può essere interpretata come la legge di conservazione dell'energia, infatti è equivalente a
  $ d/(d x) (1/2 v^2 - integral F(u)) = 0 $
  dove $1/2 v^2$ si interpreta come energia cinetica e $- integral F$ come energia potenziale.
  Integrando tra $x_0$ e $x$ e utilizzando le condizioni iniziali si ottiene, con $u=u(x)$:
  $ 1/2 v^2 (u) = 1/2 v_0^2 + integral_(u_0)^u F(y) thin d y. $
  Questa equazione descrive la traiettoria del sistema nel piano delle fasi $(u,v)$ e ci permette di ricavare $v$ in funzione di $u$:
  $ v(u) = +/- sqrt(v_0^2 + 2 integral_(u_0)^u F(u) thin d u) $
  che significa:
  $ u'(x) = +/- sqrt(v_0^2 + 2 integral_(u_0)^(u(x)) F(y) thin d y). $ <eq:8844475>
  Questa è una equazione autonoma in $u$, quindi a variabili separabili:
  $ +/- (u'(x))/sqrt(v_0^2 - integral_(u_0)^(u(x)) F(y) thin d y) = 1 $
  che può essere integrata tra $x_0$ e $x$ facendo il cambio di variabile $u=u(x)$
  $ +/- integral_(u_0)^(u(x)) (d u)/sqrt(v_0^2 - integral_(u_0)^u F(y) thin d y) = x - x_0. $
  In questo modo abbiamo determinato la funzione inversa della soluzione $u(x)$.
]

#example[periodo del pendolo][
  Proviamo a determinare il periodo di oscillazione di un pendolo.
]

#proof[Svolgimento][
  Sia $u(x)$ l'angolo di scostamento dalla verticale al tempo $x$ di un pendolo semplice di lunghezza $ell$.
  Considerando la componente tangenziale della accelerazione di gravità (il cui modulo è $g$) l'equazione di Newton può essere scritta nella forma:
  $ u''(x) = - g/ell sin u(x). $
  Siamo quindi nel caso dell'esempio precedente dove $F(u) = - g/ell sin u$ e se al tempo $x=0$ lasciamo cadere da fermo il pendolo da un angolo $u_0$, si avrà $v_0=0$. L'energia potenziale sarà data allora da
  $ - g/ell integral_(u_0)^u sin y thin d y = g/ell (cos u - cos u_0). $
  L'equazione @eq:8844475 diventa dunque
  $ u'(x) = +/- sqrt(2 g/ell (cos u(x) - cos u_0)). $
  Separando le variabili e integrando tra $0$ e $x$ si ottiene
  $ sqrt(ell/g) integral_0^x (u'(t) thin d t)/(+/- sqrt(2 cos u(t) - 2 cos u_0)) = integral_0^x d t = x. $
  Cambiando variabile $u=u(x)$, $d u = u'(x) d x$:
  $ sqrt(ell/g) integral_0^(u(x)) (d u)/(+/- sqrt(2 cos u - 2 cos u_0)) = x. $ <eq:4898944>
  La scelta del segno $+/-$ è arbitraria ma visto che $u$ è continua anche $u'' = - g/ell sin u$ deve essere una funzione continua. Dunque il segno $+/-$ può cambiare solo quando $u'=0$. Nel punto iniziale $x=0$ abbiamo imposto $u'(0) = 0$ e dunque l'energia cinetica è nulla. Visto che l'energia cinetica non può essere negativa significa che l'energia potenziale non può aumentare e quindi inizialmente l'angolo $u(x)$ dovrà diminuire (o almeno: non potrà aumentare). Dunque inizialmente il segno di $u'$ è negativo e rimarrà negativo finché non si avrà nuovamente $u'(x)=0$.
  L'integrale nella @eq:4898944 è un integrale improprio in quanto la funzione integranda presenta un asintoto per $u -> u_0^-$ dobbiamo dunque assicurarci che l'integrale sia finito. Sviluppando $cos u$ nel punto $u=u_0$ si trova $cos u = cos u_0 - sin u_0 dot (u-u_0) + o(u-u_0)$ da cui
  $ 1/sqrt(2 cos u - 2 cos u_0) = 1/sqrt(2 sin u_0 dot (u_0 - u) + o(u-u_0)) tilde C/sqrt(u_0 - u) $
  che è notoriamente una funzione integrabile per $u -> u_0^-$.

  Vogliamo ora calcolare il tempo $x_1$ in cui il pendolo raggiunge per la prima volta la verticale, cioè $u(x_1)=0$.
  Ricordiamo che al tempo $x=0$ il pendolo parte da un angolo $u_0$ con velocità nulla. Nell'intervallo $x in [0,x_1]$ si avrà $u'(x)<0$ (l'angolo diminuisce) dunque:
  $ - sqrt(ell/g) integral_(u_0)^0 (d u)/sqrt(2 cos u - 2 cos u_0) = x_1. $

  Una volta raggiunta la verticale, per simmetria il pendolo tornerà a risalire fino ad un angolo $-u_0$ mettendoci lo stesso tempo $x_1$. Poi tornerà a scendere e risalire fino a tornare all'angolo $u_0$ mettendoci in totale un tempo $T=4x_1$ che è quindi il periodo di oscillazione. Si ha dunque
  $ T/4 = sqrt(ell/g) integral_0^(u_0) (d u)/sqrt(2 cos u - 2 cos u_0). $

  Purtroppo l'integrale che abbiamo trovato non ha una primitiva esprimibile mediante funzioni elementari (è un integrale ellittico).
  Il nostro obiettivo è ora quello di farne uno sviluppo di Taylor per $u_0 -> 0$ che significa determinare il periodo del pendolo per _piccole oscillazioni_.

  Tramite formule di bisezione possiamo scrivere $cos u = 1 - 2 sin^2 u/2$ da cui
  $ sqrt(2 cos u - 2 cos u_0) = sqrt(4 sin^2 u_0 / 2 - 4 sin^2 u/2) = 2 sin u_0 / 2 sqrt(1 - (sin u/2 / sin u_0 / 2)^2) $
  dunque ponendo
  $ sin t = (sin u/2)/(sin u_0 / 2) $ <eq:4847843>
  si ha
  $ sqrt(ell/g) dot T/4 = integral_0^(u_0) (d u)/(2 sin u_0 / 2 sqrt(1 - sin^2 t)) = integral_0^(u_0) (d u)/(2 sin u_0 / 2 cos t) $
  ma per il cambio di variabile @eq:4847843 si ha
  $ cos t thin d t = (cos u/2)/(2 sin u_0 / 2) thin d u $
  ovvero
  $ (d u)/(2 sin u_0 / 2 cos t) = (d t)/(cos u/2) = (d t)/sqrt(1 - sin^2 t sin^2 u_0 / 2) $
  e quindi
  $ sqrt(g/ell) dot T/4 = integral_0^(pi/2) (d t)/(cos u/2) = integral_0^(pi/2) (d t)/sqrt(1 - sin^2 u/2) = integral_0^(pi/2) (d t)/sqrt(1 - sin^2 u_0 / 2 sin^2 t). $
  Utilizzando ora la serie binomiale (teorema \@th:serie_binomiale) possiamo scrivere
  $ sqrt(g/ell) dot T/4
      &= integral_0^(pi/2) sum_(k=0)^(+infinity) binom(-1/2, k) (- sin^2 t sin^2 u_0 / 2)^k thin d t \
      &= integral_0^(pi/2) sum_(k=0)^(+infinity) ((2k-1)!!)/((2k)!!) (sin^2 t sin^2 u_0 / 2)^k thin d t $
  in quanto si ha
  $ binom(-1/2, k) = ((-1/2) dot (-3/2) dots (-(2k-1)/2))/(k!) = (-1)^k ((2k-1)!!)/(2^k dot k!) = (-1)^k ((2k-1)!!)/((2k)!!). $
  Rispetto alla variabile $sin^2 t$ dentro all'integrale abbiamo ora una serie di potenze con coefficienti
  $ a_k = ((2k-1)!!)/((2k)!!) (sin^2 u_0 / 2)^k $
  e si verifica facilmente che $a_(k+1) / a_k -> sin^2 u_0 / 2$ dunque la serie di potenze converge se $sin^2 t <= 1/(sin^2 u_0 / 2)$ che significa semplicemente $sin u/2 < 1$.
  Stiamo quindi facendo un integrale strettamente all'interno del raggio di convergenza della serie. Sappiamo che la serie converge totalmente e quindi uniformemente su tale intervallo.
  Dunque, applicando il teorema @th:scambio_limite_integrale alle somme parziali della serie, possiamo scambiare la serie con l'integrale:
  $ sqrt(g/ell) dot T/4 = sum_(k=0)^(+infinity) ((2k-1)!!)/((2k)!!) (sin u_0 / 2)^(2k) integral_0^(pi/2) (sin t)^(2k) thin d t $
  l'integrale è ora sostanzialmente lo stesso $I_n$ che abbiamo calcolato nel teorema \@th:wallis:
  $ integral_0^(pi/2) (sin t)^(2k) thin d t = 1/2 integral_0^pi (sin t)^(2k) thin d t = I_(2k) / 2 = pi/2 dot ((2k-1)!!)/((2k)!!) $
  da cui
  $ T = 2 pi sqrt(ell/g) sum_(k=0)^(+infinity) (((2k-1)!!)/((2k)!))^2 (sin u_0 / 2)^(2k). $

  Possiamo allora cercare di scrivere i primi termini dello sviluppo di Taylor di $T = T(u_0)$ per $u_0 -> 0$ diciamo, per esempio, fino all'ordine 8 in $u_0$. Basterà considerare la somma dei termini della serie per $k=0,1,2,3,4$ in quanto la somma dei termini per $k >= 5$ mi darà un contributo dell'ordine di $O(sin u_0 / 2)^(10) = o(u_0^8)$. Dunque
  $ sqrt(g/ell) dot T/(2 pi)
      &= 1 + (1/2)^2 sin^2 u_0 / 2 + ((1 dot 3)/(2 dot 4))^2 (sin^2 u_0 / 2)^2 \
      &quad + ((1 dot 3 dot 5)/(2 dot 4 dot 6))^2 (sin^2 u_0 / 2)^3 + ((1 dot 3 dot 5 dot 7)/(2 dot 4 dot 6 dot 8))^2 (sin^2 u_0 / 2)^4 + o(u_0^8) \
      &= 1 + 1/4 (u_0^2 / 4 - u_0^4 / (2^4 dot 3) + u_0^6 / (2^5 dot 3^2 dot 5) - u_0^8 / (2^8 dot 3^2 dot 5 dot 7)) \
      &quad + 3^2 / 2^6 (u_0^2 / 4 - u_0^4 / (2^4 dot 3) + u_0^6 / (2^5 dot 3^2 dot 5))^2 \
      &quad + 5^2 / 2^8 (u_0^2 / 4 - u_0^4 / (2^4 dot 3))^3 + (5^2 dot 7^2)/2^14 u_0^8 / 2^8 + o(u_0^8) \
      &= 1 + u_0^2 / 2^4 - u_0^4 / (2^6 dot 3) + u_0^6 / (2^7 dot 3^2 dot 5) - u_0^8 / (2^(10) dot 3^2 dot 5 dot 7) \
      &quad + 3^2 / 2^6 (u_0^4 / 2^4 - u_0^6 / (2^5 dot 3) + u_0^8 / (2^8 dot 3^2) + u_0^8 / (2^6 dot 3^2 dot 5)) \
      &quad + 5^2 / 2^8 (u_0^6 / 2^6 - u_0^8 / 2^8) + (5^2 dot 7^2)/2^22 u_0^8 + o(u_0^8) \
      &= 1 + u_0^2 / 2^4 + 11/(2^(10) dot 3) u_0^4 + 173/(2^14 dot 3^2 dot 5) u_0^6 + 22931/(2^22 dot 3^2 dot 5 dot 7) u_0^8 + o(u_0^8). $
]

= Alcuni risultati preparatori sulle funzioni vettoriali e di più variabili

Ci sarà utile estendere la definizione delle classi di regolarità $C^k$ alle funzioni vettoriali (cioè con codominio $RR^n$) e di più variabili (cioè con dominio $RR^m$).

== Continuità e compattezza

Lo spazio $RR^n$ è uno spazio metrico con la distanza euclidea (definizione @def:124124) $d(arrow(x), arrow(y)) = |arrow(x) - arrow(y)|$ con
$ |arrow(x)| = sqrt(x_1^2 + dots + x_n^2). $

Dunque una successione $arrow(x)_k in RR^n$ converge ad un punto $arrow(p) in RR^n$ se vale (definizione @def:convergenza_metrica) $|arrow(x)_k - arrow(p)| -> 0$.
Se $(x_k)_j$ sono le componenti del punto $arrow(x)_k in RR^n$ e $p_j$ sono le componenti di $arrow(p) in RR^n$ la convergenza $arrow(x)_k -> arrow(p)$ è equivalente alla convergenza di tutte le componenti: $(x_k)_j -> p_j$ per ogni $j=1, dots, n$ per $k -> +infinity$.

Una funzione $arrow(f): A subset RR^n -> RR^m$ è _continua_ (definizione @def:continua_metrico) se per ogni successione $arrow(x)_n -> arrow(p)$ con $arrow(x)_n in A$ e $arrow(p) in A$ risulta
$ arrow(f)(arrow(x)_n) -> arrow(f)(arrow(p)). $

Un insieme $K subset RR^n$ è _chiuso_ se presa una qualunque successione convergente in $RR^n$: $arrow(x)_k -> arrow(x)$ se ogni $arrow(x)_k in K$ allora anche $arrow(x) in K$ (cioè $K$ è chiuso per passaggio al limite, teorema @th:chiuso_sequenziale).
La palla di raggio $r>0$ centrata nel punto $arrow(p) in RR^n$ è l'insieme (definizione @def:palla):
$ B_r (arrow(p)) = {arrow(x) in RR^n : |arrow(x) - arrow(p)| < r}. $
Un insieme $Omega subset RR^n$ è _aperto_ se per ogni $arrow(p) in Omega$ esiste $r>0$ tale che $B_rho (arrow(p)) subset Omega$ (definizione @def:466342).
Un insieme $B subset RR^n$ si dice essere _limitato_ (definizione @def:spazio_limitato) se esiste $r>0$ e $arrow(p) in RR^n$ tali che $B subset B_r (arrow(p))$ (ma non è restrittivo supporre $arrow(p)=0$).
Un insieme $K subset RR^n$ si dice essere _compatto_ (definizione @def:sequenzialmente_compatto) se da ogni successione $arrow(x)_k$ di punti di $K$ è possibile estrarre una sottosuccessione $x_(k_j) -> arrow(x)$ convergente ad un punto $arrow(x) in K$.
In $RR^n$ un insieme è compatto se e solo se è chiuso e limitato (teorema @th:compattezza_Rn).
Una funzione continua $f: K subset RR^n -> RR$ definita su un compatto $K$ è limitata per il teorema di Weierstrass (teorema @th:weiestrass_metrico).

== Derivate parziali

Se $Omega subset RR^m$ è un insieme aperto e $f: Omega -> RR$ è una funzione, vogliamo definire le _derivate parziali_ di $f$.
Se $arrow(x) in Omega$ si ha $arrow(x) = (x_1, dots, x_m)$ e quindi $f(arrow(x)) = f(x_1, dots, x_m)$. Se facciamo variare una sola componente $x_j$ mantenendo fisse tutte le altre componenti, otteniamo una funzione di una variabile $x_j |-> g(x_j) = f(x_1, dots, x_j, dots, x_m)$.
Definiamo dunque la _derivata parziale_ di $f$ rispetto alla variabile $x_j$ come la derivata della funzione $g(x_j)$.
Denotiamo tale derivata con il simbolo:
$ (partial f) / (partial x_j). $
Le derivate parziali si calcolano dunque come le usuali derivate per le funzioni di una variabile, solamente bisogna considerare costanti tutte le variabili tranne quella coinvolta nella derivazione.
Ad esempio se $f(x,v) = - sin(x) - v$ (come nell'esempio fatto nell'introduzione) si ha
$ (partial f) / (partial x) &= - cos(x) \
  (partial f) / (partial v) &= -1. $

Se $arrow(f): Omega subset RR^m -> RR^n$ è una funzione di più variabili a valori vettoriali potremo scrivere $arrow(f) = (f_1, dots, f_n)$ e considerare le derivate parziali di ogni componente:
$ (partial arrow(f)) / (partial x_j) = ((partial f_1) / (partial x_j), dots, (partial f_n) / (partial x_j)). $

#definition[
  Sia $Omega subset RR^m$ un aperto. Denoteremo con $C^0(Omega, RR^n)$ lo spazio vettoriale di tutte le funzioni continue $f: Omega -> RR^n$.

  Denotiamo con $C^1(Omega, RR^n)$ lo spazio vettoriale delle funzioni in $C^0(Omega, RR^n)$ tali che ognuna delle loro derivate parziali $(partial f) / (partial x_j)$ esiste in ogni punto di $Omega$ ed è a sua volta una funzione continua (cioè in $C^0(Omega, RR^n)$).
  Ricorsivamente si definisce $C^k(Omega, RR^n)$ per $k>1$, come lo spazio delle funzioni $Omega -> RR^n$ tali che tutte le loro derivate parziali stanno in $C^(k-1)(Omega, RR^n)$.

  Quando lo spazio di arrivo non è indicato si sottointende sempre $RR$, quindi $C^k(Omega) = C^k(Omega, RR)$.
]

#theorem[stabilità delle funzioni regolari][
  Sia $Omega subset RR^n$ un aperto.
  Se $f,g in C^k(Omega)$ allora anche $f+g$, $f-g$, $f dot g$ e $f/g$ (dove è definita) sono di classe $C^k$. Se $f in C^k(Omega)$ e $g in C^k(RR)$ allora $g compose f in C^k(Omega)$.
]

#proof[
  Il fatto che la composizione di funzioni continue sia una funzione continua è vero in generale in qualunque spazio metrico.
  Infatti se $f: X -> Y$ e $g: Y -> Z$ e se $x_k -> x$ in $X$ allora $f(x_k) -> f(x)$ in $Y$ (per la continuità di $f$) e quindi $g(f(x_k)) -> g(f(x))$ in $Z$ (per la continuità di $g$).
  Dunque $(g compose f)(x_k) -> (g compose f)(x)$ e $g compose f: X -> Z$ è continua.

  Possiamo dunque osservare che le funzioni di due variabili $s(x,y) = x+y$, $d(x,y)=x-y$ e $m(x,y)=x y$ sono funzioni continue da $RR^2 -> RR$ (grazie al teorema \@th:operazioni_limiti).
  Questo garantisce che la somma, la differenza e il prodotto di funzioni continue siano funzioni continue.
  Anche il reciproco di funzioni continue è una funzione continua in quanto la funzione $r(x)=1/x$ è continua.
  Ne consegue che il rapporto di funzioni continue è una funzione continua.

  Veniamo ora alle derivate parziali.
  Per le regole di derivazione delle funzioni di una variabile sappiamo che somma, prodotto, differenza, rapporto (ove definito) e composizione di funzioni derivabili sono a loro volta funzioni derivabili e la derivata si esprime sempre mediante somma, prodotto, differenza e rapporto delle funzioni coinvolte e delle loro derivate. Dunque quello che si ottiene combinando tra loro funzioni di classe $C^k$ è una funzione continua le cui derivate parziali esistono e sono di classe $C^(k-1)$, dunque è una funzione di classe $C^k$.
]

== Integrali di funzioni vettoriali

#definition[
  Sia $arrow(f): [a,b] -> RR^m$, $arrow(f)(x) = (f_1(x), dots, f_m(x))$.
  Diremo che $arrow(f)$ è integrabile su $[a,b]$ se ogni $f_k: [a,b] -> RR$ è integrabile su $[a,b]$ e in tal caso porremo:
  $ integral_a^b arrow(f)(x) thin d x = (integral_a^b f_1(x) thin d x, dots, integral_a^b f_m(x) thin d x) in RR^m $
  cosicché per ogni $k=1, dots, m$ si ha:
  $ (integral_a^b arrow(f)(x) thin d x)_k = integral_a^b f_k(x) thin d x. $
  Come al solito si pone inoltre $integral_b^a arrow(f) = - integral_a^b arrow(f)$.
]

#theorem[
  Sia $arrow(f): [a,b] -> RR^m$ integrabile. Allora si ha
  $ |integral_a^b arrow(f)(x) thin d x| <= integral_a^b |arrow(f)(x)| thin d x. $
] <th:stima_modulo_integrale>

#proof[
  Posto
  $ arrow(v) = integral_a^b arrow(f)(x) thin d x $
  si ha, usando la linearità dell'integrale e sfruttando la disuguaglianza di Cauchy-Schwarz
  $ |arrow(v)|^2
      &= arrow(v) dot arrow(v)
      = sum_(k=1)^m v_k integral_a^b f_k(x) thin d x
      = integral_a^b sum_(k=1)^m v_k f_k(x) thin d x \
      &= integral_a^b (arrow(v), arrow(f)(x)) thin d x
      <= integral_a^b |arrow(v)| dot |arrow(f)(x)| thin d x
      = |arrow(v)| integral_a^b |arrow(f)(x)| thin d x. $
  Se $|arrow(v)| != 0$ possiamo dividere ambo i membri per $|arrow(v)|$ e ottenere la disuguaglianza cercata.
  Altrimenti se $|arrow(v)|=0$ la disuguaglianza è certamente soddisfatta in quanto il lato destro non può essere negativo.
]