#import "../../lib.typ": *

= Passaggio al limite sotto il segno di integrale <sec:scambio_integrale_limite>

#example[La funzione $Gamma$ di Eulero][
  Si definisce $Gamma: (0,+infinity) -> RR$ come
  $ Gamma(x) = integral_0^(+infinity) e^(-t) t^(x-1) d t. $

  L'integrale converge per ogni $x > 0$ in quanto posto $f(t) = e^(-t) t^(x-1)$ per $t -> 0^+$ si ha $f(t) ~ t^(x-1)$ che ha integrale convergente in un intorno di $0$ mentre per $t -> +infinity$ si ha $f(t) << e^(-t/2)$ che ha integrale convergente in un intorno di $+infinity$.

  Integrando per parti si ottiene una interessante proprietà della funzione $Gamma$:
  $ integral_0^(+infinity) e^(-t) t^x d t
    &= lr([-e^(-t) t^x])_0^(+infinity) + integral_0^(+infinity) e^(-t) x t^(x-1) d t \
    &= x integral_0^(+infinity) e^(-t) t^(x-1) d t $
  cioè $Gamma(x+1) = x Gamma(x)$.
  Osservando che $Gamma(1)=1=0!$ si può quindi dimostrare, per induzione, che $Gamma(n+1) = n!$ per ogni $n in NN$.
  Abbiamo quindi trovato una funzione che estende il fattoriale da $NN$ a tutto l'intervallo di numeri reali $(-1,+infinity)$.

  In questo capitolo dimostreremo che la funzione $Gamma$ è derivabile.

  Non siamo ora in grado di calcolare il valore di $Gamma(x)$ se $x$ non è intero, ma possiamo ricondurre il valore di $Gamma(1/2)$ all'integrale della gaussiana, facendo il cambio di variabile $t=s^2$, $d t = 2s d s$:
  $ Gamma(1/2)
    &= integral_0^(+infinity) e^(-t) / sqrt(t) d t
     = integral_0^(+infinity) e^(-s^2) / s dot 2s d s
     = integral_(-infinity)^(+infinity) e^(-s^2) d s. $
  Nell'esercizio @ex:integrale_gaussiana troveremo il valore dell'integrale della gaussiana e potremo quindi concludere che $Gamma(1/2) = sqrt(pi)$.
  Questo ci permette di calcolare il valore di $Gamma$ su tutti i semi-interi:
  $ Gamma(3/2) = 1/2 Gamma(1/2) = sqrt(pi)/2, quad Gamma(5/2) = 3/2 Gamma(3/2) = (3sqrt(pi))/4, dots $
] <ex:gamma_eulero>

Visto che la funzione integranda $f(x,t)=e^(-t)t^(x-1)$, nell'esempio precedente, è continua e derivabile è naturale chiedersi se anche la funzione integrale $Gamma$ risulta essere continua e derivabile. E se è derivabile è naturale chiedersi come si può calcolare la derivata.

In generale si può rispondere facilmente a queste domande se siamo in grado di scambiare tra loro gli operatori di limite e di integrale. Infatti osserviamo che si ha
$ lim_(x -> x_0) Gamma(x)
  &= lim_(x -> x_0) integral_0^(+infinity) e^(-t) t^(x-1) d t
   accent(=, "?") integral_0^(+infinity) lim_(x -> x_0) e^(-t) t^(x-1) d t \
  &= integral_0^(+infinity) e^(-t) t^(x_0 - 1) d t
   = Gamma(x_0) $
e
$ Gamma'(x)
  &= d / (d x) integral_0^(+infinity) e^(-t) t^(x-1) d t
   accent(=, "?") integral_0^(+infinity) d / (d x) e^(-t) t^(x-1) d t \
  &= integral_0^(+infinity) e^(-t) t^(x-1) ln t d t. $
In entrambi i casi l'unico passaggio non formalmente giustificato è quello marcato con il punto interrogativo. Lo scopo di questo capitolo è quello di determinare alcune condizioni che permettono di effettuare lo scambio del limite con l'integrale e lo scambio della derivata con l'integrale.

