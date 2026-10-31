#import "../../lib.typ": *

/*
= Spazi topologici

#definition[Spazio topologico][
  Sia $X$ un insieme e sia $tau subset cal(P)(X)$ una famiglia di sottoinsiemi di $X$.
  Diremo che $X$ è uno _spazio topologico_, che $tau$ è una _topologia_ e che gli elementi di $tau$ sono _aperti_ se:
  + $emptyset in tau$, $X in tau$ (il vuoto e l'intero spazio sono aperti);
  + $A subset tau => union A in tau$ (unione qualunque di aperti è aperta);
  + $A, B in tau => A inter B in tau$ (intersezione finita di aperti è aperta).

  Diremo inoltre che lo spazio topologico è _separato_ (o $T_2$ o di Hausdorff) se inoltre vale:
  4. dati $x, y in X$ con $x != y$ esistono $U, V in tau$ con $x in U$, $y in V$ e $U inter V = emptyset$.

  Diremo che un sottoinsieme $A subset X$ è _chiuso_ se il complementare è aperto ($X backslash A in tau$).
  Diremo che $A subset X$ è un _intorno_ del punto $a in X$ se esiste $U in tau$ tale che $x in U subset A$.

  Tutte le proprietà date nella definizione @def:466342 possono quindi essere date in uno spazio topologico utilizzando gli intorni (o gli aperti) al posto delle palle.
]

#theorem[Topologia indotta dalla metrica][
  Sia $X$ uno spazio metrico e sia $tau$ l'insieme di tutti gli aperti di $X$ ovvero:
  $ tau = \{ A subset X : forall a in A " " exists rho > 0 : B_rho (a) subset A \}. $
  Allora $tau$ è una topologia e $X$ è uno spazio topologico separato rispetto alla topologia $tau$.
]

#definition[Base di intorni][
  Sia $X$ un insieme e per ogni $x in X$ sia data $cal(B)_x subset cal(P)(X)$ una famiglia di sottoinsiemi di $X$. Diremo che $cal(B)_x$ è una _base di intorni_ di $x$ se valgono le seguenti proprietà:
  + $cal(B)_x$ è non vuoto;
  + se $B in cal(B)_x$ allora $x in B$;
  + se $A, B in cal(B)_x$ allora esiste $C in cal(B)_x$ tale che $C subset A inter B$;
  + Se un insieme contiene un intorno di un punto anch'esso è un intorno di quel punto.
  + L'intersezione di due intorni di un punto è un intorno del punto.

  Se per ogni $x in X$ l'insieme $cal(B)_x$ è una base di intorni di $x$ potremo definire
  $ tau = \{ A subset X : forall x in A " " exists B in cal(B)_x : B subset A \} $
  e risulta che $tau$ è una topologia e quindi $X$ è uno spazio topologico rispetto a tale topologia (indotta dalla base di intorni).

  Se inoltre vale anche la seguente proprietà:
  1. dati $x, y in X$, $x != y$, esistono $B in cal(B)_x$ e $C in cal(B)_y$ tali che $B inter C = emptyset$;
  allora $X$ sarà uno spazio topologico separato.
]

Le proprietà seguenti sono conseguenza degli assiomi precedenti e sono quindi valide in ogni spazio topologico.

+ La parte interna di un qualunque $A subset X$ è il più grande (ovvero l'unione di ogni) aperto contenuto in $A$. La chiusura di $A$ è il più piccolo (ovvero l'intersezione di ogni) chiuso contenente $A$.
  In particolare la parte interna è sempre aperta e la parte interna di un aperto è tutto l'insieme. La chiusura è un insieme chiuso e la chiusura di un chiuso è l'insieme stesso.
+ La frontiera di un insieme è chiusa. Parte interna, frontiera e parte esterna sono tre insiemi disgiunti (rispettivamente aperto, chiuso e aperto) la cui unione è tutto lo spazio.

#theorem[
  Se $X$ è uno spazio metrico la famiglia di insiemi
  $ tau = \{ A subset X : forall a in A " " exists rho > 0 : B_rho (x) subset A \} $
  risulta essere una topologia su $X$ che si chiama _topologia indotta_ dalla metrica di $X$.
]

#proof[
  L'insieme vuoto è aperto in quanto non ci sono punti su cui è necessario verificare la proprietà che definisce gli aperti. Anche l'intero spazio è aperto in quanto ogni palla è contenuta in esso. Dunque $emptyset, X$ sono aperti e di conseguenzi i rispettivi complementari: $X, emptyset$ sono chiusi.

  Che l'unione qualunque di aperti sia aperta è ovvio: preso un punto dell'unione tale punto è contenuto in uno degli aperti. Dunque c'è una palletta centrata nel punto e contenuta nell'aperto. Ma allora essa è anche contenuta nell'unione.
  Che l'intersezione di chiusi sia un chiuso si ottiene passando ai complementari: il complementare di un chiuso è un aperto e il complementare dell'intersezione è l'unione dei complementari.

  L'intersezione qualunque di chiusi è uguale al complementare (rispetto ad $X$) dell'unione dei complementari. Per definizione il complementare di un chiuso è aperta e dunque l'unione dei complementari è aperta. Dunque il suo complementare è un chiuso.

  Consideriamo ora l'intersezione $A inter B$ di due aperti $A$ e $B$. Se $x$ è un punto dell'intersezione sappiamo che esistono due palle $B_r (x)$ e $B_s (x)$ tali che $B_r (x) subset A$ e $B_s (x) subset B$. La più piccola delle due è contenuta in $A inter B$ e questo dimostra che $A inter B$ è aperto. Passando ai complementari si ottiene che l'unione di due chiusi è un chiuso.

  Dati $x, y in X$ se $x != y$ allora $r = d(x, y)/2 > 0$. Osserviamo allora che $B_r (x)$ e $B_r (y)$ sono disgiunte in quanto se se esistesse $z in B_r (x) inter B_r (y)$ si avrebbe $d(x, y) <= d(x, z) + d(z, y) < r + r = d(x, y)$ che è assurdo.

  Abbiamo quindi dimostrato le quattro proprietà degli aperti. Passiamo alle proprietà degli intorni. Per definizione un insieme $U$ è un intorno di $x$ se esiste un aperto $A$ tale che $x in A subset U$. Necessariamente quindi $x in U$. E se $V supset U$ allora $x in A subset V$ e dunque anche $V$ è intorno di $x$. Se $U$ e $V$ sono intorni dovranno esistere due aperti $A$ e $B$ tali che $x in A subset U$ e $x in B subset V$. Ma allora $A inter B$ è aperto e $x in A inter B subset U inter V$ dunque $U inter V$ è anch'esso un intorno di $x$. Per il quarto punto basta osservare che ogni intorno contiene, per definizione, un aperto che contiene il punto e un aperto è, sempre per definizione, intorno di ogni suo punto. Per il punto 5 già sappiamo che due punti distinti sono contenuti in aperti disgiunti, e gli aperti sono sempre intorni di ogni loro punto.

  Dimostriamo ora che la parte interna di un insieme $A$ è l'unione di tutti gli aperti contenuti in $A$. Da un lato se $x$ è un punto interno ad $A$ allora esiste $r > 0$ tale che $B_r (x) subset A$. Essendo $B_r (x)$ aperto risulta quindi che $x$ sta nell'unione degli aperti contenuti in $A$. Viceversa se $x$ sta nell'unione di tutti gli aperti contenuti in $A$ deve esistere un aperto $U$ tale che $x in U subset A$. Ma allora esiste $r > 0$ tale che $B_r (x) subset U subset A$ e dunque $x$ è punto interno ad $A$. La proprietà analoga per i chiusi si ottiene passando ai complementari.

  La frontiera di un insieme è, per definizione, l'insieme dei punti che non sono né interni né esterni. D'altra parte è chiaro che un punto non può essere contemporaneamente interno ed esterno. Dunque la frontiera è il complementare dell'unione della parte interna e della parte esterna, ed è quindi un insieme chiuso.
]
*/

