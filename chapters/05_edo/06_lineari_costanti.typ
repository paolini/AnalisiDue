#import "../../lib.typ": *

= Equazioni lineari di ordine $n$ a coefficienti costanti

Una equazione differenziale ordinaria di ordine $n$ a coefficienti costanti è una equazione del tipo:
$ a_n dot u^((n))(x) + a_(n-1) dot u^((n-1))(x) + dots + a_1 dot u'(x) + a_0 dot u(x) = g(x) $ <eq:edo_lineare_omogenea_coeff_costanti_non_omogenea>
con $a_0, a_1, dots, a_n in RR$ (sono i coefficienti costanti) $a_n != 0$ e $g(x)$ una funzione continua (se fosse $a_n=0$ non è un problema: abbiamo una equazione di ordine inferiore).
Tale equazione può essere scritta in forma normale e rientra nella casistica generale che abbiamo considerato nel capitolo precedente.
In particolare il teorema @th:edo_lineare_ordine_n ci dice che lo spazio delle soluzioni è uno spazio lineare affine di dimensione $n$.

Se $g=0$ diremo che l'equazione è lineare omogenea (sempre a coefficienti costanti)
$ a_n dot u^((n))(x) + a_(n-1) dot u^((n-1))(x) + dots + a_1 dot u'(x) + a_0 dot u(x) = 0. $ <eq:edo_lineare_omogenea_coeff_costanti>
In questo caso l'insieme delle soluzioni è uno spazio vettoriale di dimensione $n$.
Osserviamo che il teorema di esistenza e unicità globale garantisce che le soluzioni dell'equazione differenziale lineare a coefficienti costanti siano funzioni di classe $C^n$ definite su tutto $RR$.
Ma i coefficienti costanti sono di classe $C^infinity$ dunque la maggiore regolarità delle soluzioni (teorema @th:maggiore_regolarita) ci dice, in questo caso, che le soluzioni dovranno essere funzioni di classe $C^infinity$.

Per motivi puramente algebrici sarà utile considerare le funzioni a valori complessi.
Ricordiamo che se $u(x)$ è una funzione a valori complessi, allora si può scrivere $u(x) = f(x) + i g(x)$ con $f$ e $g$ funzioni a valori reali.
Si avrà allora $u'(x) = f'(x) + i g'(x)$.
Denotiamo con $D: C^infinity (RR, CC) -> C^infinity (RR, CC)$ l'operatore derivata: $D u = u'$.

Osserviamo esplicitamente che anche quando $lambda in CC$ risulta, come nel caso $lambda in RR$
$ D e^(lambda x) = lambda e^(lambda x). $ <eq:499375>
Si potrebbe fare la verifica diretta riconducendosi alle funzioni $sin$ e $cos$ tramite le formule di Eulero ma questa è in realtà una proprietà fondamentale dell'esponenziale complesso che discende direttamente dal teorema \@th:exp_complesso (ci basta $h,x in RR$ ma in realtà questo è vero anche se $h,x in CC$):
$ lim_(h -> 0) (e^(lambda(x+h)) - e^(lambda x))/h = lim_(h -> 0) e^(lambda x) (e^(lambda h) - 1)/h = lambda e^(lambda x) lim_(h -> 0) (e^(lambda h) - 1)/(lambda h) = lambda e^(lambda x). $

Se $P in RR[x]$ è un polinomio di grado $n$ possiamo valutare $P$ sull'operatore derivata $D: C^infinity (RR, CC) -> C^infinity (RR, CC)$.
Questo ha senso perché sullo spazio $C^infinity (RR, CC)$ sono definite le operazioni di spazio vettoriale reale (somma e prodotto per scalare) in più l'operazione di moltiplicazione $D dot D$ e quindi la potenza $D^k$ va intesa come composizione dell'operatore lineare con se stesso.
In pratica l'operatore $P(D): C^infinity (RR, CC) -> C^infinity (RR, CC)$ risulta definito come segue
$ P(D)[u] = sum_(k=0)^n a_k D^k u = sum_(k=0)^n a_k u^((k)). $
Si osservi che $D^0 = I$ è l'identità ma tenendo valida la convenzione $D^0 = 1$ ci capiterà di scrivere $lambda$ al posto di $lambda I$ quando $lambda in RR$.

