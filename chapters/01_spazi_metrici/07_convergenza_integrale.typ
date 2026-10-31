#import "../../lib.typ": *

= Convergenza integrale <sec:convergenza_integrale>

Motivati da come viene definita la norma di un vettore in $RR^n$ risulta naturale dare la seguente definizione di _norma euclidea_ per una funzione $f: (a,b) -> RR$:
$ norm(f)_2 = sqrt(integral_a^b |f(x)|^2 thin d x). $

Questa definizione ha senso, come integrale improprio, se la funzione $f$ è localmente Riemann-integrabile sull'intervallo $(a,b)$ (definizione \@def:localmente_riemann). In tal caso l'integrale esiste, ma potrebbe assumere il valore $+infinity$. Definiamo allora
$ cal(H)(a,b) = {f text(" localmente Riemann-integrabile su ") (a,b) : norm(f)_2 < +infinity}. $

Cercheremo ora di dimostrare che la norma che abbiamo introdotto è effettivamente una norma (nel senso della definizione @def:norma) che rende $cal(H)(a,b)$ uno spazio vettoriale euclideo di dimensione infinita.

Innanzitutto è chiaro che qualunque sia $f$ si ha $norm(f)_2 >= 0$.
Inoltre è banale osservare che la norma è omogenea: se $t in RR$ si ha:
$ norm(t dot f)_2 = |t| dot norm(f)_2. $
Dunque se $f in cal(H)(a,b)$ anche $t f in cal(H)(a,b)$ per ogni $t in RR$.
Se $f,g in cal(H)(a,b)$ per la proprietà del parallelogramma @eq:parallelogramma valida in $RR$ si ha
$ (f(x) + g(x))^2 <= 2f^2(x) + 2 g^2(x) $
e dunque se $f,g in cal(H)(a,b)$ anche $f+g in cal(H)(a,b)$.
Dunque $cal(H)(a,b)$ è uno spazio vettoriale.

Si noti che se $f$ e $g$ sono localmente Riemann-integrabili allora $f+g$, $f^2$, $g^2$ e $(f+g)^2$ lo sono (vedi appunti di Analisi Matematica Uno). Ma allora, anche $f dot g = ((f+g)^2-f^2-g^2) / 2$ è Riemann-integrabile.
Per $f,g in cal(H)(a,b)$ possiamo allora definire il prodotto scalare:
$ chevron.l f, g chevron.r = integral_a^b f(x) dot g(x) thin d x. $ <eq:854392>

La disuguaglianza di Young @eq:Young valida in $RR$ ci dice che
$ |f(x) dot g(x)| <= (f^2(x)+g^2(x)) / 2 $
e dunque garantisce che l'integrale @eq:854392 sia assolutamente convergente. Dunque se $f,g in cal(H)(a,b)$ il prodotto scalare $chevron.l f,g chevron.r$ è ben definito ed è un numero finito. A questo punto è facile verificare che $chevron.l f,g chevron.r$ è una forma bilineare simmetrica non negativa. Dunque soddisfa tutte le proprietà formali date nella definizione @def:prodotto_scalare di prodotto scalare salvo il fatto che non è garantito che $chevron.l f,f chevron.r = 0$ implichi $f=0$. In effetti questa proprietà è falsa perché se la funzione $f^2(x)$ ha integrale nullo non è detto che sia identicamente nulla: l'integrale, infatti, non cambia se la funzione viene modificata in un singolo punto.

Per ovviare a questo problema bisogna che identifichiamo due funzioni $f,g in cal(H)(a,b)$ se $norm(f-g)_2=0$:
$ f ~ g <=> norm(f-g)_2=0. $
Chiamiamo $H(a,b)$ il quoziente:
$ H(a,b) = cal(H)(a,b)/~ $
cioè lo spazio vettoriale delle funzioni in $cal(H)(a,b)$ dove due funzioni vengono identificate se la norma della differenza è nulla.

Lo spazio quoziente $H(a,b)$ risulta finalmente essere uno spazio euclideo.
Mantiene infatti la struttura vettoriale (in quanto l'insieme delle $f in cal(H)(a,b)$ con $norm(f)_2=0$ è uno spazio vettoriale) e il prodotto scalare $chevron.l f,g chevron.r$ (e di conseguenza la norma $norm(f)_2$) è ben definito su $H(a,b)$ e oltre alle proprietà che già abbiamo dimostrato possiamo ora affermare che $chevron.l f,f chevron.r = norm(f)_2=0$ se e solo se $f=0$.

#remark[
  La notazione $H(a,b)$ che scegliamo di utilizzare per definire questo spazio non è standard. La lettera $H$ rimanda ad Hilbert in quanto lo studio di questo spazio in particolare ha spinto verso l'astrazione del concetto di spazio di Hilbert. Quello che vedremo nel seguito è che questo spazio non risulta essere completo e dunque in realtà non è uno spazio di Hilbert. In effetti l'utilizzo degli integrali impropri è un tentativo di estendere l'integrale di Riemann in modo da rendere completo questo spazio. Solo con la definizione di integrale di Lebesgue (1875–1941) si è riusciti ad estendere l'integrale di Riemann ad una classe più ampia di funzioni fino a completare lo spazio. L'analogo dello spazio $H(a,b)$ definito tramite integrale di Lebesgue viene usualmente chiamato $L^2$. L'esponente $2$ è dovuto al fatto che sarebbe possibile definire gli spazi $L^p$ in maniera analoga a quanto fatto nell'esempio @ex:norma_p. Si avrebbe ancora che solo per $p=2$ questi spazi normati sono euclidei, cioè solo per $p=2$ la norma è indotta da un prodotto scalare. Tutti gli spazi $L^p$ sono completi e dunque sono spazi di Banach. Ma $L^2$ è anche uno spazio di Hilbert, in quanto è dotato di prodotto scalare. Anzi potremmo dire che $L^2$ è lo spazio di Hilbert per antonomasia e viene denotato anche con il nome $H^0$ (in questo caso l'esponente denota la derivabilità delle funzioni, come in $C^0$).
]