#theorem[Chiusura sequenziale][
  Sia $(X, d)$ uno spazio metrico.
  Un insieme $A subset X$ è chiuso se e solo se per ogni successione $a_n in A$ se $a_n -> a in X$ allora $a in A$ (il limite di punti di $A$, se esiste, è un punto di $A$).
] <th:chiuso_sequenziale>

#proof[
  Supponiamo che $A$ sia chiuso e sia $a_k in A$ una successione convergente ad un punto di $X$: $a_k -> a$.
  Dobbiamo mostrare che $a in A$.
  Per definizione di convergenza sappiamo che per ogni $epsilon > 0$ esiste $K in NN$ tale per ogni $k > K$ si ha $d(a_k, a) < epsilon$ e quindi $a_k in B_epsilon (a)$.
  In particolare $A inter B_epsilon (a) != emptyset$.
  Risulta quindi che $a$ non è esterno ad $A$ e quindi, essendo $A$ chiuso, $a in A$.

  Supponiamo che $A$ non sia chiuso e verifichiamo che in tal caso si può trovare una successione $a_k$ di punti di $A$ che converge $a_k -> a$ ad un punto $a in.not A$.
  Se $A$ non è chiuso significa che c'è un punto $a in X backslash A$ che non è esterno ad $A$.
  Ciò vuol dire che per ogni $r > 0$ l'insieme $B_r (a) inter A$ è non vuoto. Per ogni $k in NN$ posso allora scegliere $r = 1/k$ e quindi so che esiste un punto $a_k in B_r (a) inter A$ ovvero $a_k in A$ e $d(a_k, a) < 1/k$.
  Dunque $a_k -> a$ con $a_k in A$ ma $a in.not A$, come volevamo dimostrare.
]