L'equazione lineare omogenea a coefficienti costanti @eq:edo_lineare_omogenea_coeff_costanti si può scrivere più espressivamente nella forma
$ P(D)[u] = 0. $
Visto che $a_n != 0$ si avrà $op("deg") P = n$.

== Equazioni omogenee

#theorem[
  Sia $P$ un polinomio e sia $lambda in CC$ una radice di $P$ con molteplicità $m$.
  Allora se $p(x)$ è un polinomio (a coefficienti complessi) di grado inferiore a $m$, la funzione $u(x) = p(x) e^(lambda x)$ è soluzione (complessa) dell'equazione differenziale
  $ P(D)[u] = 0. $
]

#proof[
  Se il polinomio $P(t)$ ha una radice $lambda$ con molteplicità $m$ significa che $P(t)$ è divisibile per $(t-lambda)^m$ cioè esiste un polinomio $R(t)$ tale che
  $ P(t) = R(t) dot (t-lambda)^m. $

  Ma allora possiamo decomporre anche l'equazione differenziale:
  $ P(D)[u] = R(D)[(D - lambda)^m u]. $
  Se $u(x) = p(x) e^(lambda x)$ si ha, utilizzando la @eq:499375,
  $ (D-lambda) u(x) &= D u(x) - lambda u(x) = p'(x) e^(lambda x) + p(x) lambda e^(lambda x) - lambda p(x) e^(lambda x) \
    &= p'(x) e^(lambda x), $
  da cui
  $ (D-lambda)^m u(x) = p^((m))(x) dot e^(lambda x). $
  Visto che la derivata di un polinomio è un polinomio di grado inferiore, se il polinomio $p$ ha grado inferiore a $m$ risulta che $p^((m)) = 0$.
  Dunque, come volevamo dimostrare,
  $ P(D)[u] = R(D)[(D-lambda)^m u] = R(D)[0] = 0. $
]

#theorem[indipendenza delle soluzioni fondamentali complesse][
  Il sottoinsieme $cal(B)$ di $C^infinity (RR, CC)$ dato dalle funzioni $u(x)$ della forma
  $ u(x) = x^m e^(lambda x) $
  al variare di $m in NN$, e $lambda in CC$ è un sottoinsieme linearmente indipendente dello spazio vettoriale $C^infinity (RR, CC)$ sul campo $CC$.
]

#proof[
  Si tratta di mostrare che se una combinazione lineare finita di tali funzioni è identicamente nulla, allora tutti i coefficienti sono nulli.

  Supponiamo per assurdo che esistano $u_1, dots, u_N in cal(B)$
  $ u_k (x) = x^(m_k) e^(lambda_k x), quad k=1, dots, N $
  tali che
  $ sum_(k=1)^N c_k x^(m_k) e^(lambda_k x) = 0 quad forall x in RR $
  per una qualche scelta di coefficienti $c_k in CC$ non tutti nulli.
  Sommando assieme i monomi che moltiplicano gli esponenziali con lo stesso coefficiente, potremo riscrivere la relazione precedente nella forma:
  $ sum_(j=1)^M P_j (x) e^(lambda_j x) = 0 quad forall x in RR $ <eq:4656978>
  con i coefficienti $lambda_j$ tutti diversi tra loro e con $P_j$ polinomi non nulli.

  Abbiamo già osservato che $(D-lambda) P(x) e^(lambda x) = P'(x) e^(lambda x)$ mentre se $lambda != mu$ si ha $(D-lambda) P(x) e^(mu x) = Q(x) e^(mu x)$ con $Q$ polinomio dello stesso grado di $P$ in quanto:
  $ (D-lambda) P(x) e^(mu x) = (P'(x) + (mu-lambda) P(x)) e^(mu x). $
  Posto $d_j = op("deg") P_j$ applichiamo all'equazione @eq:4656978 l'operatore $(D-lambda_1)^(d_1)$.
  Quello che si ottiene è:
  $ k_1 e^(lambda_1 x) + sum_(j=2)^M Q_j (x) e^(lambda_j x) = 0 quad forall x in RR $ <eq:4656979>
  dove $k_1$ è la derivata $d_1$-esima del polinomio $P_1$.
  Visto che $P_1$ è un polinomio di grado $d_1$ la sua derivata $d_1$-esima è un polinomio di grado $0$ non nullo, dunque è una costante $k_1 != 0$.
  I polinomi $Q_j$ hanno invece lo stesso grado dei $P_j$ perché abbiamo visto che se $lambda != mu$ il grado del polinomio non cambia.

  Ora applichiamo in sequenza all'equazione @eq:4656979 gli operatori $(D-lambda_j)^(d_j + 1)$ per $j=2, dots, M$.
  Applicando tali operatori il coefficiente $k_1$ cambierà, ma rimarrà comunque diverso da zero (chiamiamolo $k != 0$) mentre tutti gli altri polinomi verranno annullati, perché i rispettivi polinomi vengono derivati una volta in più del loro grado. Si otterrà quindi:
  $ k e^(lambda_1 x) = 0 quad forall x in RR. $
  Ma questo è assurdo perché per $x=0$ si ottiene $k=0$, che abbiamo escluso.
]