#example[
  La successione $f_n (x) = x^n$ dell'esempio @ex:puntuale_non_uniforme converge puntualmente alla funzione che vale $0$ sull'intervallo $[0,1)$.

  In questo caso il limite può essere scambiato con l'integrale:
  $ lim_(n -> +infinity) integral_(-1)^1 f_n (x) d x
    &= lim_(n -> +infinity) lr([x^(n+1) / (n+1)])_(-1)^1
     = lim_(n -> +infinity) 1 / (n+1) = 0 \
    integral_(-1)^1 lim_(n -> +infinity) f_n (x) d x
    &= integral_(-1)^1 f(x) d x = 0. $
]

L'esempio precedente ci dice che lo scambio tra il limite e l'integrale in certi casi può essere fatto. Purtroppo la convergenza puntuale non è una ipotesi sufficiente come si vede nel seguente esempio.

#example[
  Si consideri la successione di funzioni $f_n: [0,1] -> RR$ definita da
  $ f_n (x) = (n x) / (1 + n^2 x^4). $
  Chiaramente si ha per ogni $x in RR$:
  $ lim_(n -> +infinity) (n x) / (1 + n^2 x^4) = 0. $
  Dunque la successione $f_n$ converge puntualmente alla funzione $f=0$ identicamente nulla.
  Ma lo scambio del limite con l'integrale in questo caso non è possibile in quanto risulta
  $ lim_(n -> +infinity) integral_0^1 f_n (x) d x
    &= lim_(n -> +infinity) integral_0^1 (n x) / (1 + n^2 x^4) d x \
    &= lim_(n -> +infinity) 1/2 lr([arctan(n x^2)])_0^1
     = 1/2 lim_(n -> +infinity) arctan n = pi/4 $
  mentre ovviamente
  $ integral_0^1 lim_(n -> +infinity) f_n (x) d x = integral_0^1 0 d x = 0. $
]

Il motivo per cui nell'esempio precedente non si può passare al limite sotto il segno di integrale è dovuto al fatto che la funzione $f_n(x)$ pur tendendo a zero in ogni punto $x in RR$ nei punti vicini ad $x=0$ diventa, al crescere di $n$, molto grande.
In effetti il grafico della funzione $f_n(x)$ si ottiene dal grafico della funzione $f(x) = x / (1+x^4)$ schiacciando la variabile $x$ di un fattore $n$ e dilatando la variabile $y$ dello stesso fattore $n$.
Questo fa sì che l'area sotto il grafico rimanga invariata.
La funzione $f_n$ ha un punto di massimo per $x = 1 / (root(4,3) sqrt(n))$ (lo si verifichi studiando il segno della derivata) e in tale punto assume un valore che tende ad infinito quando $n -> +infinity$.

Se però c'è convergenza uniforme e l'integrale non è improprio, vale il seguente.

#theorem[Passaggio al limite sotto il segno di integrale][
  Siano $f_n, f: [a,b] -> RR$ funzioni limitate e Riemann integrabili sull'intervallo chiuso e limitato $[a,b]$.
  Supponiamo inoltre che ci sia convergenza uniforme: $f_n arrows.rr f$.
  Allora
  $ lim_(n -> +infinity) integral_a^b f_n (x) d x = integral_a^b f(x) d x. $

  Inoltre scelto qualunque $c in [a,b]$ e posto
  $ F_k (x) = integral_c^x f_k (t) d t, quad F(x) = integral_c^x f(t) d t $
  si ha convergenza uniforme $F_k arrows.rr F$.
] <th:scambio_limite_integrale>

#proof[
  Se $f_n$ e $f$ sono Riemann-integrabili anche $f_n-f$ e $|f_n-f|$ lo sono e si ha:
  $ |integral_a^b f_n (x) d x - integral_a^b f(x) d x|
    &<= integral_a^b |f_n (x) - f(x)| d x \
    &<= integral_a^b sup_(t in [a,b]) |f_n (t) - f(t)| d x \
    &= sup_(t in [a,b]) |f_n (t) - f(t)| dot integral_a^b 1 d x -> 0. $

  Se poi definiamo $F$ e $F_k$ come nell'enunciato, si ha
  $ ||F_k - F||_infinity
    &= sup_(x in [a,b]) |integral_c^x (f_k (t) - f(t)) d t| \
    &<= sup_(x in [a,b]) |x - c| dot ||f_k - f||_infinity \
    &<= (b - a) dot ||f_k - f||_infinity -> 0. $
]

