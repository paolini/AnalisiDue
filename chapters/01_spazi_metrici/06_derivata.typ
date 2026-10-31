#import "../../lib.typ": *

= Scambio della derivata con il limite

#theorem[scambio del limite con la derivata][
  Sia $I subset RR$ un intervallo e siano $f_k in C^1(I)$ funzioni tali che $f_k(x_0)$ converge per almeno un punto $x_0 in I$ e la successione delle derivate $f_k'$ converge ad una funzione $g: I -> RR$ uniformemente su ogni intervallo chiuso e limitato $[a,b] subset I$. Allora esiste $f in C^1(I)$ tale che $f'=g$ e $f_k$ converge a $f$ uniformemente su ogni intervallo chiuso e limitato $[a,b] subset I$.
  In queste ipotesi si può quindi scambiare la derivata con il limite:
  $ lim_(k -> +infinity) (d / (d x) f_k(x)) = f'(x) = d / (d x) (lim_(k -> +infinity) f_k(x)), quad forall x in I. $
]

#proof[
  Per ipotesi esiste $y_0 in RR$ tale che $f_k(x_0) -> y_0$.
  Definiamo
  $ f(x) = y_0 + integral_(x_0)^x g(t) thin d t. $
  Per la continuità del limite uniforme sappiamo che $g$ è continua, dunque possiamo applicare il teorema fondamentale del calcolo per dedurre che $f'=g$. Mostriamo ora che su ogni intervallo $[a,b] subset I$ si ha $f_k => f$. Per la formula fondamentale del calcolo integrale si ha:
  $ integral_(x_0)^x f_k'(t) thin d t = f_k(x) - f_k(x_0) $
  dunque
  $ sup_(x in [a,b]) |f_k(x) - f(x)|
      &= sup_(x in [a,b]) |f_k(x_0) + integral_(x_0)^x f_k'(t) thin d t - y_0 - integral_(x_0)^x g(t) thin d t| \
      &<= |f_k(x_0) - y_0| + sup_(x in [a,b]) |integral_(x_0)^x |f_k'(t) - g(t)| thin d t| \
      &<= |f_k(x_0) - y_0| + (b-a) norm(f_k' - g) -> 0. $
]

Lo spazio $C^1([a,b])$ è un sottospazio vettoriale di $C^0([a,b])$ ma non è chiuso, come si deduce dall'esempio @ex:466533 (si potrebbe anzi dimostrare che $C^1$ è denso in $C^0$) dunque $C^1$ non è completo rispetto alla norma uniforme.
Per trasformare lo spazio $C^1([a,b])$ in uno spazio di Banach possiamo definire una norma più forte, come ad esempio questa:
$ norm(f)_(C^1) = norm(f)_infinity + norm(f')_infinity. $

#theorem[$C^1$ spazio di Banach][
  Lo spazio vettoriale $C^1([a,b])$ dotato della norma $norm(dot)_(C^1)$ risulta essere uno spazio di Banach.
]

#proof[
  È facile verificare che $norm(dot)_(C^1)$ è una norma su $C^1([a,b])$, dobbiamo solo verificare che lo spazio risulta completo. Sia dunque $f_k$ una successione di Cauchy rispetto alla norma $C^1$. Allora $f_k'$ e $f_k$ sono entrambe successioni di Cauchy in $C^0$ in quanto $norm(f_k)_infinity <= norm(f_k)_(C^1)$ e $norm(f_k')_infinity <= norm(f_k)_(C^1)$.
  Dunque, per la completezza di $C^0$, sappiamo che esistono $f,g in C^0([a,b])$ tali che $f_k => f$ e $f_k' => g$.
  In base al teorema di scambio del limite con la derivata possiamo affermare che $f in C^1$ e $f'=g$, dunque
  $ norm(f_k - f)_(C^1) = norm(f_k - f)_infinity + norm(f_k' - g)_infinity -> 0. $
]

Il teorema di scambio del limite con l'integrale ci dice che l'operatore integrale $S: C^0 -> C^1$ è continuo tra i due spazi di Banach. Anche l'operatore differenziale $D: C^1 -> C^0$ $f |-> D f = f'$ è ovviamente continuo.

== Serie di funzioni

Se $f_k: A -> RR$ è una successione di funzioni definite su uno stesso insieme $A$, possiamo considerare (come abbiamo già fatto per le successioni numeriche) la successione delle somme parziali:
$ S_n(x) = sum_(k=0)^n f_k(x), quad x in A. $
Tale successione si chiama _serie_ corrispondente alla successione di funzioni $f_k$ e si indica a volte come $sum f_n$. Per ogni $x$ in cui la serie è convergente si può quindi definire la _somma_ della serie
$ S(x) = sum_(k=0)^(+infinity) f_k(x) = lim_(n -> +infinity) S_n(x). $
La somma $S$ è dunque il limite puntuale della successione delle somme parziali $S_n$.