I risultati precedenti ci permettono di determinare tutte le soluzioni complesse delle equazioni lineari omogenee a coefficienti costanti. Infatti per ogni radice complessa $lambda$ del polinomio associato $P(t) = a_n t^n + dots + a_1 t + a_0$ se $m$ è la molteplicità di $lambda$ le funzioni
$ e^(lambda x), x e^(lambda x), dots, x^(m-1) e^(lambda x) $
sono $m$ soluzioni indipendenti, e al variare di $lambda$ tra le radici di $P$ otteniamo quindi in totale $n$ soluzioni indipendenti. Visto che sappiamo che lo spazio delle soluzioni ha dimensione $n$ le combinazioni lineari di queste soluzioni ci danno l'insieme di tutte le soluzioni.

Se tutte le radici del polinomio $P$ sono reali, le funzioni $e^(lambda x)$ sono effettivamente soluzioni reali e, grazie al seguente lemma, possiamo affermare che tutte le soluzioni reali si ottengono facendo combinazioni lineari a coefficienti reali di queste soluzioni.

#lemma[
  Siano $u_1 (x), dots, u_n (x)$ funzioni indipendenti a valori reali e sia
  $ h(x) = c_1 dot u_1 (x) + dots + c_n dot u_n (x) $
  una combinazione lineare a coefficienti complessi.
  Allora $h(x)$ ha valori reali se e solo se i coefficienti $c_1, dots, c_n$ sono anch'essi reali.
] <lm:combinazioni_reali>

#proof[
  È ovvio che se i coefficienti $c_1, dots, c_n$ sono reali e le funzioni $u_1, dots, u_n$ sono reali, facendone una combinazione lineare si ottiene una funzione reale.

  Per dimostrare il viceversa è invece necessario sapere che le funzioni sono anche indipendenti. Infatti se $h(x)$ è reale possiamo scrivere overline(h)(x) - h(x) = 0 cioè, visto che il coniugio attraversa la somma e il prodotto e visto che overline(u)_k (x) = u_k (x), si ha
  $ (overline(c)_1 - c_1) u_1 (x) + dots + (overline(c)_n - c_n) u_n (x) = 0. $
  Ma la combinazione lineare nulla si può ottenere solo con tutti i coefficienti nulli (è la definizione di indipendenza lineare) dunque overline(c)_k = c_k per ogni $k$ ovvero i coefficienti sono reali.
]