Gli elementi di $H(a,b)$ non sono funzioni, ma classi di equivalenza di funzioni. Nel seguito, però, tratteremo $f in H(a,b)$ come se fosse $f in cal(H)(a,b)$ facendo attenzione che le nostre affermazioni rimangano valide se al posto di una funzione $f$ si prende una funzione a lei equivalente. In particolare avrà senso considerare gli integrali di queste funzioni, perché il valore dell'integrale non dipende dal rappresentante scelto, ma non avrà senso considerare il valore che le funzioni assumono in un singolo punto, perché questo dipende dal rappresentante.

== Serie di Fourier <sec:serie_fourier>

Lo spazio $H(a,b)$ è uno spazio vettoriale reale su cui siamo riusciti a definire un prodotto scalare e quindi una norma. Vorremmo trovare su $H(a,b)$ una base ortonormale rispetto alla quale sia possibile scrivere le coordinate dei vettori (cioè delle funzioni) di $H(a,b)$. Visto che $H(a,b)$ non ha dimensione finita non potremo sperare di trovare una base con un numero finito di elementi. Introduciamo quindi la seguente.

#definition[base hilbertiana][
  Sia $V$ uno spazio euclideo. Siano $e_k in V$ con $k in NN$. Diremo che $e_k$ è un _sistema ortonormale_ se $chevron.l e_k, e_j chevron.r = 0$ quando $k != j$ e $chevron.l e_k, e_k chevron.r = 1$ per ogni $k in NN$.
  Diremo che $e_k$ è una _base hilbertiana_ se è un sistema ortonormale e inoltre per ogni $v in V$ esistono $c_k in RR$ con $k in NN$ per cui si abbia
  $ v = sum_(k=0)^(+infinity) c_k e_k. $ <eq:49346>
]

#theorem[disuguaglianza di Bessel][
  Sia $e_0, e_1, e_2, dots$ un sistema ortonormale in uno spazio euclideo $V$. Per ogni $v in V$ e per ogni $k in NN$ si ponga $c_k = chevron.l v,e_k chevron.r$. Allora vale la _disuguaglianza di Bessel_:
  $ sum_(k=0)^(+infinity) c_k^2 <= |v|^2. $ <eq:disuguaglianza_Bessel>

  Vale inoltre l'uguaglianza
  $ sum_(k=0)^(+infinity) c_k^2 = |v|^2 $ <eq:487562>
  se e solo se vale la @eq:49346.

  Possiamo quindi affermare che il sistema ortonormale $e_0, e_1, e_2, dots$ è una base hilbertiana se e solo se per ogni $v in V$ vale l'uguaglianza @eq:487562.
] <th:bessel>

#proof[
  Dato $v in V$ poniamo $c_k = chevron.l v,e_k chevron.r$ e
  $ v_N = sum_(k=0)^N c_k e_k, quad w_N = v - v_N. $
  Osserviamo che per ogni $n in NN$ si ha $chevron.l v_N,w_N chevron.r = 0$ ($w_N$ è ortogonale a $v_N$) in quanto se $n <= N$:
  $ chevron.l w_N , e_n chevron.r
      = chevron.l v, e_n chevron.r - sum_(k=0)^N c_k chevron.l e_k, e_n chevron.r
      = chevron.l v,e_n chevron.r - c_n = 0 $
  e quindi
  $ chevron.l w_N, v_N chevron.r = sum_(k=0)^N c_k chevron.l w_N, e_k chevron.r = 0. $
  dunque possiamo concludere, grazie al teorema di Pitagora @eq:Pitagora
  $ |v|^2
      &= |v_N + w_N|^2
      = |v_N|^2 + |w_N|^2 \
      &>= |v_N|^2 = |sum_(k=0)^N c_k e_k|^2
      = sum_(k=0)^N c_k^2. $
  Passando al limite per $N -> +infinity$ si ottiene la disuguaglianza di Bessel.

  Abbiamo visto che $|w_N|^2 = |v|^2 - |v_N|^2$ dunque la condizione $|w_N|^2 -> 0$ è equivalente all'uguaglianza di Bessel: $|v_N|^2 -> |v|^2$. Il sistema è hilbertiano, per definizione, se e solo se $v_N -> v$ ovvero se $w_N -> 0$.
]