Ci ricordiamo che le funzioni continue sono localmente Riemann integrabili.
Dunque il teorema precedente ci permette di affermare che l'operatore integrale $S: C^0([a,b]) -> C^0([a,b])$
$ S(f)(x) = integral_c^x f(t) d t $
(che fissato $c in [a,b]$ associa ad una funzione $f in C^0([a,b])$ la sua funzione integrale) è un operatore continuo rispetto alla norma uniforme.

Purtroppo il teorema precedente non può essere valido in generale per gli integrali impropri, abbiamo infatti il seguente esempio negativo.

#example[
  Consideriamo la successione di funzioni $f_n: RR -> RR$
  $ f_n (x) = 1/n dot 1 / (1 + ((x - n)/n)^2). $
  Si può osservare che $sup_(x in RR) |f_n (x)| = f_n (n) = 1/n$ e quindi $f_n arrows.rr 0$ su tutto $RR$.
  Nonostante questo si ha
  $ integral_(-infinity)^(+infinity) f_n (x) d x = integral_(-infinity)^(+infinity) 1 / (1 + t^2) d t = pi $
  e quindi gli integrali non tendono a zero.
] <ex:convergenza_non_dominata>

Nell'esempio precedente le funzioni $f_n$ hanno una forma a campana. Al crescere di $n$ la campana si sposta verso $+infinity$, inoltre si abbassa e si allarga in modo da mantenere costante l'integrale. La _massa_ racchiusa dalla campana sta quindi scomparendo ad infinito mentre le funzioni tendono a zero.

Per poter effettuare il passaggio al limite all'interno di un integrale improprio ci serve una ipotesi in più, la successione di funzioni deve essere _dominata_ da una unica funzione integrale, come vediamo nel seguente teorema. Inoltre si può rilassare l'ipotesi di convergenza uniforme richiedendo che valga solo negli intervalli limitati strettamente contenuti nell'intervallo di integrazione $(a,b)$. In questo modo il teorema si applica anche nel caso in cui l'intervallo $(a,b)$ è illimitato o la funzione integranda tende all'infinito agli estremi dell'intervallo.

#theorem[Convergenza dominata localmente uniforme][
  Siano $f_k: (a,b) -> RR$ e $f: (a,b) -> RR$ funzioni localmente Riemann integrabili sull'intervallo $(a,b)$ con $-infinity <= a < b <= +infinity$ tali che per ogni $[alpha, beta] subset (a,b)$ si abbia convergenza uniforme: $f_k arrows.rr f$ sull'intervallo $[alpha, beta]$.

  Supponiamo inoltre che esista $g: (a,b) -> RR$ integrabile in senso improprio su $(a,b)$ con integrale convergente e tale che
  $ |f_k (x)| <= g(x) $
  per ogni $k in NN$ e ogni $x in (a,b)$.

  Allora $f_k$ ed $f$ hanno integrale improprio convergente su $(a,b)$ e si ha
  $ lim_(k -> +infinity) integral_a^b f_k (x) d x = integral_a^b f(x) d x. $
] <th:convergenza_dominata_uniforme>

#proof[
  Ogni $f_k$ è assolutamente integrabile in senso improprio in quanto $|f_k| <= g$ dove $g$ ha integrale finito per ipotesi.
  Visto che $f_k (x) -> f(x)$ per ogni $x in (a,b)$ si ha anche $|f(x)| <= g(x)$ per ogni $x in (a,b)$ e dunque anche l'integrale di $f$ è assolutamente convergente su $(a,b)$.

  Visto che l'integrale improprio è convergente sappiamo che per ogni $epsilon > 0$ esistono $alpha > a$ e $beta < b$ per cui risulta
  $ integral_beta^b g(x) d x < epsilon, quad integral_a^alpha g(x) d x < epsilon. $
  Ma su $[alpha, beta]$ abbiamo la convergenza degli integrali per il teorema precedente dunque esiste $N$ tale che per ogni $k > N$ si ha
  $ |integral_alpha^beta f_k (x) d x - integral_alpha^beta f(x) d x| <= epsilon. $
  Mettendo insieme le due cose si ottiene, per ogni $k > N$:
  $ |integral_a^b f_k (x) d x - integral_a^b f(x) d x|
    &<= |integral_alpha^beta f_k (x) d x - integral_alpha^beta f(x) d x| \
    &quad + |integral_a^alpha (f_k (x) - f(x)) d x| + |integral_beta^b (f_k (x) - f(x)) d x| \
    &<= epsilon + integral_a^alpha |f_k (x)| d x + integral_a^alpha |f(x)| d x + integral_beta^b |f_k (x)| d x + integral_beta^b |f(x)| d x \
    &<= epsilon + 2 integral_a^alpha g(x) d x + 2 integral_beta^b g(x) d x \
    &<= 5 epsilon. $
  Abbiamo quindi verificato la tesi tramite la definizione di limite.
]