#example[
  Risolvere l'equazione
  $ u^((5)) - 2 u''' + u' = 0. $
]

#proof[Svolgimento][
  Il polinomio associato all'equazione è $P(lambda) = lambda^5 - 2 lambda^3 + lambda$ e può essere fattorizzato come segue:
  $ lambda^5 - 2 lambda^3 + lambda = lambda (lambda^4 - 2 lambda^2 + 1) = lambda (lambda^2 - 1)^2 = lambda (lambda - 1)^2 (lambda + 1)^2. $
  Dunque abbiamo tre radici distinte $lambda_1 = 0$, $lambda_2 = 1$, $lambda_3 = -1$ con molteplicità $m_1 = 1$, $m_2 = 2$, $m_3 = 2$.
  Una base di soluzioni è quindi data dalle cinque funzioni indipendenti
  $ 1, e^x, x e^x, e^(-x), x e^(-x). $
  Tutte le soluzioni si scrivono quindi nella forma
  $ u(x) = c_1 + (c_2 + c_3 x) e^x + (c_4 + c_5 x) e^(-x) $
  con $c_1, dots, c_5$ costanti arbitrarie.
]

Se però le radici del polinomio sono complesse noi siamo comunque interessati ad identificare le soluzioni reali.
Per fare ciò osserviamo che se $lambda = alpha + i beta$ è una radice complessa di un polinomio $P$ a coefficienti reali allora anche overline(lambda) = alpha - i beta è una radice complessa con la stessa molteplicità di $lambda$ (si veda la dimostrazione del teorema \@th:fattorizzazione_polinomio_reale).
Ma allora osserviamo che lo spazio generato dalle combinazioni lineari a coefficienti complessi di due soluzioni corrispondenti ai due coefficienti coniugati:
$ c_1 x^k e^(lambda x) + c_2 x^k e^(overline(lambda) x)
    &= c_1 x^k e^(alpha x + i beta x) + c_2 x^k e^(alpha x - i beta x) \
    &= x^k e^(alpha x) ((c_1 + c_2) cos(beta x) + i (c_1 - c_2) sin(beta x)) $
è anche una combinazione lineare a coefficienti complessi delle due funzioni reali:
$ x^k e^(alpha x) cos(beta x), quad x^k e^(alpha x) sin(beta x) $ <eq:489571798>
Dunque, per il lemma @lm:combinazioni_reali, le soluzioni reali possono essere scritte come combinazioni lineari a coefficienti costanti di queste ultime funzioni.

In pratica il metodo per determinare le soluzioni è quindi molto semplice.
Ogni radice reale $lambda$ del polinomio $P$ associato all'equazione dà origine alle seguenti soluzioni indipendenti:
$ e^(lambda x), x e^(lambda x), dots, x^(m-1) e^(lambda x) $
dove $m$ è la molteplicità di $lambda$ come radice del polinomio.
Per ogni coppia di radici complesse $lambda = alpha +/- i beta$ con molteplicità $m$ avremo invece le seguenti soluzioni indipendenti:
$ e^(alpha x) cos(beta x), x e^(alpha x) cos(beta x), dots, x^(m-1) e^(alpha x) cos(beta x), \
  e^(alpha x) sin(beta x), x e^(alpha x) sin(beta x), dots, x^(m-1) e^(alpha x) sin(beta x). $
In totale abbiamo quindi sempre $n = op("deg") P$ soluzioni indipendenti.

#example[
  Si determinino tutte le soluzioni dell'equazione differenziale
  $ u^((5))(x) + 2 u'''(x) + u'(x) = 0. $
]

#proof[Svolgimento][
  L'equazione può essere scritta nella forma
  $ P(D)[u] = 0 $
  con $P(lambda) = lambda^5 + 2 lambda^3 + lambda$.
  Possiamo fattorizzare il polinomio $P$ nel campo complesso:
  $ lambda^5 + 2 lambda^3 + lambda = lambda (lambda^2 + 1)^2 = lambda (lambda + i)^2 (lambda - i)^2. $
  Il polinomio ha una radice $lambda_0 = 0$ con molteplicità uno e due radici complesse coniugate $lambda_1 = i$, $lambda_2 = -i$ con molteplicità due.
  Risulta quindi che le seguenti funzioni devono essere soluzioni reali indipendenti dell'equazione:
  $ 1, quad cos x, quad x cos x, quad sin x, quad x sin x $ <eq:4995566>
  Ogni soluzione reale si potrà dunque scrivere nella forma:
  $ u(x) = c_1 + c_2 cos x + c_3 sin x + c_4 x cos x + c_5 x sin x $ <eq:499355456>
  con $c_1, c_2, dots, c_5 in CC$ opportuni coefficienti reali.
]

#remark[fase delle soluzioni oscillanti][
  Quando si vanno a scrivere le combinazioni lineari delle funzioni @eq:489571798 può essere utile osservare che ogni combinazione lineare di seni e coseni con la stessa pulsazione $beta$ è una singola onda eventualmente sfasata di un angolo $theta$:
  $ a cos(beta x) + b sin(beta x) = rho cos(beta x - theta) $
  dove $rho = |a + i b| = sqrt(a^2 + b^2)$ e $theta = op("arg")(a + i b)$.
  Infatti posto $a = rho cos theta$, $b = rho sin theta$ si ha, grazie alla formula di addizione:
  $ a cos(beta x) + b sin(beta x) = rho (cos theta cos(beta x) + sin theta sin(beta x)) = rho cos(beta x - theta). $
]

== Equazioni lineari non omogenee