Il nostro obiettivo è ora quello di produrre una base hilbertiana di $H(0,2pi)$. Una base di $H(a,b)$ si potrà ottenere di conseguenza traslando e riscalando opportunamente le funzioni della base di $H(0,2pi)$.
Il teorema precedente ci dice che se $H(a,b)$ ammette una base hilbertiana $e_k$ allora ogni funzione $u in H(a,b)$ può essere semplicemente rappresentata da una successione numerica $x_k = (u, e_k)$ in modo che
$ norm(u)_2 = sqrt(sum_k x_k^2). $
#footnote[
  Se $u$ rappresenta l'intensità del segnale acustico emesso da uno strumento musicale che suona una certa nota, possiamo immaginare che $u$ sia una funzione periodica di frequenza $nu$ pari alla frequenza della nota emessa. Le funzioni $e_k$ della base hilbertiana sono funzioni sinusoidali ognuna con frequenza $nu k$. I coefficienti $x_k$ nella decomposizione $u = sum x_k u_k$ rappresentano le intensità di ognuna di queste frequenze fondamentali e determinano il _timbro_ dello strumento musicale.
]

Consideriamo le seguenti funzioni trigonometriche #footnote[
  Dal punto di vista algebrico sarebbe molto più semplice considerare le funzioni a valori complessi:
  $ e_k(x) = e^(i k x) / sqrt(2pi) $
  al variare di $k in ZZ$. Preferiamo però rimanere nell'ambito delle funzioni reali per non dover introdurre la struttura hermitiana degli spazi vettoriali complessi.
]:
$
  e_0 (x) &= 1 / sqrt(2pi) \
  e_(2k+1)(x) &= sin(k x) / sqrt(pi) quad &k=0,1,dots \
  e_(2k)(x) &= cos(k x) / sqrt(pi) quad &k=1,2,dots
$ <eq:54741346>

Ovviamente
$ norm(e_0)_2 = sqrt(integral_0^(2pi) (1 / sqrt(2pi))^2 thin d x) = 1 $
ma è anche facile verificare che
$ integral_0^(2pi) cos^2 (k x) thin d x = 1 / k integral_0^(2k pi) cos^2 y thin d y = integral_0^(2pi) cos^2 y thin d y = pi $
da cui si ottiene $norm(e_(2k))_2 = 1$.
Visto che la funzione $sin$ è la traslata di $cos$ si ottiene analogamente che $norm(e_(2k+1))_2 = 1$.
Dunque i vettori $e_0,e_1,dots$ sono tutti di modulo unitario.
Utilizzando la formula di Eulero si può trovare la _formula di Werner_:
$ sin(m x) cos(n x)
    &= (e^(i m x) - e^(-i m x)) / (2i) dot (e^(i n x) + e^(-i n x)) / 2 \
    &= (e^(i (m+n) x)) / (4i) - (e^(-i (m+n) x)) / (4i) + (e^(i (m-n) x)) / (4i) - (e^(-i (m-n) x)) / (4i) \
    &= sin((m+n)x) / 2 + sin((m-n)x) / 2 $
da cui se $m != n$:
$ integral_0^(2pi) sin(m x) cos(n x) thin d x
    &= - 1 / (2(m+n)) lr([cos((m+n)x)])_0^(2pi) - 1 / (2(m-n)) lr([cos((m-n)x)])_0^(2pi) = 0 $
e se $m=n$ si arriva comunque allo stesso risultato.
Questo significa che $chevron.l e_(2n),e_(2m+1) chevron.r = 0$.
Discorso analogo si può fare per le funzioni $sin(m x) sin(n x)$ e $cos(m x) cos(n x)$ trovando, anche in quei casi, che tali prodotti hanno integrale nullo nell'intervallo $[0,2pi]$.
Per nostra memoria le formule di Werner che si trovano in questi ultimi casi sono:
$ cos(m x) cos(n x) &= cos((m+n)x) / 2 + cos((m-n)x) / 2 \
  sin(m x) sin(n x) &= cos((m-n)x) / 2 - cos((m+n)x) / 2. $

Risulta dunque che le funzioni $e_0,e_1,e_2,dots$ definite da @eq:54741346 formano un sistema ortonormale in $H(0,2pi)$ in quanto si ha:
$ chevron.l e_n, e_m chevron.r = cases(1 &text("se ") m=n, 0 &text("altrimenti").) $
Di conseguenza le funzioni $e_0,e_1,e_2, dots$ sono tra loro indipendenti in $H(0,2pi)$ in quanto se una loro combinazione lineare è nulla:
$ sum_(k=0)^n lambda_k e_k = 0 $
allora, facendone il prodotto scalare con $e_j$ si ottiene:
$ 0 = chevron.l sum_(k=0)^n lambda_k e_k , e_j chevron.r = sum_(k=0)^n lambda_k chevron.l e_k, e_j chevron.r = lambda_j $
e dunque tutti i coefficienti $lambda_j$ sono nulli.
Possiamo in particolare dedurre che $H(0,2pi)$ ha dimensione infinita.

