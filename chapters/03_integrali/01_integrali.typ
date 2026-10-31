#import "../../lib.typ": *

= Integrale di Riemann

Se $x,y in RR$ definiamo:
$ x or y := max({x,y}), quad x and y := min({x,y}), quad x^+ := x or 0, quad x^- := (-x)^+ := -(x and 0). $
Si ha
$ x^+, x^- >= 0, quad x = x^+ - x^-, quad |x| = x^+ + x^-, quad x^+ = (|x|+x)/2, quad x^- = (|x|-x)/2. $

Sia $A subset RR^n$ e $f: A -> RR$.
Definiamo il _supporto_ di $f$ come
$ op("spt") f := bar({arrow(x) in A : f(arrow(x)) != 0}) = bar(f^(-1)(RR without {0})). $

Dato $A subset RR^n$ definiamo la _funzione caratteristica_ di $A$ come $1_A : RR^n -> RR$,
$ 1_A (arrow(x)) := cases(
  1 &text("se ") arrow(x) in A,
  0 &text("altrimenti.")
) $

Per $arrow(k) in ZZ^n$ e $N in NN$ definiamo il cubetto
$ Q_arrow(k)^N := (arrow(k) + [0,1]^d) / 2^N. $
Si tratta di un cubetto di lato $2^(-N)$ con gli spigoli paralleli agli assi cartesiani e con un vertice nel punto $2^(-N) arrow(k)$.
Il volume di $Q_arrow(k)^N$ sarà quindi $2^(-n N)$.
Useremo questi cubetti per misurare il volume di insiemi arbitrari.

#definition[integrale di Riemann][
  Sia $f: RR^n -> RR$ una funzione limitata, con supporto limitato.
  Definiamo le somme superiori e inferiori sulla $N$-esima suddivisione in cubi:
  $ S^N (f) &:= 2^(-n N) sum_(arrow(k) in ZZ^n) sup f(Q_arrow(k)^N), \
    S_N (f) &:= 2^(-n N) sum_(arrow(k) in ZZ^n) inf f(Q_arrow(k)^N). $
  Visto che il supporto di $f$ è limitato, queste somme sono in realtà somme finite. Visto che $f$ è limitata, ogni addendo è finito e dunque $S^N (f), S_N (f) in RR$ per ogni $N in NN$.
  Osservando che $N |-> S^N (f)$ è decrescente mentre $N |-> S_N (f)$ è crescente, definiamo l'integrale superiore e inferiore:
  $ S^*(f) &:= inf_N S^N (f) = lim_(N -> +infinity) S^N (f) in RR, \
    S_*(f) &:= sup_N S_N (f) = lim_(N -> +infinity) S_N (f) in RR. $
  Se $S^*(f) = S_*(f)$ diremo che $f$ è Riemann integrabile (o R-integrabile) e scriveremo
  $ integral f = S^*(f) = S_*(f). $

  #footnote[
    Per le funzioni di una variabile la notazione $integral f$ rappresentava l'_integrale indefinito_ ovvero l'insieme delle primitive della funzione $f$.
    Per le funzioni di più variabili il concetto di integrale indefinito non ha senso e si usa invece la notazione $integral f$ per indicare l'integrale esteso a tutto lo spazio $integral_(RR^n) f$.
  ]

  Volendo rendere esplicita la variabile di integrazione, potremo usare la notazione equivalente
  $ integral f(x) thin d x := integral f. $
] <def:integrale_riemann>

#theorem[monotonia dell'integrale][
  Siano $f,g: RR^n -> RR$ due funzioni limitate con supporto limitato.
  Se $f$ e $g$ sono R-integrabili si ha:
  $ f <= g => integral f <= integral g. $
]

#proof[
  Se $f <= g$, per ogni $N in NN$ e ogni $arrow(k) in ZZ^n$ si ha $sup f(Q_arrow(k)^N) <= sup g(Q_arrow(k)^N)$ da cui $S^N (f) <= S^N (g)$.
  Passando al limite per $N -> +infinity$ si ottiene $S^*(f) <= S^*(g)$ che è la tesi se $f$ e $g$ sono R-integrabili.
]

#theorem[linearità dell'integrale][
  Siano $f,g: RR^n -> RR$ funzioni limitate con supporto limitato.
  Se $f,g$ sono R-integrabili allora $f+g$ è R-integrabile e si ha
  $ integral (f+g) = integral f + integral g. $
  Se $f$ è R-integrabile e $c in RR$ è costante, anche $c f$ è R-integrabile e si ha
  $ integral c f = c integral f. $
]

#proof[
  Per ogni $arrow(k) in ZZ^n$ e ogni $N in NN$ si ha
  $ sup (f+g)(Q_arrow(k)^N) &<= sup f(Q_arrow(k)^N) + sup g(Q_arrow(k)^N) \
    inf (f+g)(Q_arrow(k)^N) &>= inf f(Q_arrow(k)^N) + inf g(Q_arrow(k)^N). $
  Dunque si ottiene
  $ S^N (f+g) <= S^N (f) + S^N (g), quad S_N (f+g) >= S_N (f) + S_N (g), $
  e passando al limite per $N -> +infinity$
  $ S_*(f) + S_*(g) <= S_*(f+g) <= S^*(f+g) <= S^*(f) + S^*(g). $
  Se $f$ e $g$ sono R-integrabili si ottiene dunque che anche $f+g$ è R-integrabile e inoltre $integral (f+g) = integral f + integral g$.

  Se $c >= 0$ si ha
  $ S^N (c f) = c S^N (f), quad S_N (c f) = c S_N (f) $
  e quindi se $f$ è R-integrabile si conclude che $c f$ è R-integrabile e $integral c f = c integral f$.

  Se $c = -1$ si osserva che per ogni $N in NN$, $arrow(k) in ZZ^n$, si ha
  $ sup_(Q_arrow(k)^N) (-f) = -inf_(Q_arrow(k)^N) f, quad inf_(Q_arrow(k)^N) (-f) = -sup_(Q_arrow(k)^N) f, $
  da cui
  $ S^N (-f) = -S_N (f), quad S_N (-f) = -S^N (f) $
  e quindi, per $N -> +infinity$ si ottiene
  $ S^*(-f) = -S_*(f), quad S_*(-f) = -S^*(f). $
  Se $f$ è R-integrabile deduciamo che anche $-f$ lo è e si ha $integral (-f) = -integral f$.

  Combinando i casi precedenti si ottiene il caso generale $c in RR$.
]

#theorem[proprietà di reticolo][
  Sia $f: RR^n -> RR$ una funzione limitata con supporto limitato.
  Se $f$ è R-integrabile allora anche $|f|$, $f^+$ e $f^-$ sono R-integrabili e si ha
  $ |integral f| <= integral |f| = integral f^+ + integral f^-, quad integral f = integral f^+ - integral f^-. $
]