Il teorema @th:edo_lineare_ordine_n ci dice che le soluzioni di una equazione lineare non omogenea (non importa se a coefficienti costanti o meno)
$ L[u] = g $
si scrivono tutte nella forma $u = u_* + op("ker") L$ dove $u_*$ è una qualunque soluzione fissata della non omogenea e $op("ker") L$ è l'insieme delle soluzioni dell'equazione omogenea associata
$ L[u] = 0. $
Allora, supponendo di sapere risolvere l'equazione omogenea (cosa che sappiamo fare se i coefficienti sono costanti), per trovare tutte le soluzioni della non omogenea sarà sufficiente trovare una sola soluzione particolare $u_*$.

Nel seguito vedremo due metodi per determinare una soluzione particolare quando abbiamo una equazione non omogenea a coefficienti costanti.
Il primo metodo (di similarità) si applica quando il termine noto $g(x)$ assume una forma specifica, il secondo metodo (della variazione delle costanti) si applica in generale, ma potrebbe risultare più laborioso del primo.

#theorem[metodo di similarità][
  Consideriamo l'equazione non omogenea complessa
  $ P(D)[u] = q(x) e^(lambda x). $ <eq:3976734956>
  con $P$ e $q$ polinomi a coefficienti complessi.
  Sia $m$ la molteplicità di $lambda$ come radice di $P$ ($m=0$ se $lambda$ non è radice di $P$).
  Allora una soluzione particolare di @eq:3976734956 può essere scritta nella forma
  $ u_*(x) = p(x) x^m e^(lambda x) $ <eq:945396>
  con $p$ un polinomio (incognito) di grado uguale al grado di $q$.
]

#proof[
  Se $u_*(x) = x^m p(x) e^(lambda x)$ vogliamo capire come agisce l'operatore $P(D)$ su $u_*$, in particolare dato un qualunque polinomio $q$ vogliamo capire se esiste un polinomio $p$, dello stesso grado di $q$, tale che applicando $P(D)$ ad $u_*(x)$ si ottiene $q(x) e^(lambda x)$.

  Fattorizziamo il polinomio $P(z)$:
  $ P(z) = (z-lambda_1)^(m_1) dots (z-lambda_n)^(m_n) $
  dove $lambda_1, dots, lambda_n in CC$ sono le radici distinte di $P(z)$ e $m_1, dots, m_n in NN$ sono le relative molteplicità. Dunque l'operatore $P(D)$ può essere fattorizzato nella forma corrispondente:
  $ P(D) = (D-lambda_1)^(m_1) dots (D-lambda_n)^(m_n). $

  Chiamiamo $V_m^n$ lo spazio vettoriale dei polinomi della forma $x^m p(x)$ con $op("deg") p < n$.
  Una base di $V_m^n$ sono i monomi $x^m, x^(m+1), dots, x^(m+n-1)$ e dunque $V_m^n$ è uno spazio vettoriale di dimensione $n$.

  La dimostrazione del teorema si basa sull'osservazione di come agisce l'operatore $(D-lambda_k)^(m_k)$ sulle funzioni del tipo $u(x) = p(x) e^(lambda x)$ con $p in V_m^n$. In generale se $p$ è un polinomio si ha
  $ (D-lambda_k)[p(x) dot e^(lambda x)] = ((lambda - lambda_k) p(x) + p'(x)) dot e^(lambda x). $
  Dobbiamo allora distinguere due casi. Se $lambda != lambda_k$ allora la funzione $p(x) e^(lambda x)$ viene trasformata nella funzione $q(x) e^(lambda x)$ dove $q$ è un polinomio dello stesso grado di $p$, in quanto il termine di grado massimo di $p$ viene moltiplicato per $lambda - lambda_k$ mentre il polinomio $p'$ ha il grado inferiore al grado di $p$ e quindi non influenza il termine di grado massimo. Se chiamiamo $T_k: V_0^n -> V_0^n$ l'operatore lineare che manda il polinomio $p(x)$ nel polinomio $q(x) = (lambda - lambda_k) p(x) + p'(x)$ osserviamo che $T_k$ è iniettivo in quanto, visto che $T_k$ preserva il grado del polinomio, l'unico polinomio che può andare a zero è il polinomio nullo. Dunque, per il teorema del rango, $T_k$ è bigettivo e di conseguenza $T_k^(m_k): V_0^n -> V_0^n$ è bigettivo.

  Se invece $lambda = lambda_k$ osserviamo ora che l'operatore $T_k$ non è altro che la derivata: $q(x) = p'(x)$.
  E se $m=m_k$ è la molteplicità di $lambda$ come radice di $P$, l'operatore $T_k^(m_k)$ non è altro che la derivata $m$-esima.
  Tale operatore non è invertibile su $V_0^n$ in quanto manda a zero tutti i polinomi di grado inferiore a $m$. Ma se partiamo da un polinomio in $V_m^n$ allora l'operatore $T_k^m: V_m^n -> V_0^n$ diventa invertibile: infatti in $V_m^n$ ci sono polinomi della forma $a_m x^m + a_(m+1) x^(m+1) + dots + a_(n+m) x^(n+m)$ e facendone la derivata $m$-esima si può ottenere il polinomio nullo solamente se tutti i coefficienti sono nulli.
  Risulta quindi che, se $lambda = lambda_k$, l'operatore $T_k^m: V_m^n -> V_0^n$ è invertibile.

  Siamo arrivati alla conclusione. Se prendiamo un polinomio $p(x)$ in $V_m^n$ e applichiamo $P(D)$ alla corrispondente funzione $u(x) = p(x) e^(lambda x)$ possiamo applicare sequenzialmente gli operatori $(D-lambda_k)^(m_k)$.
  Questi agiscono sulla funzione $u$ modificando il polinomio $p$.
  Se $lambda$ è radice di $P$ al primo passaggio applichiamo l'operatore $(D-lambda_k)^(m_k)$ con $lambda_k = lambda$ e $m_k = m$ cosicché il polinomio $p in V_m^n$ viene trasformato, in maniera biunivoca, in un polinomio di $V_0^n$.
  Dopodiché applico tutti gli altri operatori $(D-lambda_k)^(m_k)$ con $lambda_k != lambda$ trasformando il polinomio di $V_0^n$ in un altro polinomio di $V_0^n$ ma sempre in maniera biunivoca.
  Ne risulta che alla fine ottengo una mappa biunivoca tra $V_m^n -> V_0^n$ e qualunque sia $q in V_0^n$ sappiamo esistere un $u in V_m^n$ che viene mandato in $q$.
]