I teoremi che abbiamo dimostrato per le successioni di funzioni sono quindi validi anche per le serie di funzioni. Basterà ricordare che la _convergenza uniforme della serie_ è la convergenza uniforme delle somme parziali. Dunque $sum f_k$ converge uniformemente a $S$ se $S_n => S$ ovvero se
$ norm(S - S_n)_infinity = norm(sum_(k=n+1)^(+infinity) f_k)_infinity -> 0 quad text("per") n -> +infinity. $

#theorem[integrale di una serie di funzioni][
  Sia $f_k: [a,b] -> RR$ una successione di funzioni continue definite sull'intervallo $[a,b] subset RR$. Se la serie $sum f_k$ converge uniformemente allora si può scambiare l'integrale con la somma della serie:
  $ integral_a^b (sum_(k=0)^(+infinity) f_k(t)) thin d t = sum_(k=0)^(+infinity) (integral_a^b f_k(t) thin d t) quad forall x in I. $
] <th:integrale_serie>

#proof[
  La dimostrazione è una semplice conseguenza del fatto che lo scambio può essere fatto sulle somme finite e il passaggio al limite può essere fatto grazie al teorema di scambio del limite con l'integrale.

  Sia $S_n = sum f_n$ la successione delle somme parziali e sia $S$ il limite delle somme parziali. Per ipotesi $S_n => S$. Applicando il teorema di scambio dell'integrale con il limite si ha
  $ lim_(n -> +infinity) integral_a^b S_n(t) thin d t = integral_a^b S(t) thin d t. $
  Ma da un lato, sfruttando l'additività dell'integrale sulle somme finite:
  $ lim_(n -> +infinity) integral_a^b S_n(t) thin d t
      &= lim_(n -> +infinity) integral_a^b (sum_(k=0)^n f_k(t)) thin d t \
      &= lim_(n -> +infinity) sum_(k=0)^n (integral_a^b f_k(t) thin d t) \
      &= sum_(k=0)^infinity (integral_a^b f_k(t) thin d t) $
  e dall'altro lato:
  $ integral_a^b S(t) thin d t = integral_a^b (sum_(k=0)^(+infinity) f_k(t)) thin d t. $
]

#theorem[derivata di una serie di funzioni][
  Sia $f_k: I -> RR$ una successione di funzioni continue definite sull'intervallo $I$. Se le funzioni $f_k$ sono di classe $C^1$ e la serie delle derivate $sum f_k'$ converge uniformemente su ogni intervallo chiuso e limitato $[a,b] subset I$ e se c'è almeno un punto $x_0 in I$ tale che la serie $sum f_k(x_0)$ converge, allora
  $ d / (d x) sum_(k=0)^(+infinity) f_k(x) = sum_(k=0)^(+infinity) d / (d x) f_k(x) quad forall x in I. $
]

#proof[
  Sia $S_n$ la successione delle somme parziali. Per ipotesi sappiamo che esiste una funzione $T: I -> RR$ tale che $S_n' => T$ in ogni intervallo $[a,b] subset I$.
  Sappiamo inoltre che $S_n(x_0)$ converge.
  Dunque possiamo applicare il teorema di scambio del limite con la derivata per ottenere che esiste $S in C^1(I)$ tale che $S_n(x) -> S(x)$ per ogni $x in I$ e
  $ S'(x) = T(x) quad forall x in I. $
  Ma da un lato
  $ S'(x)
      &= d / (d x) lim_(n -> +infinity) S_n(x) \
      &= d / (d x) sum_(k=0)^(+infinity) f_k(x) $
  e dall'altro lato
  $ T(x)
      &= lim_(n -> +infinity) S_n'(x) = lim_(n -> +infinity) d / (d x) sum_(k=0)^n f_k(x) \
      &= lim_(n -> +infinity) sum_(k=0)^n f_k'(x) = sum_(k=0)^(+infinity) f_k'(x). $
]

La convergenza uniforme di una serie non è molto semplice da verificare. Più semplice è la seguente condizione, che vedremo essere più forte.

#definition[convergenza totale di una serie di funzioni][
  Siano $f_k: A -> RR$ funzioni definite su un insieme $A subset RR$. Diremo che la serie di funzioni $sum f_k$ _converge totalmente_ se la serie numerica $sum norm(f_k)_infinity$ è convergente.
]

#theorem[convergenza totale][
  Se la serie $sum f_n$ converge totalmente allora converge uniformemente.
]

#proof[
  Per $x$ fissato la serie $sum f_n(x)$ converge assolutamente in quanto
  $ sum_(k=0)^infinity |f_n(x)| <= sum_(k=0)^infinity norm(f_n)_infinity < +infinity. $
  Dunque la serie converge e posto
  $ S_n(x) = sum_(k=0)^n f_k(x), quad S(x) = sum_(k=0)^(+infinity) f_k(x) $
  si ha che $S_n -> S$ puntualmente.
  Per mostrare che $S_n => S$ basta osservare che per $n -> +infinity$ si ha:
  $ |S(x) - S_n(x)| = |sum_(k=n+1)^(+infinity) f_k(x)| <= sum_(k=n+1)^(+infinity) |f_k(x)| <= sum_(k=n+1)^(+infinity) norm(f_k)_infinity -> 0. $
]