#proof[
  Dalla proprietà generale
  $ ||f(arrow(x))| - |f(arrow(y))|| <= |f(arrow(x)) - f(arrow(y))| $
  si ottiene che per ogni $N in NN$, $arrow(k) in ZZ^n$, vale
  $ sup_(Q_arrow(k)^N) |f| - inf_(Q_arrow(k)^N) |f| <= sup_(Q_arrow(k)^N) f - inf_(Q_arrow(k)^N) f $
  e quindi
  $ S^N (|f|) - S_N (|f|) <= S^N (f) - S_N (f) $
  da cui, passando al limite per $N -> +infinity$,
  $ S^*(|f|) - S_*(|f|) <= S^*(f) - S_*(f) $
  per cui se $f$ è R-integrabile anche $|f|$ lo è.

  Osserviamo ora che $f^+ = (|f| + f) / 2$ e $f^- = (|f| - f) / 2$ e dunque per linearità se $f$ è R-integrabile avendo già dimostrato che anche $|f|$ è R-integrabile, si ottiene che pure $f^+$ e $f^-$ sono R-integrabili ed essendo $f = f^+ - f^-$, $|f| = f^+ + f^-$ si ottiene
  $ integral f = integral f^+ - integral f^-, quad integral |f| = integral f^+ + integral f^-. $
  Per la convessità del valore assoluto si ottiene infine
  $ |integral f| = |integral f^+ - integral f^-| <= |integral f^+| + |integral f^-| = integral f^+ + integral f^- = integral |f|. $
]

Vogliamo ora estendere la definizione di integrale alle funzioni non limitate o con supporto non limitato.
Faremo uso della funzione _caratteristica_ di un insieme $A subset RR^n$ cioè della funzione
$ 1_A : RR^n -> RR, quad 1_A (x) := cases(
  1 &text("se ") x in A,
  0 &text("se ") x in RR^n without A.
) $

#definition[integrale di Riemann generalizzato][
  Se $f: RR^n -> [0,+infinity]$ è una funzione (non negativa), per ogni $R>0$ possiamo definire il troncamento $f_R$
  $ f_R = (f and R) dot 1_([-R,R]^n). $
  La funzione $f_R$ è limitata ed ha supporto limitato.
  Se $f_R$ è Riemann-integrabile per ogni $R>0$ diremo che $f$ è localmente R-integrabile e visto che $R |-> f_R (arrow(x))$ è crescente possiamo definire
  $ integral f := lim_(R -> +infinity) integral f_R in [0,+infinity]. $
  Se $integral f < +infinity$ diremo che $f$ è R-integrabile (avendo supposto $f >= 0$).

  #footnote[
    Notiamo che se invece dei cubi $[-R,R]^n$ avessimo usato qualunque famiglia crescente di insiemi limitati $B_R$ tali che per ogni $r>0$ esiste $R$ con $B_R supset.eq [-r,r]^n$ la definizione non cambierebbe.
    Grazie alla monotonia dell'integrale (essendo $f >= 0$) il limite per $R -> +infinity$ sarebbe lo stesso.
    Inoltre il troncamento di $f$ ad altezza $R$ può anche essere fatto indipendentemente dal troncamento del dominio suddividendo il limite in due limiti consecutivi: uno per limitare il dominio ed uno per limitare il codominio. Grazie alla monotonia il procedimento darebbe lo stesso risultato (e non dipenderebbe dall'ordine in cui vengono fatte le operazioni).
  ]

  Se $f: RR^n -> RR$ possiamo scrivere $f = f^+ - f^-$ con $f^+, f^-$ funzioni non negative.
  Se $f^+$ e $f^-$ sono localmente R-integrabili e se $integral f^+$ e $integral f^-$ non sono entrambi infiniti possiamo definire
  $ integral f = integral f^+ - integral f^- in [-infinity, +infinity]. $
  Se $integral f$ è finito diremo che $f$ è R-integrabile.

  Si osservi che se $f = f^+ - f^-$ è integrabile allora anche $|f| = f^+ + f^-$ è integrabile, quindi l'integrabilità va intesa in senso _assoluto_.
]

#definition[
  Se $A subset RR^n$ e $f: A -> RR$ è una funzione qualunque, possiamo considerare l'estensione $f_A : RR^n -> RR$ definita da
  $ f_A (arrow(x)) = cases(
    f(arrow(x)) &text("se ") x in A,
    0 &text("altrimenti.")
  ) $
  Diremo che $f$ è localmente R-integrabile in $A$ se $f_A$ è localmente R-integrabile.
  Scriveremo:
  $ integral_A f = integral f_A $
  se $integral f_A$ è definito.
  Se inoltre $integral_A f$ è finito diremo che $f$ è R-integrabile su $A$.

  Volendo rendere esplicita la variabile di integrazione, potremo scrivere
  $ integral_A f(x) thin d x := integral_A f. $
]

#definition[
  Dato $E subset RR^n$ limitato potremo definire la misura (di Peano-Jordan) esterna e interna di $E$ come
  $ m^N (E) &:= S^N (1_E), & m^*(E) &:= S^*(1_E), \
    m_N (E) &:= S_N (1_E), & m_*(E) &:= S_*(1_E). $

  Dato $E subset RR^n$ qualunque, diremo che $E$ è _Peano-Jordan misurabile_ (PJ-misurabile) se la funzione caratteristica $1_E$ è localmente R-integrabile, ovvero se $m^*(E inter [-R,R]^n) = m_*(E inter [-R,R]^n)$ per ogni $R>0$.
  In tal caso definiamo la misura di $E$ come
  $ |E| := integral 1_E in [0,+infinity] = lim_(R -> +infinity) |E inter [-R,R]^n|. $
]

#remark[
  Visto che $sup_(Q_arrow(k)^N) 1_E = 1$ se $Q_arrow(k)^N$ tocca $E$ e $0$ altrimenti, mentre $inf_(Q_arrow(k)^N) 1_E = 1$ se $Q_arrow(k)^N$ è contenuto in $E$ e $0$ altrimenti, si osserva che:
  $ m^N (E) &= 2^(-n N) dot "#" {arrow(k) in ZZ^N : Q_arrow(k)^N inter E != emptyset}, \
    m_N (E) &= 2^(-n N) dot "#" {arrow(k) in ZZ^N : Q_arrow(k)^N subset E} $
  e dunque $m^N (E)$ è il volume dell'unione dei cubetti $Q_arrow(k)^N$ che ricoprono $E$ mentre $m_N (E)$ è il volume dell'unione dei cubetti $Q_arrow(k)^N$ che sono interamente contenuti in $E$.
]

#remark[caso $n=1$][
  Nel caso $n=1$ se $f: [a,b] -> RR$ è una funzione limitata, si osserva che la suddivisione in cubetti di lato $2^(-N)$ induce una partizione su $[a,b]$ e la definizione di Riemann-integrabilità data sopra coincide con la usuale Riemann-integrabilità definita tramite suddivisioni arbitrarie.

  Nel caso $f: (a,b) -> RR$ con $(a,b)$ non limitato oppure $f$ non limitata, la definizione data sopra corrisponde invece alla _assoluta convergenza_ dell'integrale improprio.

  #footnote[
    Non ha molto senso cercare di definire gli integrali impropri delle funzioni di più variabili con segno come facevamo per le funzioni di una variabile, cioè facendo i limiti degli integrali su insiemi limitati che tendono a coprire tutto lo spazio.
    Infatti tale definizione dipenderebbe in modo essenziale dalla forma degli insiemi scelti per invadere lo spazio.
    Nel caso poi la funzione non fosse limitata potrebbe anche dipendere dalla velocità con cui vengono fatti i troncamenti nel dominio rispetto al codominio.
    Solo richiedendo l'integrabilità separatamente di parte positiva e parte negativa si ottiene ad esempio una definizione che sia stabile per cambio di variabile.
  ]
]