#definition[polinomi trigonometrici][
  Una funzione $f$ si dice essere un _polinomio trigonometrico_ se esiste un polinomio in due variabili $P(X,Y)$ tale che
  $ f(x) = P(cos x, sin x). $
]

Possiamo verificare che $f$ è un polinomio trigonometrico se e solo se è possibile scrivere $f$ come combinazione lineare finita delle funzioni $e_k$ appena introdotte, cioè se esistono $c_0, c_1, dots, c_n in RR$ tali che
$ f = sum_(k=0) c_k e_k. $
Basta infatti ricondurre le funzioni trigonometriche all'esponenziale complesso, tramite la formula di Eulero:
$ cos(n x) + i sin(n x)
    &= e^(i n x) = (e^(i x))^n = (cos x + i sin x)^n \
    &= sum_(k=0)^n binom(n, k) i^k (sin x)^k (cos x)^(n-k) $
da cui, prendendo parte reale, e parte immaginaria si riesce ad esprimere $cos(n x)$ e $sin(n x)$ come polinomio in $sin x$ e $cos x$.
Più precisamente per il coseno si ottengono solo i termini con $k$ pari:
$ cos(n x)
    &= sum_(k=0)^(floor(n / 2)) binom(n, 2k) (-1)^k (sin x)^(2k) (cos x)^(n-2k) \
    &= sum_(k=0)^(floor(n / 2)) binom(n, 2k) (cos^2 x - 1)^k (cos x)^(n-2k) $
ovvero
$ cos(n x) = T_n(cos x) $
dove
$ T_n(x) = sum_(k=0)^(floor(n / 2)) binom(n, 2k) (x^2 - 1)^k x^(n-2k) $
si chiama _polinomio di Chebyshev di prima specie_.
Questo significa che ognuna delle funzioni $e_k$ che abbiamo introdotto in @eq:54741346 è un polinomio trigonometrico e quindi ogni combinazione finita di tali funzioni è ancora un polinomio trigonometrico.

Viceversa per verificare che ogni polinomio trigonometrico può essere rappresentato come combinazione lineare finita degli elementi $e_k$ possiamo osservare che se $f(x) = P(cos x,sin x)$ è un polinomio trigonometrico allora usando le formule di Eulero si può scrivere $f(x) = Q(e^(i x), e^(-i x))$ dove $Q$ è un polinomio a coefficienti complessi. Ma osservando che
$ (e^(i x))^n = e^(i n x) $
si ottiene che $f(x)$ può essere scritta come combinazione lineare complessa delle funzioni $e^(i k x)$ e $e^(-i k x)$. Utilizzando nuovamente le formule di Eulero si deduce che $f(x)$ può essere scritta come combinazione lineare complessa delle funzioni $cos(i k x)$ e $sin(i k x)$:
$ f(x) = sum_(k=0)^n (z_k cos(k x) + w_k sin(k x)). $
Ma visto che sappiamo che $f(x)$ è una funzione reale, la somma delle parti immaginarie di questa combinazione lineare è nulla e dunque abbiamo ottenuto che $f(x)$ è combinazione lineare a coefficienti reali delle funzioni $e_n$.

#definition[serie di Fourier][
  Se $f in cal(H)(0,2pi)$ i coefficienti $c_k = chevron.l f, e_k chevron.r$ si chiamano _coefficienti di Fourier_ di $f$ e la serie
  $ sum_(k=0)^(+infinity) c_k e_k $
  si chiama _serie di Fourier_ di $f$.
  Il polinomio trigonometrico
  $ f_N = sum_(k=0)^N c_k e_k $
  si chiama _sviluppo di Fourier_ di ordine $N$ per $f$.
]

#example[
  Calcoliamo lo sviluppo di Fourier della funzione:
  $ f(x) = cases(1 &text("se ") x in [0,pi], -1 &text("se ") x in (pi,2pi].) $
  Per quanto riguarda $c_0 = chevron.l f, e_0 chevron.r$ si ha banalmente:
  $ c_0 = integral_0^(2pi) f(x) dot 1 / sqrt(2pi) thin d x = 1 / sqrt(2pi) (integral_0^pi 1 thin d x + integral_0^pi (-1) thin d x) = 0. $
  Per $c_(2k) = chevron.l f, e_(2k) chevron.r$ si ha
  $ c_(2k)
      &= integral_0^(2pi) f(x) cos(k x) / sqrt(pi) thin d x \
      &= 1 / sqrt(pi) (integral_0^pi cos(k x) thin d x - integral_pi^(2pi) cos(k x) thin d x) = 0 $
  per motivi di simmetria.
  Per calcolare $c_(2k+1) = chevron.l f, e_(2k+1) chevron.r$ si trova
  $ c_(2k+1)
      &= integral_0^pi sin(k x) / sqrt(pi) thin d x - integral_pi^(2pi) sin(k x) / sqrt(pi) thin d x \
      &= 2 / sqrt(pi) integral_0^pi sin(k x) thin d x = 2 / (k sqrt(pi)) integral_0^(k pi) sin t thin d t \
      &= cases(0 &text("se ") k text(" pari,"), 4 / (k sqrt(pi)) &text("se ") k text(" dispari.")) $
  Si trova quindi che
  $ f_(2n+1)(x) = sum_(k=0)^n 4 / ((2k+1)sqrt(pi)) sin((2k+1)x). $
  Si veda la figura @fig:fourier.
]