#example[
  La successione $f_k (x) = sin(x^k)$ converge puntualmente a $f(x)=0$ sull'intervallo $[0, 1)$ e la convergenza è uniforme su ogni intervallo $[0, beta]$ con $beta < 1$ (verificare!).
  Inoltre $|f_k (x)| = sin(x^k) <= sin(1)$ per ogni $x in [0,1]$ e $integral_0^1 sin(1) d x = sin(1) < +infinity$.
  Dunque possiamo applicare il teorema di convergenza dominata e, scambiando il limite con l'integrale possiamo dedurre che
  $ integral_0^1 sin(x^k) d x -> 0, quad "per " k -> +infinity. $
]

Nel @th:convergenza_dominata l'ipotesi che esista una funzione $g$ che "domina" l'intera successione è essenziale, come abbiamo visto nell'esempio @ex:convergenza_non_dominata.
Invece l'ipotesi che la successione converga uniformemente non è veramente necessaria: la convergenza puntuale (a patto che la successione sia dominata) è sufficiente per poter effettuare il passaggio al limite sotto il segno di integrale.
Nella sua generalità questo risultato (teorema di convergenza dominata di Lebesgue) viene dimostrato per l'integrale di Lebesgue.

#theorem[Convergenza dominata caso continuo][
  Siano $I subset RR$ un intervallo e siano $-infinity <= a < b <= +infinity$.
  Sia $f: I times (a,b) -> RR$ una funzione continua e sia $g: (a,b) -> RR$ una funzione continua con integrale (improprio) convergente
  $ integral_a^b g(t) d t < +infinity $
  tale che per ogni $x in I$ e per ogni $t in (a,b)$ si abbia $|f(x,t)| <= g(t)$.

  Allora per ogni $x in I$ l'integrale $integral_a^b f(x,t) d t$ è convergente ed è continuo nella variabile $x$, cioè:
  $ lim_(y -> x) integral_a^b f(y,t) d t = integral_a^b f(x,t) d t. $
] <th:convergenza_dominata>

#proof[
  Si noti che l'indice $k -> +infinity$, $k in NN$ nel @th:convergenza_dominata_uniforme può essere tranquillamente sostituito con un parametro continuo $y -> x$, $x in RR$ grazie al teorema di collegamento tra limite di funzione e limite di successione.
  Vogliamo dunque ricondurci al @th:convergenza_dominata_uniforme e per fare questo andremo quindi a dimostrare che fissato $[alpha, beta] subset (a,b)$ e fissato $x in I$ si ha convergenza uniforme delle funzioni $t |-> f(y,t)$ alla funzione $t |-> f(x,t)$ quando $y -> x$.

  Senza perdere di generalità possiamo supporre che $I$ sia un intervallo chiuso e limitato che contiene il punto fissato $x$.
  La funzione $f$ è dunque continua sull'insieme sequenzialmente compatto $I times [alpha, beta]$ e quindi è uniformemente continua per il Teorema @th:HeineCantor di Heine-Cantor (in due variabili).
  Significa che per ogni $epsilon > 0$ esiste $delta > 0$ tale che per ogni $x,y in I$ e per ogni $s,t in [alpha, beta]$ si ha:
  $ sqrt((x - y)^2 + (t - s)^2) < delta => |f(x,t) - f(y,s)| < epsilon. $
  Ma allora per ogni $epsilon > 0$ se $x in I$ e $|x - y| < delta$ si ha
  $ sup_(t in [alpha, beta]) |f(y,t) - f(x,t)| <= epsilon $
  e quindi
  $ lim_(y -> x) sup_t |f(y,t) - f(x,t)| = 0. $
  come volevamo dimostrare.
]

Il teorema di convergenza dominata viene spesso utilizzato per scambiare la derivata con l'integrale come enunciato nel seguente.