#definition[Continuità][
  Una funzione $f: X -> Y$ definita tra due spazi metrici si dice essere _sequenzialmente continua_ nel punto $x in X$ se per ogni successione convergente $x_n -> x$ in $X$ risulta che $f(x_n) -> f(x)$ in $Y$.
  Diremo che $f$ è _sequenzialmente continua_ se è sequenzialmente continua in ogni punto $x$ del suo dominio $X$.

  Una funzione $f: X -> Y$ definita tra due spazi metrici si dice essere _continua_ in un punto $x in X$ se
  $ forall epsilon > 0: exists delta > 0: forall y in X: d(x, y) < delta => d(f(x), f(y)) < epsilon. $ <eq:continuita_metrico>
  Diremo che $f$ è _continua_ se è continua in ogni punto $x$ del suo dominio.
] <def:continua_metrico>

Anche in questo caso abbiamo considerato due diverse nozioni di continuità che in generale (in spazi topologici) potrebbero non coincidere ma nel caso degli spazi metrici sono equivalenti, come dimostriamo nel seguente teorema.

#theorem[Definizioni equivalenti di continuità][
  Sia $f: X -> Y$ una funzione definita tra due spazi metrici $X$ e $Y$.
  Allora $f$ è sequenzialmente continua in un punto $x in X$ se e solo se è continua nel punto $x$.

  Inoltre $f$ è continua se e solo se per ogni $A$ aperto in $Y$ risulta che $f^(-1)(A)$ è aperto in $X$ (la controimmagine di un aperto è aperta).
]

#proof[
  Supponiamo che $f$ sia sequenzialmente continua in $x$ e, per assurdo, supponiamo che $f$ non sia continua nello stesso punto $x$.
  Allora negando @eq:continuita_metrico otteniamo che esiste $epsilon > 0$ tale che per ogni $delta > 0$ in particolare per ogni $delta = 1/k$ con $k in NN$ esiste un punto $y_k$ tale che $d(y_k, x) < 1/k$ ma $d(f(y_k), f(x)) >= epsilon$. Significa che $y_k -> x$ e quindi, se $f$ è sequenzialmente continua, dovrebbe essere $f(y_k) -> f(x)$. Ma questo è in contraddizione con la condizione $d(f(y_k), f(x)) >= epsilon$.

  Viceversa supponiamo che $f$ sia continua in $x$ e consideriamo una qualunque successione $x_k -> x$.
  Per dimostrare che $f(x_k) -> f(x)$ dobbiamo verificare che per ogni $epsilon > 0$ esiste $K in NN$ tale che per ogni $k > K$ si ha $d(f(x_k), f(x)) < epsilon$.
  Ma dalla continuità di $f$, dato $epsilon > 0$ sappiamo esistere $delta > 0$ per cui se $d(y, x) < delta$ allora $d(f(y), f(x)) < epsilon$. Visto che $x_k -> x$ certamente esiste $K in NN$ tale che per ogni $k > K$ si ha |x_k - x| < delta e quindi |f(x_k) - f(x)| < epsilon come volevamo dimostrare.

  Mostriamo ora che se $f$ è continua e $A$ è aperto in $Y$ allora $f^(-1)(A)$ è aperto in $X$.
  Dato un punto qualunque $x_0 in f^(-1)(A)$ sappiamo che $f(x_0) in A$ dunque, essendo $A$ aperto, esiste $epsilon > 0$ tale che $B_epsilon (f(x_0)) subset A$.
  Per la continuità di $f$ esiste allora $delta > 0$ tale che se |x - x_0| < delta allora |f(x) - f(x_0)| < epsilon e quindi $f(x) in A$. Significa che $B_delta (x_0) subset f^(-1)(A)$.
  Questo è vero per ogni $x_0 in f^(-1)(A)$ quindi tale insieme è aperto.

  Viceversa supponiamo che la controimmagine di ogni aperto sia un aperto e dimostriamo che la funzione è continua in ogni punto.
  Preso un punto $x_0 in X$ e un $epsilon > 0$ consideriamo l'aperto $B_epsilon (f(x_0))$.
  La sua controimmagine è l'insieme \{ x : |f(x) - f(x_0)| < epsilon \} e per ipotesi sappiamo che è aperto. Significa allora che esiste $delta > 0$ tale $B_delta (x_0)$ è contenuto in tale insieme, ovvero per ogni $x in B_delta (x_0)$ cioè |x - x_0| < delta risulta $f(x) in B_epsilon (f(x_0))$ cioè |f(x) - f(x_0)| < epsilon.
  Abbiamo quindi verificato la definizione di continuità nel punto $x_0$.
]