#exercise[misurabilità dei rettangoli cartesiani][
  Dati $arrow(a), arrow(b) in RR^n$ con $a_k <= b_k$ per ogni $k=1, dots, n$, il rettangolo cartesiano
  $ R(arrow(a), arrow(b)) = [a_1,b_1] times dots times [a_n,b_n] $
  è PJ-misurabile e si ha
  $ |R(arrow(a), arrow(b))| = product_(k=1)^n (b_k - a_k). $

  In particolare ogni cubetto $Q_arrow(k)^N$ è PJ-misurabile e si ha $|Q_arrow(k)^N| = 2^(-n N)$.
] <ex:misura_rettangolo>

#proof[
  Osserviamo che
  $ Q_arrow(k)^N = [2^(-N) k_1, 2^(-N)(k_1+1)] times dots times [2^(-N) k_n, 2^(-N)(k_n+1)] $
  è un rettangolo cartesiano.
  Fissato $N$ si ha $Q_arrow(k)^N subset R(arrow(a), arrow(b))$ per tutti i $arrow(k) = (k_1, dots, k_n) in ZZ^n$ tali che
  $ 2^N a_j <= k_j <= 2^N b_j + 1 quad text("per ogni ") j=1, dots, n. $
  Dunque il numero di cubetti $Q_arrow(k)^N$ contenuti in $R(arrow(a), arrow(b))$ è non inferiore a
  $ product_(j=1)^n (2^N (b_j - a_j) - 3) $
  e quindi
  $ m_N (R(arrow(a), arrow(b)))
      &>= 2^(-n N) product_(j=1)^n (2^N (b_j - a_j) - 3) \
      &= product_(j=1)^n (b_j - a_j - 3 dot 2^(-N))
      -> product_(j=1)^n (b_j - a_j) quad text("per ") N -> +infinity. $
  In maniera analoga si dimostra che
  $ m^N (R(arrow(a), arrow(b)))
      &<= product_(j=1)^n (b_j - a_j + 3 dot 2^(-N))
      -> product_(j=1)^n (b_j - a_j) quad text("per ") N -> +infinity. $
  Si ottiene dunque il risultato voluto.
]

#exercise[gli iperpiani hanno misura nulla][
  Se $H subset RR^n$ è un iperpiano $(n-1)$-dimensionale, allora $H$ ha misura nulla.
] <ex:iperpiani_misura_nulla>

#proof[
  È sufficiente dimostrare che $H inter [0,1]^n$ ha misura nulla.
  Per fare questo basta verificare che fissato $N in NN$ il numero di cubetti $Q_arrow(k)^N subset [0,1]^n$ che toccano $H$ è al più $2 dot 2^(N(n-1))$ (si può supporre che la normale ad $H$ definisca un angolo minore di 45 gradi con l'asse $x_n$ e osservare che la proiezione dei cubi su $RR^(n-1)$ può far sovrapporre al più due dei cubi che toccano $H$).
  Dunque
  $ m^N (H inter [0,1]^n) <= 2 dot 2^(N(n-1)) dot 2^(-n N) = 2 dot 2^(-N) -> 0 quad text("per ") N -> +infinity. $
]

#theorem[algebra dei misurabili][
  Se $E,F subset RR^n$ sono PJ-misurabili allora anche $bar(E)$, $partial E$, $E without F$, $E inter F$ ed $E union F$ sono PJ-misurabili.
  Inoltre si ha
  $ |E union F| + |E inter F| = |E| + |F|, quad |partial E| = 0. $

  #footnote[
    La misura di Peano-Jordan è una funzione di insieme _additiva_, nel senso che l'unione di due insiemi misurabili è misurabile e, se gli insiemi sono disgiunti, la misura dell'unione è uguale alla somma delle misure dei due insiemi.
    Ovviamente se questa proprietà vale per l'unione di due insiemi, vale anche per l'unione di un numero finito di insiemi.
    Si dice che una funzione di insieme è $sigma$-additiva se la stessa proprietà vale per una unione numerabile di insiemi.
    La misura di Peano-Jordan non è $sigma$-additiva, perché ad esempio $QQ inter [0,1]$ non è misurabile ma è l'unione numerabile di punti, ciascuno dei quali ha misura PJ-nulla.
    Una estensione $sigma$-additiva della misura di Peano-Jordan è la misura di Lebesgue.
    Si scopre che un insieme è PJ-misurabile se e solo se la sua frontiera ha misura di Lebesgue nulla.
    Ma esistono insiemi misurabili per Lebesgue la cui frontiera non ha misura di Lebesgue nulla (come ad esempio il già menzionato $QQ inter [0,1]$ che ha misura nulla ma la cui frontiera è $[0,1]$ che ha misura $1$).
  ]
]

#proof[
  Per ottenere la misurabilità di $E without F$ e di $E inter F$, basta osservare che
  $ 1_(E without F) &= (1_E - 1_F)^+ \
    1_(E inter F) &= 1_E - 1_(E without F) \
    1_(E union F) &= 1_F + 1_(E without F) $
  e usare le proprietà di reticolo.
  Osservando poi che
  $ 1_(E union F) + 1_(E inter F) = 1_E + 1_F $
  si ottiene la formula
  $ |E union F| + |E inter F| = |E| + |F|. $

  Supponiamo ora che $E$ sia limitato e dimostriamo che $partial E$ ha misura nulla.
  Bisogna osservare che $sup 1_(partial E)(Q_arrow(k)^N) = 1$ significa che $partial E inter Q_arrow(k)^N != emptyset$.
  Ma allora c'è un punto $arrow(x) in Q_arrow(k)^N$ tale che ogni intorno di $arrow(x)$ contiene sia punti di $E$ che punti di $RR^n without E$.
  Se il punto $arrow(x)$ è interno a $Q_arrow(k)^N$ si ha
  $ sup 1_(partial E)(Q_arrow(k)^N) > inf 1_(partial E)(Q_arrow(k)^N). $
  Se ciò non fosse vero significa che $Q_arrow(k)^N$ è interamente contenuto in $E$ o in $RR^n without E$ e che $arrow(x)$ sta sulla frontiera del cubetto.
  Ma allora la disuguaglianza precedente risulta valida per un cubetto $Q_arrow(k')^N$ adiacente a $Q_arrow(k)^N$.
  Dunque si deve avere
  $ m^N (partial E) <= 3^n (m^N (E) - m_N (E)) $
  (in quanto $3^n - 1$ è il numero di cubetti adiacenti ad un cubetto fissato)
  e per $N -> +infinity$ si ottiene
  $ m^*(partial E) <= 3^n (m^*(E) - m_*(E)) = 0, quad m_*(partial E) >= 0. $
  Dunque $partial E$ è misurabile e $|partial E| = 0$.

  Se $E$ non è limitato si ripete l'osservazione precedente alle intersezioni $E inter [-R,R]^n$ per ottenere lo stesso risultato.

  Visto che $bar(A) = A union partial A$, se $A$ è misurabile anche $bar(A)$ è misurabile e si ha $|bar(A)| = |A without partial A| + |partial A| = |A without partial A| <= |A| <= |bar(A)|$, da cui $|bar(A)| = |A|$.
]