#remark[
  Si noti che nella dimostrazione precedente abbiamo investigato la struttura dell'operatore differenziale $D$ a coefficienti costanti.
  Quello che abbiamo fatto è in realtà il processo di decomposizione di Jordan di un operatore lineare.
  L'operatore $D$ ha come autovettori le funzioni $e^(lambda_k x)$ con $lambda_k$ radici del polinomio $P$.
  Si osserva però che le funzioni della forma $x^j e^(lambda_k x)$ sono _autovettori generalizzati_ in quanto iterando l'operatore $D-lambda_k$ vengono mandati in un autovettore e sono quindi una base dell'autospazio relativo all'autovettore $lambda_k$.

  La base formata dalle funzione della forma $x^j / j! e^(lambda_j x)$ è una _base a ventaglio_ e la matrice che rappresenta l'operatore $D$ risulta essere una matrice a blocchi nella forma di Jordan: gli autovalori stanno sulla diagonale e una fila di $1$ si trova al di sopra della diagonale.

  Il nucleo dell'operatore $P(D)$ si decompone come somma diretta dei nuclei degli operatori $(D-lambda_k)^(m_k)$.
]

#definition[wronksiano][
  Siano $u_1, dots, u_n$ funzioni di classe $C^(n-1)$.
  La matrice
  $ W(x) = mat(
    u_1(x), u_2(x), dots, u_n(x);
    u_1'(x), u_2'(x), dots, u_n'(x);
    dots.v, dots.v, dots.down, dots.v;
    u_1^((n-1))(x), u_2^((n-1))(x), dots, u_n^((n-1))(x)
  ) $ <eq:wronksiano>
  è chiamata _matrice wronksiana_.
  Il determinante di tale matrice $w(x) = det W(x)$ è chiamato _determinante wronksiano_.
]

#theorem[
  Sia $I subset RR$ un intervallo aperto non vuoto e siano $a_j in C^0(I, CC)$.
  Siano $u_1, dots, u_n$ funzioni di classe $C^n$ soluzioni dell'equazione lineare omogenea in forma normale:
  $ u^((n)) = sum_(j=1)^n a_j (x) u^((j-1))(x). $ <eq:092784>
  Sia $W(x)$ la matrice wronksiana @eq:wronksiano.
  Allora le seguenti proprietà sono equivalenti:
  + Le funzioni $u_1, dots, u_n$ sono linearmente indipendenti; <item:4736201>
  + Per ogni $x in I$ si ha $det W(x) != 0$; <item:4736202>
  + Esiste $x in I$ tale che $det W(x) != 0$. <item:4736203>
] <th:wronksiano>