#theorem[Continuità della funzione composta][
  Siano $X$, $Y$ e $Z$ spazi metrici, $f: X -> Y$ e $g: Y -> Z$ funzioni continue.
  Allora $g compose f: X -> Z$ è continua.
] <th:continuita_funzione_composta_metrico>

#proof[
  Usando la continuità sequenziale basta osservare che se $x_n -> x$ allora $f(x_n) -> f(x)$ e quindi $g(f(x_n)) -> g(f(x))$.
]

#definition[Spazi limitati][
  Sia $X$ uno spazio metrico o un sottoinsieme di uno sottospazio metrico. Si dirà che $X$ è _limitato_ se è contenuto in una palla ovvero se esiste $x_0 in X$ e $R > 0$ tale che $X subset B_R (x_0)$.
] <def:spazio_limitato>

= Compattezza sequenziale

#definition[Compattezza sequenziale][
  Sia $X$ uno spazio metrico o un sottoinsieme di uno spazio metrico. Si dirà che $X$ è _sequenzialmente compatto_ se da ogni successione $x_k in X$ è possibile estrarre una sottosuccessione $x_(k_j) -> x$ convergente ad un punto $x in X$.
] <def:sequenzialmente_compatto>

Il teorema di Bolzano-Weierstrass afferma che gli intervalli $[a, b]$ con $a, b in RR$ sono sequenzialmente compatti.
Possiamo estendere questo risultato in $RR^n$.

#theorem[Compattezza in $RR^n$][
  Sia $K subset RR^n$ un insieme chiuso e limitato.
  Allora $K$ è sequenzialmente compatto.
] <th:compattezza_Rn>

#proof[
  Sia $arrow(x)_k in K$ una qualunque successione di punti.
  Se $K$ è limitato significa che esiste una palla $B_r (arrow(y))$ che contiene $K$ dunque |arrow(x)_k - arrow(y)| < r per ogni $k$.
  Posto $R = r + |arrow(y)|$ per disuguaglianza triangolare possiamo affermare che |arrow(x)_k| < R per ogni $k$.
  Denotiamo con $((x_k)_1, ..., (x_k)_n)$ le coordinate del punto $arrow(x)_k in RR^n$.
  Allora visto che |(x_k)_j| <= |arrow(x)_k| si ottiene $(x_k)_j in [-R, R]$ per ogni $k in NN$ e ogni $j = 1, ..., n$.
  Per il teorema di Bolzano-Weierstrass la successione $(x_k)_1$ ha una estratta convergente. Ma da tale estratta possiamo estrarre una sotto-sottosuccessione per cui anche $(x_k)_2$ è convergente.
  Ovviamente su tale sotto-sottosuccessione $(x_k)_1$ continua ad essere convergente.
  Iterando $n$ volte otteniamo una sotto-sotto-...-sottosuccessione di $arrow(x)_k$ tale per cui ogni componente $(x_k)_j$ converge ad un numero $p_j in RR$ per $j = 1, ..., n$.
  Ma questo significa che $arrow(x)_k -> arrow(p) in RR^n$ con $arrow(p) = (p_1, ..., p_n)$.

  Visto che $K$ è chiuso deve essere $arrow(p) in K$ e dunque $K$ è sequenzialmente compatto.
]

In uno spazio metrico generico non è detto che gli insiemi chiusi e limitati siano sequenzialmente compatti (un esempio negativo è dato dalla convergenza uniforme, come vedremo più avanti).
L'implicazione inversa invece è sempre vera, come enunciato nel seguente teorema.