#theorem[significato geometrico dell'integrale][
  Se $f: A subset RR^n -> RR$ definiamo la parte positiva dell'epigrafico di $f$ come:
  $ E_f = {(arrow(x),y) in A times RR : 0 <= y <= f(arrow(x))} subset RR^(n+1). $
  Se $A subset RR^n$ è PJ-misurabile ed $f$ è localmente integrabile allora $E_(f^+)$ ed $E_(f^-)$ sono localmente misurabili e, se non hanno entrambi misura infinita, si ha
  $ integral_A f = |E_(f^+)| - |E_(f^-)|. $
] <th:significato-geometrico-integrale>

#proof[
  Supponiamo $f >= 0$, $f$ limitata, $A$ limitato e PJ-misurabile.
  In tal caso si può osservare che per ogni cubetto $n$-dimensionale che tocca la base $A$, i cubetti $(n+1)$-dimensionali che coprono il grafico di $f$ sono al massimo due in più rispetto all'altezza della colonna, ovvero del $sup$ di $f$ sul cubetto base.
  Per i cubetti interni si ha invece l'opposto. Cioè:
  $ 0 &<= m^N (E_(f^+)) - S^N (f) <= 2 dot 2^(-N) m^N (A), \
    0 &<= S_N (f) - m_N (E_(f^+)) <= 2 dot 2^(-N) m^N (A) $
  e, per $N -> +infinity$, si ottiene
  $ 0 &<= m^*(E_(f^+)) - S^*(f) <= 0 dot m^*(A), \
    0 &<= S_*(f) - m_*(E_(f^+)) <= 0 dot m^*(A), $
  ovvero $|E_(f^+)| = integral f$, come volevamo dimostrare.

  Gli altri casi vengono di conseguenza separando parte positiva e parte negativa e passando al limite nei troncamenti.
]

#theorem[integrabilità delle funzioni continue][
  Sia $A subset RR^n$ un insieme chiuso PJ-misurabile e $f: A -> RR$ una funzione continua. Allora $f$ è localmente R-integrabile.
  Se inoltre $|A| < +infinity$ e $f$ è limitata, allora $f$ è R-integrabile.
] <th:continua_integrabile>

#proof[
  _Passo 1: supponiamo $A$ compatto PJ-misurabile, $f$ continua, limitata, non negativa._
  Per il teorema di Weierstrass esiste $M>0$ tale che $0 <= f(x) <= M$ per ogni $arrow(x) in A$.
  Fissiamo $epsilon>0$.
  Per il teorema di Heine-Cantor esiste $delta>0$ tale che se $arrow(x)_1, arrow(x)_2 in A$ e $|arrow(x)_1 - arrow(x)_2| < delta$ allora $|f(arrow(x)_1) - f(arrow(x)_2)| < epsilon$.
  Scegliamo $N in NN$ abbastanza grande in modo che si abbia $2^(-N) sqrt(n) < delta$ e in modo che $m^N (partial A) < epsilon$.
  Allora si ha
  $ S^N (f) - S_N (f) = 2^(-n N) sum_(arrow(k)) (max f(Q_arrow(k)^N) - min f(Q_arrow(k)^N)) <= 2^(-n N) epsilon m^N (A). $
  Visto che $f$ è limitata e $A$ è limitato, $S^N (f)$ è limitata in $N$ e facendo tendere $N -> +infinity$ si ottiene dunque $S^*(f) - S_*(f) <= 0$ da cui $S^*(f) = S_*(f)$ come volevamo dimostrare.

  _Passo 2: supponiamo $A$ chiuso PJ-misurabile, $f$ continua, non negativa._
  Si applica il passo precedente alla troncata $f_R$.

  _Passo 3: caso generale._
  Si applica il passo precedente alle parti positiva e negativa $f^+$, $f^-$ di $f$.

  _Passo 4: supponiamo $|A| < +infinity$ e $f$ limitata._
  In tal caso esiste $M$ tale che $|f(arrow(x))| <= M$ per ogni $x in A$.
  Per la monotonia dell'integrale si ottiene
  $ |integral_A f| <= integral_A |f| <= integral_A M = M dot |A| < +infinity. $
]

#theorem[Fubini-Tonelli][
  Sia $f: RR^n times RR^m -> RR$ Riemann integrabile tale che per ogni $arrow(x) in RR^n$ la funzione $arrow(y) |-> f(arrow(x), arrow(y))$ risulti anch'essa R-integrabile su $RR^m$.
  Allora
  $ integral_(RR^(n+m)) f = integral_(RR^n) (integral_(RR^m) f(arrow(x), arrow(y)) thin d arrow(y)) thin d arrow(x). $
]

#proof[
  Supponiamo che $f$ sia una funzione R-integrabile, limitata con supporto limitato.
  Allora posto
  $ g(arrow(x)) = integral f(arrow(x), arrow(y)) thin d arrow(y) $
  si ha
  $ S^N (g)
      &= 2^(-n N) sum_(arrow(k) in ZZ^n) sup_(arrow(x) in Q_arrow(k)^N) integral f(arrow(x), arrow(y)) thin d y \
      &<= 2^(-n N) sum_(arrow(k) in ZZ^n) sup_(arrow(x) in Q_arrow(k)^N) S^N (f(arrow(x), dot)) \
      &<= 2^(-n N) sum_(arrow(k) in ZZ^n) sup_(arrow(x) in Q_arrow(k)^N) 2^(-m N) sum_(arrow(j) in ZZ^m) sup_(arrow(y) in Q_arrow(j)^N) f(arrow(x), arrow(y)) \
      &<= 2^(-(n+m)N) sum_(arrow(k) in ZZ^n) sum_(arrow(j) in ZZ^m) sup f(Q_arrow(k)^N times Q_arrow(j)^N) \
      &= S^N (f) $
  ed analogamente si trova $S_N (g) >= S_N (f)$.

  Passando al limite otteniamo quindi
  $ S_*(f) <= S_*(g) <= S^*(g) <= S^*(f) $
  e dunque se $f$ è integrabile (in $n+m$ variabili) anche $g$ è integrabile (in $n$ variabili) e risulta $integral f = integral g$, come volevamo dimostrare.

  Gli altri casi si ottengono di conseguenza.
]

#theorem[principio di Cavalieri][
  Sia $E subset RR^n times RR^m$ un insieme PJ-misurabile tale che per ogni $arrow(x) in RR^n$ la sezione
  $ E_arrow(x) = {arrow(y) in RR^m : (arrow(x), arrow(y)) in E} $
  sia PJ-misurabile in $RR^m$.
  Allora
  $ |E| = integral_(RR^n) |E_arrow(x)| thin d arrow(x). $

  In particolare se $E,F subset RR^n times RR^m$ sono PJ-misurabili e per ogni $x in RR^n$ si ha $|E_arrow(x)| = |F_arrow(x)|$, allora $|E| = |F|$.
] <th:cavalieri>