#proof[
  Ovviamente \@item:4736202 implica \@item:4736203.

  Dimostriamo che \@item:4736203 implica \@item:4736201.
  Passando alla implicazione contropositiva dobbiamo mostrare che se $u_1, dots, u_n$ sono linearmente dipendenti allora per ogni $x in I$ si ha $det W(x) = 0$. Ma se le funzioni sono dipendenti significa che esiste $arrow(lambda) != 0$ tale che
  $ lambda_1 u_1 (x) + dots + lambda_n u_n (x) = 0 quad forall x in I. $ <eq:3675893>
  Derivando si ottiene:
  $ cases(
    lambda_1 u_1 (x) + dots + lambda_n u_n (x) = 0,
    lambda_1 u_1 '(x) + dots + lambda_n u_n '(x) = 0,
    dots.v,
    lambda_1 u_1^((n-1))(x) + dots + lambda_n u_n^((n-1))(x) = 0
  ) $
  ovvero
  $ W(x) arrow(lambda) = 0 quad forall x in I. $
  Ma allora la matrice $W(x)$ non è invertibile e quindi $det W(x) = 0$, come volevamo dimostrare.

  Dimostriamo infine che \@item:4736201 implica \@item:4736202 cioè che se $v_1, dots, v_n$ sono indipendenti allora $det W(x) != 0$ per ogni $x in I$.
  Fissato $x in I$ consideriamo il funzionale $J(v) = (v(x), v'(x), dots, v^((n-1))(x))$ cosicché si ha
  $ W(x) = (J(u_1), dots, J(u_n)). $
  In base al teorema @th:edo_lineare_ordine_n ci ricordiamo che $J$ risulta essere un isomorfismo di spazi vettoriali, dunque se $v_1, dots, v_n$ sono indipendenti anche $J(v_1), dots, J(v_n)$ dovranno essere indipendenti.
  Ma visto che le colonne della matrice $W(x)$ sono indipendenti significa che $det W(x) != 0$, come volevamo dimostrare.
]

#theorem[metodo della variazione delle costanti arbitrarie][
  Si consideri una generica equazione differenziale lineare non omogenea di ordine $n$ in forma normale:
  $ u^((n))(x) = sum_(k=0)^(n-1) a_k (x) u^((k))(x) + b(x) $ <eq:395467435>
  dove $a_0, dots, a_(n-1), b in C^0(A, CC)$ sono funzioni definite su un aperto $A subset RR$ e si cerca una soluzione $u in C^n(A, CC)$.

  Se $v_1, dots, v_n in C^n(A, CC)$ sono soluzioni indipendenti dell'equazione omogenea associata:
  $ u^((n))(x) = sum_(k=0)^(n-1) a_k (x) u^((k))(x) $
  allora esistono delle funzioni $c_k in C^1(A, CC)$ per $k=0, 1, dots, n-1$ tali che
  $ cases(
    c_1 ' v_1 + dots + c_n ' v_n = 0,
    c_1 ' v_1 ' + dots + c_n ' v_n ' = 0,
    dots.v,
    c_1 ' v_1^((n-2)) + dots + c_n ' v_n^((n-2)) = 0,
    c_1 ' v_1^((n-1)) + dots + c_n ' v_n^((n-1)) = b(x).
  ) $ <eq:02154676>
  E in tal caso la funzione
  $ u(x) = sum_(k=1)^n c_k (x) v_k (x) $
  risolve l'equazione non omogenea @eq:395467435.
]