#figure(
  image("../../figure/fourier.png", height: 5cm),
  caption: [
    Lo sviluppo di Fourier della funzione che vale $1$ su $[0,pi]$ e $-1$ su $[\pi,2pi]$:
    $ f_(61)(x) = (4 sin(x)) / pi + (4 sin(3x)) / (3pi) + (4 sin(5x)) / (5pi) + (4 sin(7x)) / (7pi) + (4 sin(9x)) / (9pi) + (4 sin(11x)) / (11pi) + (4 sin(13x)) / (13pi) + (4 sin(15x)) / (15pi) + (4 sin(17x)) / (17pi) + (4 sin(19x)) / (19pi) + (4 sin(21x)) / (21pi) + (4 sin(23x)) / (23pi) + (4 sin(25x)) / (25pi) + (4 sin(27x)) / (27pi) + (4 sin(29x)) / (29pi) + (4 sin(31x)) / (31pi). $
    Il codice per calcolare i coefficienti e generare il grafico si trova a pagina \@code:Fourier.
    Si può notare come nel punto di salto $x=pi$ lo sviluppo di Fourier ha una oscillazione maggiore del salto originario (fenomeno di Gibbs). L'incremento dell'oscillazione è circa del 9% ed è indipendente dal numero di termini utilizzati nello sviluppo di Fourier.
  ],
) <fig:fourier>

Risulta naturale chiedersi se quella che abbiamo introdotto è una _base hilbertiana_ perché solo in tal caso gli sviluppi di Fourier approssimano la funzione.

#theorem[densità dei polinomi trigonometrici][
  Per ogni funzione continua $f in C^0([0,2pi])$ con $f(0)=f(2pi)$ esiste una successione $g_k in cal(H)(0,2pi)$ di polinomi trigonometrici (cioè combinazioni lineari finite del sistema ${e_k}$) tale che $g_k$ converge uniformemente a $f$.

  In particolare l'insieme dei polinomi trigonometrici è denso, con la norma uniforme, nel sottospazio vettoriale
  $ C^0_0([0,2pi]) = {u in C^0([0,2pi]) : u(0)=u(2pi)=0} subset C^0([0,2pi]). $
]

#proof[
  Si tratta di applicare il teorema di Stone-Weierstrass alla famiglia $cal(A)$ dei polinomi trigonometrici: verifichiamo le ipotesi del teorema.
  Chiaramente $cal(A)$ è un'algebra in quanto i polinomi lo sono.
  Le costanti sono in $cal(A)$ in particolare $1 in cal(A)$.
  Dati $x,y in [0,2pi)$ se $x != y$ si ha certamente $(cos x, sin x) != (cos y, sin y)$ e dunque o $sin$ o $cos$ assumono valori diversi nei due punti.
]

Osserviamo che la convergenza uniforme è più forte della convergenza in $H(a,b)$ in quanto si ha, banalmente:
$ norm(f)_2^2 = integral_a^b f(x)^2 thin d x <= integral_a^b norm(f)_infinity^2 thin d x = (b-a) dot norm(f)_infinity^2. $
Dunque il teorema precedente garantisce che ogni funzione continua in $cal(H)(a,b)$ può essere approssimata, rispetto alla norma $norm(dot)_2$, tramite polinomi trigonometrici. Il teorema seguente ci permette di estendere questa proprietà a tutte le funzioni di $cal(H)(a,b)$.

#theorem[densità delle funzioni continue][
  Data una qualunque $f in H(a, b)$ per ogni $epsilon > 0$ esiste una funzione continua $g: [a,b] -> RR$ con $g(a)=g(b)=0$ tale che $norm(f-g)_2 < epsilon$.

  Detto in altri termini: $C^0_0([a,b]) = {u in C^0 : u(a)=u(b)=0}$ è un sottospazio denso in $H(a,b)$ cioè un insieme la cui chiusura (nella topologia di $H(a,b)$) è tutto $H(a,b)$.
]