#proof[
  Si applica il teorema di Fubini-Tonelli alla funzione caratteristica $1_E : RR^n times RR^m -> RR$:
  $ |E| &= integral_(RR^n times RR^m) 1_E \
      &= integral_(RR^n) (integral_(RR^m) 1_E (arrow(x), arrow(y)) thin d arrow(y)) thin d arrow(x) \
      &= integral_(RR^n) (integral_(RR^m) 1_(E_arrow(x))(arrow(y)) thin d arrow(y)) thin d arrow(x) \
      &= integral_(RR^n) |E_arrow(x)| thin d arrow(x). $
]

= La formula del cambiamento di variabile

#lemma[disuguaglianza di Lagrange][
  Sia $Omega$ un aperto di $RR^n$ e sia $f in C^1(Omega, RR)$.
  Se $arrow(x), arrow(y) in E$ e $[arrow(x), arrow(y)]$ (il segmento che congiunge $arrow(x)$ e $arrow(y)$) è contenuto in $Omega$, allora si ha
  $ |f(arrow(x)) - f(arrow(y))| <= sup_(arrow(z) in [arrow(x), arrow(y)]) norm(D f(arrow(z))) dot |arrow(x) - arrow(y)|. $
] <lm:disuguaglianza_lagrange>

#proof[
  Sia $phi(t) = f(arrow(y) + t(arrow(x) - arrow(y)))$.
  Allora $phi$ è di classe $C^1$ e si ha
  $ |f(arrow(x)) - f(arrow(y))|
      &= |phi(1) - phi(0)| \
      &= |integral_0^1 phi'(t) thin d t| \
      &<= integral_0^1 |D f(arrow(y) + t(arrow(x) - arrow(y)))(arrow(x) - arrow(y))| thin d t \
      &<= sup_(arrow(z) in [arrow(x), arrow(y)]) norm(D f(arrow(z))) dot |arrow(x) - arrow(y)|. $
]

#lemma[condizione di lipschitz per le funzioni $C^1$][
  Sia $Omega$ un aperto di $RR^n$ e sia $f in C^1(Omega, RR^m)$.
  Per ogni compatto $K subset Omega$ la funzione $f$ è lipschitziana su $K$.
  Ovvero esiste $L$ (dipendente da $K$) tale che per ogni $arrow(x), arrow(y) in K$ si ha
  $ |f(arrow(x)) - f(arrow(y))| <= L |arrow(x) - arrow(y)|. $
] <lm:lipschitz_C1>

#proof[
  Visto che $K$ è compatto esiste $delta>0$ tale che per ogni $x in K$ si ha $B_(2 delta)(x) subset Omega$ (è sufficiente osservare che la funzione distanza da $partial Omega$ è continua e positiva su $K$ dunque ha un minimo positivo per il teorema di Weierstrass).
  Sia $K_delta = {arrow(z) in RR^n : op("dist")(arrow(z), K) <= delta}$.
  Possiamo definire $M = max({|f(arrow(x))| : x in K_delta})$ e $lambda = max({norm(D f(arrow(x))) : arrow(x) in K_delta})$, in quanto $K_delta$ è compatto e sia $|f|$ che $norm(D f)$ sono continue.

  Ora se $arrow(x), arrow(y) in K$ e $|arrow(x) - arrow(y)| < delta$ la palla centrata in $arrow(x)$ di raggio $delta$ contiene anche $arrow(y)$ e dunque il segmento $[arrow(x), arrow(y)]$ è contenuto in $K_delta subset Omega$.
  Grazie al lemma @lm:disuguaglianza_lagrange si ottiene dunque
  $ |f(arrow(y)) - f(arrow(x))| <= lambda |arrow(y) - arrow(x)|. $

  Se invece $arrow(x), arrow(y) in K$ e $|arrow(x) - arrow(y)| >= delta$ allora, banalmente,
  $ |f(arrow(y)) - f(arrow(x))| <= 2 M <= (2M)/delta |arrow(y) - arrow(x)|. $

  Prendendo $L = max({lambda, (2M)/delta})$ si ottiene dunque che $f$ è $L$-lipschitziana su $K$.
]

#lemma[misura delle immagini lipschitziane][
  Sia $E subset RR^n$ ed $phi: E -> RR^n$ una funzione $L$-lipschitziana.
  Allora
  $ m^*(f(E)) <= (sqrt(n) L)^n m^*(E). $
  (dove $m^*$ è la misura esterna di Peano-Jordan).
] <lm:misura_lipschitz>

#proof[
  Per $A subset RR^n$ definiamo il diametro di $A$ come
  $ op("diam") A := sup{|arrow(x) - arrow(y)| : arrow(x), arrow(y) in A}. $
  È facile verificare che se $phi$ è $L$-lipschitziana allora $op("diam") phi(A) <= L op("diam") A$ per ogni $A subset RR^n$.
  Consideriamo un cubetto diadico $Q_arrow(k)^N$ che tocca $E$.
  Il diametro di $Q_arrow(k)^N$ è $sqrt(n) dot 2^(-N)$ e dunque il diametro di $phi(Q_arrow(k)^N inter E)$ è al più $sqrt(n) L dot 2^(-N)$.
  Significa che $phi(Q_arrow(k)^N inter E)$ è contenuto in un cubo di lato $sqrt(n) L dot 2^(-N)$ che ha misura $(sqrt(n) L)^n dot 2^(-n N)$.
  È immediato verificare che $m^N (A union B) <= m^N (A) + m^N (B)$ e quindi $m^*(A union B) <= m^*(A) + m^*(B)$.
  Dunque si ottiene:
  $ m^*(phi(E))
      &<= sum_(Q_arrow(k)^N inter E != emptyset) m^*(phi(Q_arrow(k)^N inter E)) \
      &<= sum_(Q_arrow(k)^N inter E != emptyset) (sqrt(n) L)^n dot 2^(-n N) \
      &= (sqrt(n) L)^n m^N (E). $
  Passando al limite per $N -> +infinity$ si ottiene il risultato voluto.
]

#lemma[misurabilità delle immagini $C^1$][
  Sia $Omega$ un aperto di $RR^n$ e sia $phi in C^1(Omega, RR^n)$ tale che $det D phi(arrow(x)) != 0$ per ogni $arrow(x) in Omega$.
  Allora $phi(Omega)$ è un aperto di $RR^n$ e se $E subset.double Omega$ (significa che $bar(E)$ è compatto e contenuto in $Omega$) si ha $phi(E) subset.double phi(Omega)$, e $partial(phi(E)) subset phi(partial E)$.
  Se, inoltre, $E$ è PJ-misurabile anche $phi(E)$ è PJ-misurabile.
] <lm:misurabile_C1>