#theorem[
  Se $A$ è un sottoinsieme sequenzialmente compatto di uno spazio metrico $X$ allora $A$ è chiuso e limitato.
]

#proof[
  Chiaramente $A$ è chiuso in quanto presa una successione $x_k in A$ convergente a punto $x in X$ sappiamo che esiste una sottosuccessione convergente ad un punto di $A$. Ma necessariamente ogni sottosuccessione converge ad $x$ quindi $x in A$. Se $A$ non fosse limitato fissato $a in A$ per ogni $k in NN$ dovrebbe esistere un punto $x_k in A$ tale che $x_k in.not B_k (a)$ cioè $d(x_k, a) > k$. Supponiamo allora che esista una sottosuccessione convergente $x_(k_j) -> x in A$. Allora per la disuguaglianza triangolare inversa si avrebbe
  $ d(x, a) >= d(x_(k_j), a) - d(x_(k_j), x) >= k_j - d(x_(k_j), x) --> +infinity - 0 = +infinity. $
  Ma questo è assurdo in quanto $d(x, a) in RR$.
]

#theorem[Weierstrass: le funzioni continue mandano compatti in compatti][
  Sia $f: X -> Y$ una funzione continua tra due spazi metrici $X$ e $Y$.
  Se $K subset X$ è sequenzialmente compatto allora anche $f(K)$ è sequenzialmente compatto.
] <th:weiestrass_metrico>

#proof[
  Sia $y_k in f(K)$ una qualunque successione. Allora esiste $x_k in K$ tale che $f(x_k) = y_k$.
  Essendo $K$ sequenzialmente compatto possiamo estrarre una sottosuccessione convergente: $x_(k_j) -> x$.
  Essendo $f$ continua si ha
  $ y_(k_j) = f(x_(k_j)) -> f(x) in f(K). $
]

Nel caso $X = Y = RR$ recuperiamo l'usuale teorema di Weierstrass, in quanto se $f: [a, b] -> RR$ è continua essendo $[a, b]$ sequenzialmente compatto risulta che $f([a, b])$ è sequenzialmente compatto.
Ma gli insiemi sequenzialmente compatti di $RR$ sono chiusi e limitati quindi hanno massimo e minimo in quanto l'estremo superiore e l'estremo inferiore sono finiti e sono punti di aderenza dell'insieme.

#definition[Uniforme continuità][
  Sia $f: X -> Y$ una funzione definita tra due spazi metrici $X$ e $Y$.
  Diremo che $f$ è _uniformemente continua_ se
  $ forall epsilon > 0: exists delta > 0: d(x, x') < delta => d(f(x), f(x')) < epsilon. $
]

#theorem[Heine-Cantor][
  Sia $X$ uno spazio metrico sequenzialmente compatto e $Y$ uno spazio metrico.
  Sia $f: X -> Y$ una funzione continua.
  Allora $f$ è uniformemente continua.
] <th:HeineCantor>

#proof[
  Supponiamo per assurdo che $f: X -> Y$ sia una funzione continua ma non uniformemente continua. Dunque non vale la condizione di uniforme continuità:
  $ forall epsilon > 0 thin exists delta > 0, forall x, y in X: d(x, y) < delta => d(f(x), f(y)) < epsilon. $
  La negazione di tale condizione è (ricordiamo che la negazione inverte i quantificatori e la negazione dell'implicazione $P => Q$ è $P and not Q$):
  $ exists epsilon > 0 thin forall delta > 0, exists x, y in X: d(x, y) < delta and d(f(x), f(y)) >= epsilon. $
  Fissato $epsilon > 0$ applichiamo la condizione precedente con $delta = 1/k$ per ogni $k in NN$ in modo da ottenere due successioni $x_k$, $y_k$ tali che
  $ d(x_k, y_k) < 1/k, quad d(f(x_k), f(y_k)) >= epsilon. $
  Per la sequenziale compattezza di $X$ esiste una estratta $j_k$ tale che $x_(k_j) -> bar(x)$ con $bar(x) in X$.
  Visto che $d(x_k, y_k) -> 0$ si ha anche $y_(k_j) -> bar(x)$.
  Dalla continuità di $f$ si ottiene $f(x_(k_j)) -> f(bar(x))$ e $f(x_(k_j)) -> f(bar(x))$ da cui $d(f(x_(k_j)), f(y_(k_j))) -> 0$.
  Ma questo è in contraddizione con la condizione $d(f(x_k), f(y_k)) >= epsilon$.
]