#theorem[Passaggio della derivata sotto il segno di integrale][
  Sia $f: I times (a,b) -> RR$ una funzione continua, dove $I subset RR$ è un intervallo e $-infinity <= a < b <= +infinity$.
  Supponiamo che per ogni $t in (a,b)$ la funzione sia derivabile rispetto a $x$ per ogni $x in I$ e che la derivata $(partial f) / (partial x)$ sia continua su tutto il rettangolo $I times (a,b)$.
  Supponiamo infine che per ogni $x in I$ l'integrale $integral_a^b f(x,t) d t$ sia convergente e che esista una funzione $G: (a,b) -> RR$ localmente Riemann integrabile e con integrale $integral_a^b G(t) d t$ convergente tale che per ogni $x in I$ e per ogni $t in (a,b)$ si abbia
  $ |(partial f) / (partial x) (x,t)| <= G(t). $

  Allora per ogni $x in I$ si ha
  $ d / (d x) integral_a^b f(x,t) d t = integral_a^b (partial f) / (partial x) (x,t) d t. $
] <th:derivata_integrale>

#proof[
  Fissiamo $x_0 in I$ e definiamo
  $ g(x,t) = cases(
    (f(x,t) - f(x_0,t)) / (x - x_0) &"se" x != x_0,
    (partial f) / (partial x) (x,t) &"se" x = x_0.
  ) $
  Osserviamo allora che la derivata dell'integrale nel punto $x_0$ è:
  $ lr([d / (d x) integral_a^b f(x,t) d t])_(x=x_0)
    &= lim_(x -> x_0) (integral_a^b f(x,t) d t - integral_a^b f(x_0,t) d t) / (x - x_0) \
    &= lim_(x -> x_0) integral_a^b g(x,t) d t $
  mentre l'integrale della derivata è $integral_a^b g(x_0,t) d t.$
  Basterà quindi dimostrare che è possibile applicare il @th:convergenza_dominata alla funzione $g(x,t)$.

  È facile verificare che $G$ domina $g$ in quanto per il teorema di Lagrange sappiamo che per ogni $x$ e per ogni $t$ esiste $x'$ con $|x' - x_0| < |x - x_0|$ tale che
  $ |g(x,t)| = |(partial f) / (partial x) (x',t)| <= G(t). $

  Ci rimane quindi solo da dimostrare che la funzione $g: I times (a,b) -> RR$ è continua.
  Chiaramente se $x != x_0$ la funzione è continua, bisogna verificare che lo sia anche nei punti $(x_0,t_0)$ per ogni $t_0 in (a,b)$.
  Visto che per ipotesi $(partial f) / (partial x)$ è continua, sappiamo che
  $ forall epsilon > 0: exists delta > 0: sqrt((x - x_0)^2 + (t - t_0)^2) < delta => |(partial f) / (partial x) (x,t) - (partial f) / (partial x) (x_0,t_0)| < epsilon. $
  Applicando, come prima, il teorema di Lagrange sappiamo che se $(x,t)$ dista da $(x_0,t_0)$ per meno di $delta$ si ha
  $ |g(x,t) - g(x_0,t_0)| = |(partial f) / (partial x) (x',t) - (partial f) / (partial x) (x_0,t_0)| < epsilon. $
  Questo conclude la dimostrazione della continuità di $g(x,t)$.
]

#exercise[Derivata della funzione $Gamma$][
  Mostrare che la funzione $Gamma$ definita da (si veda @ex:gamma_eulero)
  $ Gamma(x) = integral_0^(+infinity) e^(-t) dot t^(x-1) d t $
  è derivabile e la sua derivata vale
  $ Gamma'(x) = integral_0^(+infinity) e^(-t) dot ln t dot t^(x-1) d t. $
]

#proof[Svolgimento][
  Basta verificare che si può applicare il @th:derivata_integrale alla funzione
  $ f(x,t) = e^(-t) t^(x-1) $
  la cui derivata parziale rispetto a $x$ è
  $ (partial f) / (partial x) (x,t) = e^(-t) dot ln t dot t^(x-1). $
  Chiaramente questa funzione è continua, dobbiamo solo trovare una funzione che la domina.
  Fissato $x_0 > 0$ possiamo restringere il dominio della variabile $x$ all'intervallo $[x_0/2, 2 x_0]$ e considerare la funzione
  $ g(t) = e^(-t) dot |ln t| dot max(t^(x_0/2 - 1), t^(2 x_0 - 1)). $
  Si tratta di una funzione continua (in quanto composizione di funzioni continue, osservando che anche il massimo tra due funzioni continue è una funzione continua).
  Inoltre per $t -> 0^+$ si ha
  $ g(t) ~ |ln t| dot t^(x_0/2 - 1) << t^(-1 + epsilon) $
  pur di prendere $epsilon < x_0/2$.
  Dunque l'integrale $integral_0^1 g(t) d t$ è convergente per il criterio di confronto asintotico.
  Se invece $t -> +infinity$ si ha
  $ g(t) ~ e^(-t) dot ln t dot t^(2 x_0 - 1) << 1/t^2 $
  in quanto l'esponenziale tende a zero molto più velocemente di quanto non tendano ad infinito logaritmo e potenza.
  Dunque, per il criterio di confronto asintotico, anche l'integrale $integral_1^(+infinity) g(t) d t$ è convergente.
]