#theorem[convergenza totale delle serie di potenze][
  Sia $sum a_n z^n$ una serie di potenze e sia $R in [0, +infinity]$ il suo raggio di convergenza. Allora la serie converge totalmente su ogni disco $D_r$ con $r < R$.
] <th:convergenza_totale>

#proof[
  Ora osserviamo che sul disco di raggio $r$ si ha $norm(a_k z^k)_infinity = |a_k| r^k$ e dunque
  $ sum_(k=0)^(+infinity) norm(a_k z_k)_infinity = sum_(k=0)^(+infinity) |a_k| r^k < +infinity $
  in quanto la serie $sum a_k z^k$ converge assolutamente per $z=r$ essendo $r < R$.
]

#corollary[
  La serie di potenze
  $ f(x) = sum_(k=0)^(+infinity) a_k x^k $
  ha lo stesso raggio di convergenza $R$ della serie delle derivate
  $ g(x) = sum_(k=1)^(+infinity) k a_k x^(k-1) $
  e per $x in (-R,R)$ si ha
  $ f'(x) = g(x). $
] <cor:derivata_serie_potenze>

#proof[
  In base al criterio della radice il raggio di convergenza della serie è il reciproco del limite superiore di $root(k, a_k)$. Visto che $root(k, k) -> 1$, la serie originaria e la serie delle derivate hanno lo stesso raggio di convergenza.
  Nel teorema precedente abbiamo mostrato che su ogni intervallo $[-r,r]$ con $r < R$ la serie di potenze con somma $f$ converge totalmente. Dunque converge uniformemente e possiamo scambiare la derivata con la somma per ottenere $f'(x) = g(x)$.
]

#example[
  Sappiamo che la serie di potenze
  $ f(x) = sum_(k=1)^(+infinity) x^k / k $
  ha raggio di convergenza $R=1$ (si usi ad esempio il criterio del rapporto). La serie delle derivate è
  $ g(x) = sum_(k=1)^(+infinity) x^(k-1) = sum_(k=0)^(+infinity) x^k = 1 / (1 - x). $
  Dunque per $|x| < 1$ si ha
  $ f'(x) = g(x) = 1 / (1 - x) $
  da cui
  $ f(x) = f(0) + integral_0^x f'(t) thin d t = integral_0^x 1 / (1 - t) thin d t = lr([-ln(1-t)])_0^x = -ln(1-x). $
  Abbiamo quindi scoperto che vale
  $ sum_(k=1)^(+infinity) x^k / k = -ln(1-x) quad text("per ogni") x in (-1,1). $
  Osserviamo ora che la serie con somma $f(x)$ non converge per $x=1$ (serie armonica) ma converge per $x=-1$ (criterio di Leibniz). Per il Lemma di Abel (vedi appunti di Analisi Matematica Uno) sappiamo che la funzione $f(x)$ è continua nel punto $x=-1$ e dunque possiamo concludere che
  $ sum_(k=1)^(+infinity) x^k / k = -ln(1-x) quad forall x in [-1,1). $
  In particolare abbiamo trovato la somma della serie armonica a segni alterni:
  $ sum_(k=1)^(+infinity) (-1)^(k+1) / k = -f(x) = ln 2. $

  Osserviamo che queste informazioni sono coerenti con lo sviluppo di Taylor di $ln(1+x)$ che avevamo già determinato. Ma non sono conseguenza di esso, in quanto lo sviluppo di Taylor ci dà informazioni solamente per $x -> 0$ mentre ora abbiamo ottenuto informazioni per ogni $x$ in $[-1,1)$.
]

#example[
  Applichiamo l'idea precedente alla funzione op("arctg"). Si ha
  $ op("arctg")'(x) = 1 / (1 + x^2) = sum_(k=0)^(+infinity) (-x^2)^k = sum_(k=0)^(+infinity) (-1)^k x^(2k) = sum_(k=0)^(+infinity) (-1)^k / (2k+1) (x^(2k+1))'. $
  La serie
  $ f(x) = sum_(k=0)^(+infinity) (-1)^k / (2k+1) x^(2k+1) $
  ha raggio di convergenza $R=1$ e dunque per ogni $x in (-1,1)$ sappiamo che la serie delle derivate converge alla derivata della serie da cui
  $ f'(x) = op("arctg")' x. $
  Visto che $f(0) = 0 = op("arctg") 0$ possiamo concludere che $f(x) = op("arctg") x$ per ogni $x in (-1,1)$.
  La serie è convergente anche per $x=1$, per il criterio di Leibniz. Per continuità (Lemma di Abel) si ottiene che $f(1) = op("arctg") 1$.
  Dunque
  $ op("arctg") x = sum_(k=0)^(+infinity) (-1)^k / (2k+1) x^(2k+1) quad forall x in (-1,1]. $
  In particolare per $x=1$ si ottiene la formula di _Gregory-Leibniz_
  $ pi / 4 = sum_(k=0)^(+infinity) (-1)^k / (2k+1) = 1 - 1/3 + 1/5 - 1/7 + dots $
]