#proof[
  Per il teorema di invertibilità locale se $arrow(x) in Omega$ essendo $det D phi(arrow(x)) != 0$ esiste un intorno $U$ di $arrow(x)$ tale che $phi$ è un diffeomorfismo da $U$ a $phi(U)$.
  In particolare $phi(U)$ è un intorno di $phi(arrow(x))$ e dunque $phi$ manda punti interni ad $E$ in punti interni a $phi(E)$.
  D'altra parte $partial(phi(E)) subset bar(phi(E)) subset phi(bar(E))$ in quanto $bar(E)$ è compatto e $phi$, essendo continua, manda compatti in compatti.
  Significa che i punti di $partial(phi(E))$ possono solo provenire da $partial E$ e dunque $partial(phi(E)) subset phi(partial E)$.

  Se $E$ è PJ-misurabile allora $partial E$ ha misura nulla.
  Per il lemma @lm:lipschitz_C1 la funzione $phi$ è lipschitziana su $bar(E)$ e per il lemma @lm:misura_lipschitz $phi(partial E)$ ha misura nulla.
  Significa che $phi(E)$ è PJ-misurabile.
]

Una _matrice di permutazione_ è una matrice che rappresenta una applicazione lineare $L: RR^n -> RR^n$ che permuta gli elementi della base canonica: $L (x_1, dots, x_n) = (x_(sigma(1)), dots, x_(sigma(n)))$.
Una _mossa elementare_ su $RR^n$ è una applicazione lineare $L$ che aggiunge ad una componente del vettore $arrow(x)$ un multiplo fissato di un'altra coordinata:
$ L(x_1, dots, x_n) = (x_1, dots, x_j + lambda x_k, dots, x_n) $
con $k != j$.
Chiamiamo _matrice elementare_ una matrice che si ottiene come prodotto di matrici di permutazione e mosse elementari.
Visto che le matrici di permutazione hanno determinante $+- 1$ e le mosse elementari hanno sempre determinante $1$, tutte le matrici elementari hanno determinante $+- 1$.

#definition[matrice elementare][
  Dati $k,j in {1, dots, n}$ con $k != j$ e $alpha in RR$ consideriamo la matrice $M=M(k,j,alpha)$ definita sulla base canonica $e_1, dots, e_n$ da
  $ M e_i = cases( e_i &text("se ") i != k, e_i + alpha e_j &text("se ") i=k. ) $
  Ovvero $M$ è una matrice che si ottiene mettendo il valore $alpha$ nella matrice identità in una posizione dove c'era uno zero:
  $ M = mat(
    1, 0, dots, 0, dots, 0;
    0, 1, dots, alpha, dots, 0;
    dots.v, dots.v, dots.down, dots.v, dots.down, dots.v;
    0, 0, dots, 1, dots, 0;
    dots.v, dots.v, dots.down, dots.v, dots.down, dots.v;
    0, 0, dots, 0, dots, 1
  ). $
  In altre parole la trasformazione lineare associata ad $M$ agisce sullo spazio generato dai due vettori $e_j$ ed $e_k$ come la matrice $2 times 2$
  $ mat(1, alpha; 0, 1) $
  e come l'identità su tutti gli altri vettori della base canonica.

  Quando la matrice $M$ viene moltiplicata a sinistra di una matrice $A$ di dimensione $m times n$ si ottiene una matrice $M A$ che è la matrice ottenuta da $A$ aggiungendo $alpha$ volte la $j$-esima riga di $A$ alla $k$-esima riga di $A$.

  Viceversa quando la matrice $M$ viene moltiplicata a destra ad una matrice $A$ di dimensione $m times n$ si ottiene una matrice $A M$ che si ottiene da $A$ aggiungendo $alpha$ volte la $k$-esima colonna di $A$ alla $j$-esima colonna di $A$.

  Una _matrice di permutazione_ è una matrice $M$ che permuta gli elementi della base canonica.
  Più precisamente data una bigezione $sigma: {1, dots, n} -> {1, dots, n}$, si ha $M(e_k) = e_(sigma(k))$ per ogni $k=1, dots, n$.

  Una _matrice elementare_ è una matrice che si ottiene come prodotto di matrici di permutazione e mosse elementari.
  Le matrici elementari sono banalmente invertibili ed hanno tutte determinante $+- 1$.
]

#theorem[riduzione a scala di Gauss][
  Sia $M$ una matrice $m times n$ qualunque.

  Allora esistono $A$ matrice elementare $m times m$, e $B$ matrice elementare $n times n$ tali che
  $ A M B^t = Delta $
  è una matrice diagonale.
] <th:riduzione_gauss>

#theorem[significato geometrico del determinante][
  Sia $L: RR^n -> RR^n$ una applicazione lineare affine
  $ L(arrow(x)) = M arrow(x) + arrow(q). $
  Allora se $E subset RR^n$ è PJ-misurabile anche $L(E)$ è PJ-misurabile e si ha
  $ |L(E)| = |det M| dot |E|. $ <eq:geometria_determinante>
] <th:geometria_determinante>

#proof[
  _Osservazione 1._
  Fissato $L$ se dimostriamo la @eq:geometria_determinante su ogni cubetto $Q_arrow(k)^N$, allora approssimando opportunamente $E$ dall'interno e dall'esterno con cubetti di taglia $2^(-N)$, e usando l'additività della misura, si ottiene
  $ |det M| dot m_N (L(E)) <= m^N (L(E)) <= |det M| dot m^N (E). $
  Passando al limite per $N -> +infinity$ si ottiene il risultato voluto con tale $L$.

  _Osservazione 2._
  Se per ogni $E$ l'equazione @eq:geometria_determinante è verificata per $L_1$ e per $L_2$ allora è verificata anche per $L_1 compose L_2$.
  Infatti
  $ |L_1 (L_2 (E))| = |det M_1| dot |L_2 (E)| = |det M_1| dot |det M_2| dot |E| = |det(M_1 M_2)| dot |E|. $

  _Passo 0: supponiamo $M$ sia la matrice identità._
  In tal caso $L$ è una traslazione e dunque $L(E) = E + arrow(q)$.
  Se $E$ è un cubetto $Q_arrow(k)^N$ allora $L(E)$ è un cubetto di lato $2^(-N)$ allineato agli assi coordinati.
  Dunque $|L(E)| = 2^(-n N) = |E|$ per l'esercizio @ex:misura_rettangolo.

  _Passo 1: supponiamo che $M$ sia una matrice di permutazione (cioè $M(e_k) = e_(sigma(k))$ per una qualche permutazione $sigma$ di $\{1, dots, n\}$)._
  Per l'osservazione possiamo supporre che $E$ sia un cubetto $Q_arrow(k)^N$.
  In tal caso il risultato è immediato in quanto $L(Q_arrow(k)^N) = Q_(M(arrow(k)))^N + arrow(q)$, dunque $|L(E)| = 2^(-n N) = |E|$ (per l'esercizio @ex:misura_rettangolo).
  Visto che $|det M| = 1$ questo è il risultato voluto.

  _Passo 2: supponiamo che $M$ sia una matrice diagonale (cioè $M(e_k) = lambda_k e_k$ per ogni $k=1, dots, n$) e $arrow(q)=0$._
  Supponendo che $E$ sia un rettangolo $[a_1,b_1] times dots times [a_n,b_n]$, si osserva che
  $ L(E) = product_(k=1)^n [lambda_k a_k, lambda_k b_k] $
  (se $lambda_k < 0$ gli estremi del rettangolo sono invertiti).
  Dunque per l'esercizio @ex:misura_rettangolo si ha
  $ |L(E)| = product_(k=1)^n |lambda_k| dot |b_k-a_k| = |product_(k=1)^n lambda_k| dot product_(k=1)^n |b_k - a_k| = |det M| dot |E|. $

  _Passo 3: supponiamo che $L$ sia della forma $L(x_1, dots, x_n) = (x_1, dots, x_(n-2), x_(n-1) + lambda x_n, x_n)$._
  In questo caso $L(Q_arrow(k)^N)$ è un parallelepipedo con stessa base e stessa altezza di $Q_arrow(k)^N$ e dunque, per il teorema @th:cavalieri di Cavalieri si ottiene $|L(Q_arrow(k)^N)| = |Q_arrow(k)^N|$.
  Chiaramente si ha $det L = 1$ e quindi questo è quanto volevamo dimostrare.
  Più precisamente si può osservare che posto, per $t in RR$,
  $ (L(Q_arrow(k)^N))_t = {arrow(y) in RR^(n-1) : (arrow(y),t) in L(Q_arrow(k)^N)}, $
  e posto $arrow(k)' = (k_1, dots, k_(n-1)) in ZZ^(n-1)$ si ha $(arrow(y),t) in L(Q_arrow(k)^N)$ se e solo se $t in [2^(-N) k_n, 2^(-N)(k_n+1)]$ e $arrow(y) in Q_arrow(k')^N + lambda t e_(n-1)$.
  Dunque
  $ (L(Q_arrow(k)^N))_t = Q_arrow(k')^N + t e_(n-1) $
  e $|(L(Q_arrow(k)^N))_t| = 2^(-(n-1)N)$.
  Dunque, per il principio di Cavalieri, si ottiene
  $ |L(Q_arrow(k)^N)| = integral_(2^(-N) k_n)^(2^(-N)(k_n+1)) |(L(Q_arrow(k)^N))_t| thin d t = 2^(-N) dot 2^(-(n-1)N) = 2^(-n N) = |Q_arrow(k)^N|. $

  _Caso generale._
  Grazie al teorema @th:riduzione_gauss di riduzione a scala di Gauss, possiamo trovare $A,B$ matrici elementari tali che $A M B^t$ sia una matrice diagonale $Delta$.
  Ovvero
  $ M = A^(-1) Delta (B^t)^(-1). $
  Visto che abbiamo già dimostrato che l'equazione @eq:geometria_determinante è verificata per $A^(-1)$, per $Delta$ e per $(B^t)^(-1)$, dall'osservazione 2 si ottiene che è verificata anche per $M$ e dunque per $L$.
]