Il metodo utilizzato nei prossimi esempi viene a volte chiamato _trucco di Feynman_: si tratta di moltiplicare la funzione integranda per una funzione che dipende da un parametro in modo che derivando rispetto al parametro la funzione integranda si semplifichi.

#exercise[Integrale della gaussiana][
  Dimostriamo che
  $ integral_(-infinity)^(+infinity) e^(-s^2) d s = sqrt(pi). $
] <ex:integrale_gaussiana>

#proof[Svolgimento][
  Sappiamo che l'integrale
  $ I = integral_0^(+infinity) e^(-s^2) d s $
  è finito. L'integrale cercato è $2 I$ (per simmetria).
  Consideriamo la seguente funzione
  $ F(x) = integral_0^(+infinity) e^(-x^2 (1 + t^2)) / (1 + t^2) d t. $
  Possiamo facilmente calcolare
  $ F(0) = integral_0^(+infinity) 1 / (1 + t^2) d t = lr([arctan t])_0^(+infinity) = pi/2. $
  Mentre se $x > 1$ si ha
  $ 0 <= e^(-x^2 (1 + t^2)) / (1 + t^2) = e^(-x^2) dot e^(-x^2 t^2) / (1 + t^2) <= e^(-x^2) dot e^(-t^2) $
  e quindi per $x -> +infinity$:
  $ 0 <= F(x) <= e^(-x^2) integral_0^x e^(-t^2) d t <= e^(-x^2) dot I -> 0. $
  Calcoliamo ora la derivata di $F$ applicando il @th:derivata_integrale.
  La funzione integranda ha derivata
  $ partial / (partial x) (e^(-x^2 (1 + t^2)) / (1 + t^2)) = -2 x e^(-x^2 (1 + t^2)). $
  Se restringiamo la variabile $x$ ad un intervallo $[x_1, x_2]$ abbiamo
  $ |-2 x e^(-x^2 (1 + t^2))| <= 2 x_2 e^(-x_1^2 (1 + t^2)) << 1/t^2 $
  e la funzione dominante $1/t^2$ ha integrale finito sull'intervallo $(0, +infinity)$.
  Possiamo quindi scambiare la derivata con l'integrale per ottenere
  $ F'(x) &= -2 x integral_0^(+infinity) e^(-x^2 (1 + t^2)) d t \
         &= -2 x e^(-x^2) integral_0^(+infinity) e^(-x^2 t^2) d t. $
  Con il cambio di variabile $s = x t$, $d s = x d t$ si ottiene
  $ F'(x) = -2 e^(-x^2) integral_0^(+infinity) e^(-s^2) d s = -2 e^(-x^2) dot I. $
  Ma allora da un lato abbiamo
  $ integral_0^(+infinity) F'(x) d x = lr([F(x)])_0^(+infinity) = 0 - pi/2. $
  Dall'altro
  $ integral_0^(+infinity) F'(x) d x = -2 I dot integral_0^(+infinity) e^(-x^2) d x = -2 I^2. $
  Concludiamo quindi che $2 I^2 = pi/2$ da cui $2 I = sqrt(pi)$, come volevamo dimostrare.
]

#exercise[Integrale notevole][
  Mostriamo che
  $ integral_0^(+infinity) (sin t) / t d t = pi/2. $
] <ex:integrale_sin_integrale>