#proof[
  _Passo 1. Supponiamo che $f$ sia limitata su $(a,b)$._
  In tal caso possiamo pensare che $f$ sia definita su $[a,b]$ e l'integrale sia un integrale di Riemann "proprio".
  Sia $M = sup |f|([a,b])$.
  Per le condizioni di integrabilità sappiamo che per ogni $epsilon > 0$ è possibile trovare una suddivisione $a=x_0 < x_1 < dots < x_n = b$ su cui l'integrale di $f$ differisce dagli integrali superiore e inferiore per meno di $epsilon / (2M)$.
  Possiamo prendere come funzione $g$ una interpolazione lineare cioè una funzione tale che si abbia $g(x_k) = f(x_k)$ sui punti della suddivisione e che risulti lineare su ogni intervallino $[x_k,x_(k+1)]$. La funzione $g$ così definita è compresa, su ogni intervallino, tra l'$inf$ e il $sup$ di $f$ e dunque si avrà:
  $ integral_a^b |f(x)-g(x)| thin d x < epsilon / M. $
  Visto però che $norm(f)_infinity <= M$ si ha anche $norm(g)_infinity <= M$ e quindi $norm(f-g)_2 <= 2M$.
  Ma allora
  $ norm(f-g)_2^2 = integral_a^b |f-g|^2 <= integral_a^b norm(f-g)_infinity dot |f(x)-g(x)| thin d x <= 2M epsilon / (2M) = epsilon. $

  _Passo 2. Caso generale._
  Se la funzione è assolutamente integrabile in senso improprio su $(a,b)$ ma non è limitata, per definizione di integrale improprio per ogni $epsilon > 0$ possiamo trovare un intervallo $[alpha,beta] subset (a,b)$ su cui $f^2$ (e quindi $f$) risulta limitata e l'integrale di $f^2$ su $(a,alpha]$ e su $[beta,b)$ è minore di $epsilon$.
  Sia $M = sup |f|([alpha,beta])$.
  Applicando il passo precedente sull'intervallo $[alpha,beta]$ otteniamo una funzione continua $g$ definita su $[alpha,beta]$ tale che $|g(x)| <= M$ e $integral |f-g|^2 <= epsilon$.
  L'idea è ora di prendere un punto $alpha' in (a,alpha)$ e un punto $beta' in (beta,b)$ ed estendere la funzione $g$ su tutto $[a,b]$ ponendo $g=0$ sugli intervalli $[a,alpha']$ e $[beta',b]$ e facendo una interpolazione lineare sugli intervalli $[alpha',alpha]$ e $[beta,beta']$.

  Usando la disuguaglianza $(f-g)^2 <= (f-g)^2+(f+g)^2 = 2f^2+2g^2$ e scegliendo $alpha'$ molto vicino ad $alpha$ in modo che si abbia $alpha-alpha' < epsilon/M^2$, otteniamo
  $ integral_a^alpha |f-g|^2
      = integral_a^(alpha') f^2 + integral_(alpha')^alpha |f-g|^2
      <= epsilon + 2epsilon + 2M^2 dot (alpha-alpha')
      <= 5epsilon. $
  Disuguaglianza analoga si avrà sull'intervallo $[beta,b]$.
  Dunque otteniamo in conclusione
  $ integral_a^b |f-g|^2 <= 5epsilon + epsilon + 5epsilon = 11 epsilon $
  e il teorema è dimostrato con $11epsilon$ al posto di $epsilon$.
]

Grazie ai due teoremi precedenti sappiamo che ogni $f in cal(H)(a,b)$ può essere approssimata da polinomi trigonometrici $g_N -> f$ cioè da funzioni della forma:
$ g_N = sum_(k=0)^N a_(k,N) e_k. $
Stiamo qui assumendo che il polinomio trigonometrico $g_N$ abbia ordine non superiore ad $N$, ma questo si può sempre assumere, scartando o ripetendo i termini della successione.

Se ora consideriamo gli sviluppi di Fourier:
$ f_N = sum_(k=0)^N c_k e_k, quad c_k = chevron.l f,e_k chevron.r $ <eq:48948784>
ci ricordiamo che per ogni $k <= N$ risulta
$ chevron.l f-f_N, e_k chevron.r = sum_(k=0)^N (chevron.l f,e_k chevron.r - c_k) = 0 $
e quindi
$ chevron.l f-f_N , g_N -f_N chevron.r = sum_(k=0)^N chevron.l f-f_N, (a_(k,N)-c_k) e_k chevron.r = 0. $
Dunque, applicando il teorema di Pitagora @th:spazio_euclideo,
$ norm(f-f_N)_2^2 = norm(f-g_N)_2^2 - norm(f_N-g_N)_2^2 <= norm(f-g_N)_2^2 -> 0. $

Grazie al teorema @th:bessel abbiamo quindi ottenuto il seguente.

#theorem[serie di Fourier][
  Se $f in cal(H)(0,2pi)$ e $c_k$, $f_N$ sono definiti da @eq:48948784 allora $f_k -> f$ in norma $norm(dot)_2$.
  In particolare vale l'uguaglianza di Bessel
  $ sum_(k=0)^(+infinity) c_k^2 = norm(f)_2^2. $ <eq:uguaglianza_Bessel>
]

Questo significa, dunque, che il sistema ortonormale che abbiamo introdotto è una base hilbertiana e quindi che ogni funzione $f in cal(H)(0,2pi)$ si approssima rispetto alla norma $norm(dot)_2$ con gli sviluppi di Fourier.

Ricordiamo che se $norm(f_N-f)_2 -> 0$ non è detto che si abbia la convergenza puntuale $f_N(x) -> f(x)$ per ogni $x in (0,2pi)$ in quanto il limite è unico in $H(a,b)$ ma non in $cal(H)(a,b)$ e dunque è possibile (e in effetti può succedere) che il limite puntuale degli sviluppi di Fourier differisca, in alcuni punti, dalla funzione che si sta approssimando.