#proof[
  Osserviamo innanzitutto che se esistono le funzioni $c_k$ che soddisfano il sistema @eq:02154676 allora la funzione $u = c_1 dot v_1 + dots + c_n dot v_n$ risolve l'equazione non omogenea. Infatti dalla formula di derivazione del prodotto si ha:
  $ u' = sum_(k=1)^n c_k v_k ' + sum_(k=1)^n c_k ' v_k = sum_(k=1)^n c_k v_k ' $
  essendo il secondo addendo nullo per l'ipotesi @eq:02154676.
  Ma allora si può proseguire con le derivate:
  $ u'' = sum_(k=1)^n c_k v_k '' + sum_(k=1)^n c_k ' v_k ' = sum_(k=1)^n c_k v_k '' $
  fino alla derivata $(n-1)$-esima:
  $ u^((n-1)) = sum_(k=1)^n c_k v_k^((n-1)). $
  Per l'ultima derivata si ha infine:
  $ u^((n)) = sum_(k=1)^n c_k v_k^((n)) + sum_(k=1)^n c_k ' v_k^((n-1)) = sum_(k=1)^n c_k v_k^((n)) + b. $
  Ma allora si osserva che si ha
  $ u^((n)) + sum_(j=0)^(n-1) a_j u^((j))
      &= sum_(k=1)^n c_k v_k^((n)) + b + sum_(j=0)^(n-1) a_j sum_(k=1)^n c_k v_k^((j)) \
      &= sum_(k=1)^n c_k (v_k^((n)) + sum_(j=0)^(n-1) a_j v_k^((j))) + b = b $
  in quanto le funzioni $v_j$, per ipotesi, risolvono l'equazione omogenea.

  Rimane quindi solo da verificare che esistono funzioni $c_k in C^1(A, CC)$ che soddisfano il sistema @eq:02154676.
  Si osserva che il sistema @eq:02154676 si scrive nella forma
  $ W(x) arrow(c)'(x) = arrow(b)(x) $
  dove $W(x)$ è la matrice wronksiana $W(x)$ associata alle soluzioni $v_1, dots, v_n$, $arrow(c)(x) = (c_1 (x), dots, c_n (x))$ e $arrow(b)(x) = (0, dots, 0, b(x))$.
  Siccome $v_1, dots, v_n$ per ipotesi sono indipendenti, per il teorema @th:wronksiano sappiamo che $det W(x) != 0$ per ogni $x$ e quindi il sistema $W(x) arrow(d)(x) = arrow(b)(x)$ ammette una unica soluzione $arrow(d)(x)$ per ogni $x in I$.
  Visto che $W(x)$ e $arrow(b)(x)$ hanno coefficienti continui, anche la soluzione $arrow(d)(x) = W(x)^(-1) arrow(b)(x)$ dovrà essere continua (che i coefficienti della matrice $W(x)^(-1)$ siano continui lo si vede ad esempio scrivendo $W(x)^(-1)$ tramite la matrice dei cofattori e sfruttando il fatto che il determinante è una funzione continua) e quindi, fissato un punto $x_0 in I$, potremo definire
  $ c_k (x) = integral_(x_0)^x d_k (t) thin d t $
  per determinare le funzioni $c_k$.
]

#exercise[
  Trovare tutte le soluzioni dell'equazione lineare non omogenea a coefficienti costanti:
  $ u''(x) + u(x) = 1/(cos x). $
]

#proof[Svolgimento][
  Il polinomio associato è $P(lambda) = lambda^2 + 1$ che ha due radici complesse coniugate $+/- i$.
  Due soluzioni indipendenti dell'equazione omogenea $u'' + u = 0$ sono dunque (come noto):
  $ u_1 (x) = cos x, quad u_2 (x) = sin x. $
  La soluzione generale dell'omogenea è dunque della forma:
  $ u(x) = A cos x + B sin x. $

  Per trovare una soluzione particolare della equazione non omogenea utilizziamo il metodo della variazione delle costanti, cioè cerchiamo una soluzione della forma:
  $ u_*(x) = A(x) cos x + B(x) sin x. $
  I coefficienti $A(x)$ e $B(x)$ si determinano risolvendo il sistema
  $ cases(
    A'(x) dot cos x + B'(x) dot sin x = 0,
    A'(x) dot (- sin x) + B'(x) dot cos x = 1/(cos x).
  ) $
  Si trova quindi
  $ cases(
    A'(x) = - (sin x)/(cos x) dot B'(x),
    B'(x) = 1
  ) $
  da cui, integrando, si trova
  $ A(x) = ln |cos x|, quad B(x) = x $
  e quindi
  $ u_*(x) = cos x dot ln |cos x| + x sin x. $

  Tutte le soluzioni dell'equazione data si scrivono quindi come somma della soluzione particolare della non omogenea più la soluzione generale della omogenea:
  $ u(x) = a cos x + b sin x + cos x dot ln |cos x| + x sin x. $
]