#proof[
  Per ogni $x >= 0$ consideriamo la funzione
  $ F(x) = integral_0^(+infinity) (sin t) / t e^(-t x) d t $
  cosicché l'integrale richiesto non è altro che $F(0)$.
  Per ogni $x > 0$ possiamo derivare la funzione utilizzando il @th:derivata_integrale in quanto la derivata della funzione integranda
  $ partial / (partial x) ((sin t) / t e^(-t x)) = -sin t dot e^(-t x) $
  è dominata dalla funzione $g(t) = e^(-epsilon t)$ se $x > epsilon$ e $g$ ha integrale convergente.
  Dunque si ha
  $ F'(x) = -integral_0^(+infinity) sin t dot e^(-t x) d t. $
  Questo integrale si può calcolare integrando due volte per parti (si veda \@ex:821685) e si trova $F'(x) = - 1 / (1 + x^2)$ da cui
  $ F(x) = -arctan x + c $
  per qualche $c in RR$.

  Per determinare $c$ vogliamo ora verificare che $F(x) -> 0$ per $x -> +infinity$.
  Lo possiamo fare applicando il @th:convergenza_dominata osservando che la funzione $f(x,t) = (sin t)/t e^(-t x)$ è dominata da $g(t) = e^(-t)$, per $x >= 1$.

  Dunque $c = pi/2$ e si ha, per ogni $x > 0$,
  $ F(x) = pi/2 - arctan x. $

  L'integrale richiesto è $F(0)$ e la formula appena trovata ci dice che $F(x) -> pi/2$ per $x -> 0$.
  Rimane quindi solamente da dimostrare che $F(x) -> F(0)$ per $x -> 0$ ovvero
  $ lim_(x -> 0) integral_0^(+infinity) f(x,t) d t = integral_0^(+infinity) f(0,t) d t. $
  Sfortunatamente non è possibile utilizzare direttamente i teoremi di passaggio al limite sotto il segno di integrale in quanto l'integrale sul lato destro, cioè l'integrale cercato, non è assolutamente convergente e quindi non sarà possibile trovare una funzione _dominante_ come richiesto nelle ipotesi del teorema.

  Consideriamo la coda dell'integrale cercato:
  $ G(t) = integral_t^(+infinity) (sin s) / s d s. $
  Visto che l'integrale $F(0) = G(0)$ è convergente sappiamo che la coda tende a zero cioè $G(t) -> 0$ per $t -> +infinity$.
  Per il teorema fondamentale del calcolo sappiamo inoltre che
  $ G'(t) = -(sin t) / t $
  e dunque possiamo scrivere l'integrale $F(x)$ nella forma
  $ F(x) = integral_0^(+infinity) (-G'(t)) e^(-x t) d t. $
  integrando per parti si ottiene
  $ F(x) = lr([-G(t) e^(-x t)])_(t=0)^(+infinity) - integral_0^(+infinity) (-G(t)) (-x e^(-x t)) d t = G(0) - x integral_0^(+infinity) G(t) e^(-x t) d t. $
  Ma $G(0) = F(0)$ dunque abbiamo trovato, per ogni $x > 0$,
  $ |F(x) - F(0)| <= x integral_0^(+infinity) |G(t)| e^(-x t) d t. $

  Per verificare che $F(x) -> F(0)$ dimostriamo che per ogni $epsilon > 0$ si ha $|F(x) - F(0)| < epsilon$ per $x$ sufficientemente piccolo.
  Visto che $G(t) -> 0$ per $t -> +infinity$ possiamo scegliere $beta > 0$ tale che $|G(t)| < epsilon$ per ogni $t > beta$.
  Ricordiamo anche che $G$ è una funzione continua su $[0,+infinity)$ ed avendo limite zero per $t -> +infinity$, è limitata, dunque esiste $M > 0$ tale che $|G(t)| <= M$ per ogni $t in [0,+infinity)$.
  Spezziamo allora l'integrale in due parti:
  $ |F(x) - F(0)|
    &<= x integral_0^beta |G(t)| d t + integral_beta^(+infinity) |G(t)| x e^(-x t) d t \
    &<= x M beta + integral_beta^(+infinity) epsilon x e^(-x t) d t
     <= x M beta + epsilon lr([e^(-x t)])_(t=beta)^(+infinity) \
    &= x M beta + epsilon e^(-x beta) <= x M beta + epsilon. $
  Scegliendo $x$ sufficientemente piccolo si ottiene dunque $|F(x) - F(0)| < 2 epsilon$ concludendo quindi la dimostrazione che $F(x) -> F(0)$ per $x -> 0$.
]