#theorem[formula dell'area][
  Sia $Omega$ un aperto di $RR^n$, $phi: Omega -> RR^n$ una funzione di classe $C^1$, iniettiva, e tale che $det D phi(arrow(x)) != 0$ per ogni $arrow(x) in Omega$.

  Allora per ogni $E subset.double Omega$, $E$ PJ-misurabile si ha che $phi(E)$ è PJ-misurabile e
  $ |phi(E)| = integral_E |det D phi|. $ <eq:formula-area>
] <th:formula-area>

#proof[
  _Passo 1 (misurabilità)._
  Il lemma @lm:misurabile_C1 ci dice che $phi(E)$ è PJ-misurabile.

  #figure(
    image("../../figure/cubo-interno.png", height: 2cm),
  )

  _Passo 2 (lemma del cubo interno/esterno): se $E = [0,1]^n subset Omega$ ed esiste $epsilon in (0, 1/4)$ tale che_
  $ |phi(arrow(x)) - arrow(x)| <= epsilon, quad forall arrow(x) in E, $
  _allora_
  $ (1-2 epsilon)^n <= |phi(E)| <= (1+2 epsilon)^n. $
  Chiaramente
  $ phi(E) subset [-epsilon, 1+epsilon]^n $
  perché ogni punto di $E$ viene spostato al massimo di $epsilon$.
  Quindi si ottiene, per monotonia della misura, $|phi(E)| <= (1+2 epsilon)^n$.
  Per ottenere l'altra disuguaglianza $|phi(E)| >= (1-2 epsilon)^n$ basterà dimostrare che vale anche l'inclusione opposta $phi(E) supset (epsilon, 1-epsilon)^n$.

  Supponiamo per assurdo che esista $arrow(y) in (epsilon, 1-epsilon)^n without phi(E)$.
  Consideriamo il punto $arrow(p) = (1/2, dots, 1/2)$ centro del cubo $E$ e sia $arrow(q) = phi(arrow(p))$ la sua immagine.
  Visto che $|arrow(q) - arrow(p)| = |phi(arrow(p)) - arrow(p)| <= epsilon$ e $epsilon <= 1/4$ possiamo garantire che $arrow(q) in (epsilon, 1-epsilon)^n$.
  Dunque l'intero segmento $[arrow(q), arrow(y)]$ è contenuto in $(epsilon, 1-epsilon)^n$ essendo quest'ultimo un convesso.
  Visto che $arrow(q) in phi(E)$ mentre $arrow(y) not in phi(E)$, deve esistere un punto $arrow(z) in [arrow(q), arrow(y)] inter partial phi(E)$ (esercizio @ex:punto-di-frontiera).
  Ma abbiamo già mostrato (Passo 1) che $partial phi(E) subset phi(partial E)$ dunque $arrow(z) = phi(arrow(x))$ con $arrow(x) in partial E$.
  Ma allora $|arrow(z) - arrow(x)| = |phi(arrow(x)) - arrow(x)| <= epsilon$ e dunque $arrow(z) not in (epsilon, 1-epsilon)^n$, contraddicendo $arrow(z) in [arrow(q), arrow(y)] subset (epsilon, 1-epsilon)^n$.

  _Passo 3: formula dell'area._
  Sia $epsilon>0$ fissato.
  Sia $A$ un aperto tale che $E subset.double A subset.double Omega$.
  Dato $N in NN$ definiamo $E^N$ l'unione dei cubetti diadici $Q_arrow(k)^N$ che intersecano $E$ e $E_N$ l'unione dei cubetti diadici $Q_arrow(k)^N$ che sono contenuti in $E$.
  Sia $L = max_(arrow(x) in bar(A)) norm(D phi(arrow(x)))$.
  Affermiamo che è possibile scegliere $N$ sufficientemente grande affinché:
  $ E^N subset A, $ <eq:shme1>
  $ 0 <= |E without E_N| <= epsilon / (sqrt(n) L)^n, $ <eq:shme3>
  $ |arrow(x) - arrow(x)'| <= sqrt(n) 2^(-N) => norm((D phi(arrow(x)))^(-1) D phi(arrow(x)') - I) <= epsilon / sqrt(n). $ <eq:shme2>
  La condizione @eq:shme2 si ottiene grazie all'uniforme continuità di $D phi$ su $bar(A)$.

  Fissato un cubetto $Q_arrow(k)^N subset E$ consideriamo la trasformazione $psi$ che prende il cubo $[0,1]^n$ lo manda tramite un riscalamento in $Q_arrow(k)^N$, applica $phi$ e poi riporta l'immagine in $[0,1]^n$ tramite l'inversa di una mappa affine che approssima $phi$ e un riscalamento inverso.
  Precisamente $psi: [0,1]^n -> RR^n$ è definita da
  $ psi(arrow(x)) = 2^N (D phi(2^(-N) arrow(k)))^(-1) [phi(2^(-N)(arrow(x) + arrow(k))) - phi(2^(-N) arrow(k))]. $
  Un calcolo mostra che
  $ psi(0) = 0, quad D psi(arrow(x)) = (D phi(2^(-N) arrow(k)))^(-1) D phi(2^(-N)(arrow(x) + arrow(k))) $
  e dunque, per la condizione @eq:shme2,
  $ norm(D psi(arrow(x)) - I) <= epsilon / sqrt(n). $
  Applicando il lemma @lm:disuguaglianza_lagrange alla funzione $psi(x)-x$ si ottiene che
  $ |psi(arrow(x)) - arrow(x)| = |(psi(arrow(x)) - arrow(x)) - (psi(0) - 0)| <= epsilon / sqrt(n) |arrow(x)| <= epsilon quad forall arrow(x) in [0,1]^n. $
  Il passo precedente ci dice allora che
  $ (1-epsilon)^n <= |psi([0,1]^n)| <= (1+epsilon)^n. $
  Visto che, a meno di una traslazione, $phi(Q_arrow(k)^N)$ coincide con $2^(-N) D phi(2^(-N) arrow(k)) [psi([0,1]^n)]$, per il teorema @th:geometria_determinante si ottiene $|phi(Q_arrow(k)^N)| = 2^(-n N) |det D phi(2^(-N) arrow(k))| dot |psi([0,1]^n)|$ e dunque
  $ (1-epsilon)^n <= |phi(Q_arrow(k)^N)| / (|Q_arrow(k)^N| dot |det D phi(2^(-N) arrow(k))|) <= (1+epsilon)^n. $
  Visto che
  $ inf_(Q_arrow(k)^N) |det D phi| <= |det D phi(2^(-N) arrow(k))| <= sup_(Q_arrow(k)^N) |det D phi| $
  si ottiene
  $ (1-epsilon)^n S_N (|det D phi|) <= sum_(Q_arrow(k)^N subset E) |phi(Q_arrow(k)^N)| <= (1+epsilon)^n S^N (|det D phi|) $
  e, grazie all'ipotesi @eq:shme3, si ha $0 <= |phi(E without E_N)| <= epsilon$, e dunque
  $ |phi(E)| - epsilon <= |E_N| = sum_(Q_arrow(k)^N subset E) |phi(Q_arrow(k)^N)| <= |phi(E)|. $
  Allora
  $ (1-epsilon)^n S_N (|det D phi|) <= |phi(E)| <= epsilon + (1+epsilon)^n S^N (|det D phi|) $
  passando al limite per $N -> +infinity$ e poi per $epsilon -> 0^+$, si ottiene
  $ S_*(|det D phi|) <= |phi(E)| <= S^*(|det D phi|). $
  Ma $|det D phi|$ è Riemann-integrabile su $E$ grazie al teorema @th:continua_integrabile e quindi si ottiene la @eq:formula-area.
]