Purtroppo lo spazio $H(a,b)$ non risulta essere completo, come si può vedere nel seguente esempio.

#example[razionali ingrassati][
  Dimostriamo che lo spazio $H(0,1)$ non è completo.

  Sappiamo che l'insieme $[0,1] inter QQ$ è numerabile, quindi esiste una successione $q_k$ che elenca tutti i numeri razionali nell'intervallo $[0,1]$.
  Poniamo inoltre $r_k = 1 / (4 dot 2^k)$ e consideriamo gli intervalli $I_k = [q_k-r_k,q_k+r_k]$.
  Prendiamo la successione di funzioni $f_n: [0,1] -> RR$ definita da
  $ f_n(x) = cases(1 &text("se ") x in union.big_(k=1)^n I_k, 0 &text("altrimenti")) $
  A differenza di quanto uno potrebbe pensare, queste funzioni $f_n$ non diventano mai identicamente uguali ad $1$. Anzi, si può osservare che
  $ integral_0^1 f_n(x) thin d x <= sum_(k=1)^n integral_(q_k-r_k)^(q_k+r_k) 1 thin d x = sum_(k=1)^n 1 / (2 dot 2^k) <= 1 / 2 sum_(k=1)^(+infinity) 1 / 2^k = 1 / 2. $

  Si può mostrare che $f_k$ è una successione di Cauchy in $H(0,1)$ e che però non converge in $H(0,1)$.
] <ex:incompletezza_di_H>

#proof[
  Per verificare che $f_n$ è una successione di Cauchy possiamo semplicemente osservare che se $n >= m$ risulta che $f_n$ e $f_m$ differiscono solamente sugli intervalli $I_k$ con $k$ compreso tra $m$ ed $n$. Dunque:
  $ integral_0^1 |f_n - f_m| <= sum_(k=m+1)^(+infinity) integral_(q_k-r_k)^(q_k+r_k) 1 thin d x = sum_(k=m+1)^(+infinity) 1 / (2 dot 2^k) = 1 / 2^(m+1). $
  Visto che $f_n$ e $f_m$ assumono solamente i valori $0$ e $1$ anche $|f_n-f_m|$ assume solamente i valori $0$ e $1$ quindi $|f_n-f_m|^2 = |f_n-f_m|$.
  Abbiamo quindi verificato che per $n >= m$ si ha:
  $ norm(f_n - f_m)_2 <= sqrt(1 / 2^(m+1)). $
  È dunque chiaro che comunque sia scelto $epsilon > 0$ possiamo scegliere $N$ tale che $1/2^N <= epsilon^2$ da cui si ottiene che se $n,m >= N$ allora $norm(f_n-f_m)_2 <= epsilon$. Cioè: $f_n$ è una successione di Cauchy.

  Supponiamo ora, per assurdo, che esista $f in H(0,1)$ tale che $norm(f_n-f)_2 -> 0$.
  Innanzitutto visto che ogni $f_k <= 1$ possiamo supporre che sia anche $f <= 1$ perché altrimenti potremmo prendere $g(x) = min({f(x),1})$ e avremmo chiaramente $norm(f_n - g)_2 <= norm(f_n - f)_2 -> 0$. In pratica stiamo dicendo che modificando la funzione $f$ senza cambiarne l'integrale possiamo supporre che $f(x) <= 1$ per ogni $x in [0,1]$.

  Fissato un intervallo $I_n$, per $k -> +infinity$ si ha:
  $ 0 <= integral_(q_n-r_n)^(q_n+r_n) |f_k(x)-f(x)|^2 thin d x <= integral_0^1 |f_k(x)-f(x)|^2 thin d x = norm(f_k - f)_2^2 -> 0. $
  Ma ora se $k >= n$ risulta che $f_k=1$ su $I_n$ e quindi il valore dell'integrale precedente non dipende da $k$ e dovrà quindi essere identicamente nullo:
  $ integral_(q_n-r_n)^(q_n+r_n) (1-f(x)) thin d x = 0 $
  e quindi possiamo affermare che $sup f(I_n) = 1$ in quanto se fosse $sup f(I_n) = lambda < 1$ l'integrale di $1-f(x)$ sarebbe positivo sull'intervallo $I_n$.

  Vogliamo ora dimostrare che su ogni intervallo $[a,b] subset [0,1]$, se $b>a$ si ha $sup f([a,b])=1$.
  Prendiamo $N$ abbastanza grande in modo che $r_N < (b-a)/3$.
  Allora l'intervallo $[a+r_N, b-r_N]$ ha ampiezza maggiore di $r_N$ e contiene infiniti numeri razionali.
  Esistono quindi infiniti indici $n$ per cui $q_n$ sta in tale intervallo.
  Tra questi infiniti certamente ce n'è uno con indice $n >= N$ (perché i $q_n$ con $n<N$ sono in numero finito).
  Ma se $q_n in [a+r_N,b-r_N]$ allora $I_n subset [a,b]$ e quindi $sup f([a,b]) >= sup f(I_n) = 1$.

  Questo significa che per ogni suddivisione di Riemann dell'intervallo $[0,1]$ risulta che il $sup$ di $f$ sugli intervallini della suddivisione è $1$ e quindi l'integrale superiore di $f$ è anch'esso $1$. Dunque, essendo $f$ integrabile,
  $ integral_a^b f(x) = 1. $

  Vogliamo ora concludere che questo è in contraddizione con la disuguaglianza
  $ integral_a^b f_n(x) <= 1 / 2 $
  che abbiamo osservato all'inizio.
  Si ha infatti per la disuguaglianza di Cauchy-Schwarz
  $ integral_0^1 |f(x)-f_n(x)| thin d x <= norm(f-f_n)_2 dot norm(1)_2 -> 0 $
  e quindi, per il criterio di convergenza assoluta,
  $ integral_0^1 (f(x) - f_n(x)) thin d x -> 0. $
  Ma abbiamo visto che
  $ integral_0^1 (f(x) - f_n(x)) thin d x = integral_0^1 f(x) thin d x - integral_0^1 f_n(x) thin d x >= 1 - 1 / 2 = 1 / 2 $
  ottenendo quindi un assurdo.
]