#theorem[formula del cambio di variabile][
  Sia $Omega$ un aperto di $RR^n$, $phi: Omega -> RR^n$ una funzione di classe $C^1$, iniettiva, e tale che $det D phi(arrow(x)) != 0$ per ogni $arrow(x) in Omega$.
  Sia $E subset.double Omega$ PJ-misurabile e sia $f: phi(E) -> RR$ una funzione limitata e R-integrabile.

  Allora $(f compose phi) dot |det D phi|$ è limitata e R-integrabile su $E$ e si ha
  $ integral_(phi(E)) f(arrow(y)) thin d arrow(y) = integral_E f(phi(arrow(x))) dot |det D phi(arrow(x))| thin d arrow(x). $ <eq:cambio-variabile>
] <th:cambio_variabile>

#proof[
  _Passo 1: supponiamo $f$ sia una funzione caratteristica._
  Cioè $f = 1_F$ per un qualche $F subset.double phi(Omega)$, con $F$ PJ-misurabile.
  Visto che $det D phi != 0$ e $phi: Omega -> phi(Omega)$ è invertibile, per il teorema di invertibilità locale sappiamo che anche la funzione inversa $phi^(-1) : phi(Omega) -> Omega$ è di classe $C^1$.
  Dunque $E = phi^(-1)(F) subset.double Omega$ è PJ-misurabile per il lemma @lm:lipschitz_C1 e il lemma @lm:misura_lipschitz.
  Allora per il teorema @th:formula-area si ha
  $ integral f(arrow(y)) thin d arrow(y)
      &= |F| = |phi(E)| = integral 1_E (arrow(x)) dot |det D phi(arrow(x))| thin d arrow(x) \
      &= integral f(phi(arrow(x))) dot |det D phi(arrow(x))| thin d arrow(x). $

  _Passo 2: supponiamo $f$ sia una funzione semplice._
  Cioè $f$ sia combinazione lineare di funzioni caratteristiche:
  $ f = sum_(j=1)^n alpha_j 1_(F_j). $
  Visto che ambo i membri della @eq:cambio-variabile sono lineari in $f$, si ottiene l'integrabilità e l'uguaglianza anche su questa classe di funzioni.

  _Conclusione._ Se $f$ è una funzione limitata, R-integrabile, con supporto compatto in $phi(Omega)$, per definizione di R-integrabilità le funzioni semplici $f_N = sum alpha_j 1_(Q_j^N)$ e $g_N = sum beta_j 1_(Q_j^N)$ con $alpha_j = inf f(Q_j^N)$ e $beta_j = sup f(Q_j^N)$ hanno la proprietà che $integral f_N = S_N (f)$ e $integral g_N = S^N (f)$ e che $f_N (arrow(x)) <= f(arrow(x)) <= g_N (arrow(x))$ per ogni $x$ che non sia nella frontiera di un qualche cubetto.
  Ma allora
  $ S^N ((f compose phi) dot |det D phi|)
      &<= integral (g_N compose phi) dot |det D phi|
      = integral g_N -> integral f \
    S_N ((f compose phi) dot |det D phi|)
      &>= integral (f_N compose phi) dot |det D phi|
      = integral f_N -> integral f $
  da cui segue il risultato.
]

#theorem[formula del cambio di variabile generalizzato][
  Siano $E,F$ aperti misurabili di $RR^n$ (non necessariamente limitati), $phi: E -> F$ invertibile, di classe $C^1$, con $det D phi != 0$, sia $f$ integrabile su $F$ e sia anche $(f compose phi) dot |det D phi|$ integrabile su $E$.
  Allora vale la formula del cambio di variabile @eq:cambio-variabile.
] <th:cambio_variabile_generalizzato>

#proof[
  Si può infatti approssimare $E$ dall'interno con compatti misurabili $E_N$ e approssimare $F$ dall'interno con $F_N = phi(E_N)$.
  Vale allora l'uguaglianza @eq:cambio-variabile su $E_N$.
  Ma per l'ipotesi di integrabilità di $f$ e di $f compose phi dot |det D phi|$ si ha
  $ integral_E (f compose phi) dot |det D phi|
      &= lim_(N -> +infinity) integral_(E_N) (f compose phi) dot |det D phi| \
      &= lim_(N -> +infinity) integral_(F_N) f
      = integral_F f. $
]