Il fatto di avere trovato una base hilbertiana di $H(0,2pi)$ (e quindi di ogni $H(a,b)$) ci permette di dire che ogni funzione in $H(0,2pi)$ può essere rappresentata dalle sue coordinate $c_k$ in modo che valga l'uguaglianza di Bessel:
$ norm(f)_2 = sqrt(sum_(k=0)^(+infinity) c_k^2). $

Abbiamo in effetti definito una corrispondenza:
$ phi: H(0,2pi) -> ell^2, quad ell^2 = {c in RR^NN : sum_(k=0)^(+infinity) c_k^2 < +infinity} $
definita da
$ c_k = phi(f) = chevron.l f, e_k chevron.r. $

Chiaramente tale $phi$ è lineare. Visto che $e_k$ è una base hilbertiana è facile verificare che $phi$ è anche iniettivo. Se su $ell^2$ definiamo il prodotto scalare e la norma corrispondente:
$ chevron.l x,y chevron.r = sum_(k=0)^(+infinity) x_k y_k, quad |x|_2 = sqrt(sum_(k=0)^(+infinity) x_k^2) $
l'uguaglianza di Bessel ci dice che $phi$ mantiene la norma e quindi la struttura di spazio euclideo. Si potrebbe dimostrare che $ell^2$ è completo e questo significa che $phi$ non è suriettiva in quanto la successione $f_n$ considerata nell'esempio @ex:incompletezza_di_H è di Cauchy in $H(0,2pi)$, dunque $phi(f_n)$ è di Cauchy in $ell^2$ e dunque converge in $ell^2$. Il limite $c$ della successione $phi(f_n)$ rappresenta una successione di coefficienti di Fourier che non possono essere ottenuti da nessuna funzione $f in H(0,2pi)$.

Possiamo utilizzare le serie di Fourier per risolvere il seguente #footnote[vedi note storiche a pag \@note:Basilea].

#exercise[problema di Basilea][
  Dimostriamo che
  $ sum_(k=1)^(+infinity) 1 / k^2 = pi^2 / 6. $ <eq:basilea>
] <ex:Basilea>

#proof[Svolgimento.][
  Calcoliamo i coefficienti di Fourier della funzione $f(x)=x$ in $H(0,2pi)$.
  Si ha
  $ c_0 = integral_0^(2pi) f(x) dot e_0(x) thin d x = integral_0^(2pi) x / sqrt(2pi) thin d x = 1 / sqrt(2pi) lr([x^2 / 2])_0^(2pi) = sqrt(2pi^3) $
  poi
  $ c_(2k+1)
      &= integral_0^(2pi) x dot sin(k x) / sqrt(pi) thin d x \
      &= lr([x (-cos(k x)) / (k sqrt(pi))])_0^(2pi) - integral_0^(2pi) (-cos(k x)) / (k sqrt(pi)) thin d x \
      &= (-2pi) / (k sqrt(pi)) - 0 = - (2 sqrt(pi)) / k $
  e infine
  $ c_(2k)
      &= integral_0^(2pi) x dot cos(k x) / sqrt(pi) thin d x \
      &= lr([x sin(k x) / (sqrt(pi) k)])_0^(2pi) - integral_0^(2pi) sin(k x) / (sqrt(pi) k) thin d x = 0. $

  Allora l'equazione di Bessel @eq:uguaglianza_Bessel ci dice che vale
  $ norm(x)_2^2 = sum_(k=0)^(+infinity) c_k^2 = c_0^2 + sum_(k=0)^(+infinity) c_(2k+1)^2 = 2pi^3 + sum_(k=1)^(+infinity) (4pi) / k^2. $
  Ma è facile calcolare
  $ norm(x)_2^2 = integral_0^(2pi) x^2 thin d x = lr([x^3 / 3])_0^(2pi) = (8pi^3) / 3 $
  e quindi
  $ (8pi^3) / 3 = 2pi^3 + 4pi sum_(k=1)^(+infinity) 1 / k^2 $
  da cui segue il risultato voluto.
]