#import "../../lib.typ": *

= Spazi metrici

Si veda la @fig:spazi per avere un quadro relazionale degli spazi che andremo ora ad introdurre.
Gli spazi vettoriali (algebra lineare) li diamo per noti, in quanto sono usualmente oggetto del corso di geometria.
Gli spazi topologici verranno solamente accennati in quanto non saranno direttamente utili ai nostri scopi e una trattazione completa richiederebbe molto tempo.
Per lo stesso motivo mancano completamente da questa classificazione anche altri spazi molto rilevanti (ad esempio i gruppi e le varietà differenziali).

#figure(
  text(size: 8.5pt)[
  #diagram(
    spacing: (0.1cm, 0.7cm),
//    cell-size: 5mm, 
    // --- NODI PRINCIPALI (Strutture) ---
    node((0, 0), [insieme], name: <insieme>),
    node((-1, 1), [sp. vettoriale], name: <sv>),
    node((-1, 3), [sp. normato], name: <sn>),
    node((-1, 5), [sp. euclideo], name: <euclideo>),
    node((1, 1), [sp. topologico], name: <st>),
    node((1, 2), [sp. metrico], name: <sm>),
    node((1, 3.5), [sp. completo], name: <completo>),
    node((0, 4.5), [Banach], name: <banach>),
    node((0, 6), [Hilbert], name: <hilbert>),

    // --- FRECCE "è un" (Nero) ---
    edge(<sv>, <insieme>, "->", stroke: black),
    edge(<st>, <insieme>, "->", stroke: black),
    edge(<sn>, <sv>, "->", stroke: black),
    edge(<sm>, <st>, "->", stroke: black),
    edge(<euclideo>, <sn>, "->", stroke: black),
    edge(<hilbert>, <euclideo>, "->", stroke: black),
    edge(<hilbert>, <banach>, "->", stroke: black),
    edge(<banach>, <completo>, "->", stroke: black),
    edge(<completo>, <sm>, "->", stroke: black),
    edge(<sn>, <sm>, "->", stroke: black),
    edge(<banach>, <sn>, "->", stroke: black),

    // --- OPERAZIONI TIPICHE (Grigio Chiaro) ---
    node((-1, 0), text(fill: luma(100), $in, subset, union$), name: <insiemeT>),

    edge(<insiemeT>, <insieme>, "-", stroke: luma(180)),
    node((-3, 1), text(fill: luma(100), $+, dot$), name: <svT>),
    edge(<svT>, <sv>, "-", stroke: luma(180)),

    node((-3, 3), text(fill: luma(100), $norm(v)$), name: <snT>),
    edge(<snT>, <sn>, "-", stroke: luma(180)),

    node((-3, 5), text(fill: luma(100), $chevron.l v, w chevron.r$), name: <euclideoT>),
    edge(<euclideoT>, <euclideo>, "-", stroke: luma(180)),

    node((2, 0), text(fill: luma(100), $lim, accent(A, circle), bar(A)$), name: <stT>),
    edge(<stT>, <st>, "-", stroke: luma(180)),

    node((2.5, 1.75), text(fill: luma(100), [$d(x,y)$, Lip]), name: <smT>),
    edge(<smT>, <sm>, "-", stroke: luma(180)),
    
    // --- ESEMPI (Grigio Scuro) ---
    node((2, 1), text(fill: luma(60), $bar(RR)$), name: <Rbar>),
    edge(<Rbar>, <st>, "->", stroke: luma(80)),

    node((2, 2.5), text(fill: luma(60), $QQ$), name: <Q>),
    edge(<Q>, <sm>, "->", stroke: luma(80)),

    node((2, 4), text(fill: luma(60), $bb(S)^n$), name: <Sn>),
    edge(<Sn>, <completo>, "->", stroke: luma(80)),

    node((1.2, 5), text(fill: luma(60), $cal(C)^n, L^p, ell^p$), name: <Cn>),
    edge(<Cn>, <banach>, "->", stroke: luma(80)),

    node((1.2, 6.5), text(fill: luma(60), $L^2, ell^2$), name: <L2>),
    edge(<L2>, <hilbert>, "->", stroke: luma(80)),

    node((0, 7), text(fill: luma(60), $RR^n$), name: <Rn>),
    edge(<Rn>, <hilbert>, "->", stroke: luma(80)),
  )],
  caption: [
    Strutture matematiche che astraggono lo spazio $RR^n$.
    La freccia nera significa: "è un",
    la freccia scura: "è un esempio di",
    la linea chiara: "è una operazione tipica di".
  ],
) <fig:spazi>

#definition[spazio metrico][
  Diremo che $d: X times X -> RR$ è una _distanza_ su $X$ se per ogni $x,y,z in X$ valgono le seguenti proprietà:
  1. $d(x,y) >= 0$ (positività);
  2. $d(x,y) <= d(x,z) + d(z,y)$ (disuguaglianza triangolare);
  3. $d(x,y) = 0$ se e solo se $x=y$ (separazione);
  4. $d(x,y) = d(y,x)$ (simmetria).

  Se $d$ è una distanza diremo che $X$ è uno _spazio metrico_ (con distanza $d$).
] <def:distanza>

Osserviamo che dalle disuguaglianze triangolari:
$ d(x,z) <= d(x,y) + d(y,z), quad quad d(y,z) <= d(x,y) + d(x,z) $
si ottiene la _disuguaglianza triangolare inversa_:
$ d(x,y) >= |d(x,z) - d(y,z)|. $

#definition[convergenza][
  Se $x_n in X$ è una successione di punti di uno spazio metrico $X$ e $x in X$ diremo che $x_n$ converge a $x$ e scriveremo
  $ x_n -> x $
  se $d(x_n,x) -> 0$ per $n -> +oo$.
] <def:convergenza_metrica>

Si noti che l'usuale convergenza in $RR$ non è altro che la convergenza di $RR$ visto come spazio metrico con la distanza euclidea $d(x,y) = |x-y|$.

Con l'artificio $d(x_n,y_n) - d(x,y) = d(x_n,y_n) - d(x_n,y) + d(x_n,y) - d(x,y)$ e utilizzando la disuguaglianza triangolare inversa si può facilmente risolvere il seguente.

#exercise[continuità della distanza"][
  Dimostrare che se $x_n -> x$ e $y_n -> y$ allora $d(x_n,y_n) -> d(x,y)$.
]

Se vogliamo definire una distanza su uno spazio vettoriale $V$ sarà naturale richiedere che la distanza sia compatibile con la struttura di spazio vettoriale, e dunque che sia invariante per traslazioni e omogenea rispetto alle dilatazioni.
Con questa richiesta la distanza $d(x,y)$ tra due punti dovrà essere uguale alla distanza di $x-y$ dall'origine.
La distanza dall'origine viene chiamata _norma_ ed è alla base della seguente definizione.

#definition[spazio normato][
  Sia $V$ uno spazio vettoriale sul campo $RR$.
  Una funzione $phi: V -> RR$ si dice essere una _norma_ su $V$ se per ogni $v,w in V$ e per ogni $lambda in RR$ valgono le seguenti proprietà:
  1. $phi(v) >= 0$ (positività);
  2. $phi(lambda v) = |lambda| dot phi(v)$ (omogeneità e simmetria);
  3. $phi(v+w) <= phi(v) + phi(w)$ (disuguaglianza triangolare);
  4. $phi(v) = 0$ se e solo se $v = 0$ (separazione).

  Se $phi$ è una norma su $V$ diremo che $V$ è uno spazio vettoriale _normato_ da $phi$.

  Se $phi$ è una norma la funzione $d(v,w) = phi(v-w)$ è chiaramente una distanza che si chiama _distanza indotta_ da $phi$.
  In particolare ogni spazio normato è anche uno spazio metrico rispetto alla distanza indotta dalla norma.
] <def:norma>

Usualmente si utilizzano le notazioni $|v|$ per indicare una norma $phi(v)$.

Visto che uno spazio normato è anche uno spazio metrico, negli spazi normati è definita una convergenza. È facile verificare che la norma risulta essere continua rispetto a tale convergenza, nel senso che se $v_k -> v$ (ovvero $phi(v_k - v) -> 0$) allora $phi(v_k) -> phi(v)$.

#definition[spazio euclideo][
  Sia $V$ uno spazio vettoriale sul campo $RR$.
  Una funzione $b: V times V -> RR$ si dice essere un _prodotto scalare definito positivo_ su $V$ se $b$ è una forma bilineare, simmetrica e definita positiva, ovvero se per ogni $u,v,w in V$ e per ogni $lambda, mu in RR$ valgono le seguenti proprietà:
  1. $b(v,v) >= 0$ (positività);
  2. $b(lambda u + mu v, w) = lambda b(u,w) + mu b(v,w)$ e $b(u, lambda v + mu w) = lambda b(u,v) + mu b(u,w)$ (bilinearità);
  3. $b(v,w) = b(w,v)$ (simmetria);
  4. $b(v,v) = 0$ se e solo se $v = 0$ (non degenerazione).
 
  Se $b$ è un prodotto scalare definito positivo su $V$ diremo che $V$ è uno spazio _euclideo_ (con prodotto scalare $b$).
 
  Usualmente si utilizzano le notazioni $v dot w$, $(v,w)$, $chevron.l v,w chevron.r$ o $chevron.l v | w chevron.r$ per denotare un prodotto scalare $b(v,w)$.
] <def:prodotto_scalare>

Se $b$ è un prodotto scalare definito positivo su $V$ il teorema seguente ci garantisce che la funzione $phi(v) = sqrt(chevron.l v \, v chevron.r)$ è una norma su $V$.

Dunque uno spazio euclideo ha, in modo naturale, una struttura di spazio normato e di spazio metrico.
 
#theorem[proprietà del prodotto scalare][
  Sia $V$ uno spazio euclideo con prodotto scalare (definito positivo) $chevron.l v, w chevron.r$.
  Si definisca $|v| = sqrt(chevron.l v \, v chevron.r)$.
  Allora $|v|$ è una norma su $V$ e per ogni $v,w in V$ valgono le seguenti proprietà:
  1. _Sviluppo del binomio_
    $ |v+w|^2 = |v|^2 + 2 chevron.l v,w chevron.r + |w|^2; $ <eq:binomio_vettoriale>
  2. _Teorema di Pitagora_
    $ chevron.l v,w chevron.r = 0 ==> |v-w|^2 = |v|^2 + |w|^2; $ <eq:Pitagora>
  3. _Disuguaglianza di Young_
    $ chevron.l v,w chevron.r <= (|v|^2 + |w|^2) / 2; $ <eq:Young>
  4. _Disuguaglianza di Cauchy-Schwarz_
    $ chevron.l v,w chevron.r <= |v| dot |w|; $ <eq:Cauchy_Schwarz>
  5. _Proprietà del parallelogramma_
    $ |v+w|^2 + |v-w|^2 = 2 |v|^2 + 2 |w|^2; $ <eq:parallelogramma>
  6. _Continuità_
    $ "se " v_k -> v " e " w_k -> w " allora " chevron.l v_k, w_k chevron.r -> chevron.l v, w chevron.r . $
] <th:spazio_euclideo>
 
#proof[
  Osserviamo innanzitutto che $|v|$ è ben definita per ogni $v in V$ in quanto il prodotto scalare $chevron.l v,v chevron.r$ per definizione non è mai negativo.
  Allora in generale si ha, sfruttando la bilinearità, l'usuale sviluppo del quadrato del binomio:
  $ |v+w|^2
    &= chevron.l v+w, v+w chevron.r
    = chevron.l v+w, v chevron.r + chevron.l v+w, w chevron.r \
    &= chevron.l v,v chevron.r + 2 chevron.l v,w chevron.r + chevron.l w,w chevron.r
    = |v|^2 + 2 chevron.l v,w chevron.r + |w|^2. $
 
  Il teorema di Pitagora segue immediatamente.
  Ma allora si ottiene facilmente la disuguaglianza di Young:
  $ 0 <= |v-w|^2 = |v|^2 + |w|^2 - 2 chevron.l v,w chevron.r $
  e la proprietà del parallelogramma:
  $ |v+w|^2 + |v-w|^2 = |v|^2 + 2 chevron.l v,w chevron.r + |w|^2 + |v|^2 - 2 chevron.l v,w chevron.r + |w|^2. $
 
  Ora se $|v| = |w| = 1$ la disuguaglianza di Young ci dice che
  $ chevron.l v,w chevron.r <= 1. $
  Ma allora per ogni $v != 0$ e $w != 0$ si ottiene la disuguaglianza di Cauchy-Schwarz:
  $ (chevron.l v,w chevron.r) / (|v| dot |w|) = chevron.l v / (|v|), w / (|w|) chevron.r <= 1. $
  Se invece $v=0$ o $w=0$ la disuguaglianza di Cauchy-Schwarz è ovvia in quanto per ogni $u in V$ si ha $chevron.l 0, u chevron.r = chevron.l u, 0 chevron.r = 0$ per bilinearità.

  Le proprietà di positività, omogeneità, simmetria e separazione della norma $|v|$ seguono direttamente dalle proprietà analoghe del prodotto scalare $chevron.l v,w chevron.r$.
  La disuguaglianza triangolare segue invece dalla disuguaglianza di Schwarz, infatti:
  $ |v+w|^2 = chevron.l v+w, v+w chevron.r = |v|^2 + |w|^2 + 2 chevron.l v,w chevron.r <= |v|^2 + |w|^2 + 2 |v| dot |w| = (|v| + |w|)^2 $
  da cui $|v+w| <= |v| + |w|$.
 
  Per quanto riguarda la continuità ricordiamoci che $v_k -> v$ significa $|v_k - v| -> 0$. Possiamo allora scrivere
  $ chevron.l v_k, w_k chevron.r - chevron.l v, w chevron.r
    &= chevron.l v_k, w_k chevron.r - chevron.l v, w_k chevron.r + chevron.l v, w_k chevron.r - chevron.l v, w chevron.r \
    &= chevron.l v_k - v, w_k chevron.r + chevron.l v, w_k - w chevron.r $
  e, utilizzando Cauchy-Schwarz se $v_k -> v$ e $w_k -> w$ otteniamo
  $ |chevron.l v_k, w_k chevron.r - chevron.l v, w chevron.r|
    &<= |v_k - v| dot |w_k| + |v| dot |w_k - w| \
    &-> 0 dot |w| + |v| dot 0 = 0. $
]

Lo spazio vettoriale $RR^n$ ha una struttura euclidea canonica, come nella seguente.
 
#definition[struttura euclidea di $RR^n$][
  Un vettore $arrow(x) in RR^n$ è definito come una $n$-upla di numeri reali:
  $ arrow(x) = (x_1, ..., x_n). $
  Su $RR^n$ possiamo allora definire il prodotto scalare:
  $ arrow(x) dot arrow(y) = sum_(k=1)^n x_k y_k = x_1 y_1 + ... + x_n y_n $
  Questo prodotto scalare induce la norma euclidea:
  $ |arrow(x)| = sqrt(arrow(x) dot arrow(x)) = sqrt(x_1^2 + x_2^2 + ... + x_n^2). $
  La distanza indotta da tale norma si chiama _distanza euclidea_:
  $ d(arrow(x), arrow(y)) = |arrow(x) - arrow(y)| = sqrt((x_1 - y_1)^2 + ... + (x_n - y_n)^2). $
 
  Nel caso $n=1$ la norma coincide con il valor assoluto e questo giustifica l'aver utilizzato la stessa notazione.
 
  Se identifichiamo $CC$ con $RR^2$ associando al numero complesso $z = x + i y$ il punto $(x,y) in RR^2$ possiamo osservare che la norma euclidea coincide con il modulo del numero complesso:
  $ |z| = sqrt(x^2 + y^2) = |(x,y)|. $
 
  Dunque $RR$, $CC$, $RR^n$, sono spazi euclidei, spazi normati e spazi metrici rispetto alla struttura euclidea canonica.
] <def:124124>

#example[distanza Manhattan][
  Su $RR^2$ possiamo definire una norma, chiamata _norma Manhattan_, come segue:
  $ phi(arrow(x)) = |x_1| + |x_2|. $
  La distanza indotta $d(p,q)$ rappresenta la lunghezza del percorso più breve per andare da $p$ a $q$ muovendosi solamente in orizzontale o verticale (come se fossimo sulle strade di Manhattan).

La norma Manhattan non è euclidea nel senso che non è possibile definire un prodotto scalare che induca tale norma. Infatti se esistesse un tale prodotto scalare dovrebbe essere valida la proprietà del parallelogramma @eq:parallelogramma e invece osserviamo che scelto $v=(1,0)$ e $w=(0,1)$ si ha
$ phi(v+w)^2 + phi(v-w)^2 = 8 != 4 = 2 phi(v)^2 + 2 phi(w)^2. $

L'insieme $B_R (arrow(x)_0) = { arrow(x) in RR^2 : phi(arrow(x) - arrow(x)_0) < R }$ dei punti di $RR^2$ che distano meno di $R$ dal punto $arrow(x)_0$ (si veda la @def:palla) è un quadrato con le diagonali, di lunghezza $2R$, parallele agli assi coordinati.
  Se come norma $phi$ avessimo scelto la norma euclidea canonica di $RR^2$ l'insieme $B_R (arrow(x)_0)$ sarebbe risultato essere un cerchio di raggio $R$ centrato in $arrow(x)_0$.
  In generale le norme indotte da un prodotto scalare si riconoscono dalla forma di questi insiemi: solo quando si ottengono ellissi (o ellissoidi se siamo in dimensione più alta) la norma è euclidea. Per le altre norme si potranno ottenere dei generici insiemi convessi simmetrici rispetto al centro $arrow(x)_0$.
]
 
#example[norma $p$][
  Per ogni $p >= 1$ si può definire su $RR^n$ la norma
  $ |arrow(x)|_p = root(p, |x_1|^p + |x_2|^p + ... + |x_n|^p). $
 
  Si può inoltre definire
  $ |arrow(x)|_oo = lim_(p -> +oo) |arrow(x)|_p = max { |x_1|, |x_2|, ..., |x_n| }. $
 
  Per $p=2$ si ottiene la norma euclidea della @def:124124 $|v|_2 = |v|$.
  Per $p=1$ su $RR^2$ si ottiene la norma Manhattan.
  Per $p=+oo$ si ottiene di nuovo la norma Manhattan a meno di una rotazione di 45 gradi e di un riscalamento di fattore $sqrt(2)$:
  $ |(x_1, x_2)|_oo = |((x_1 - x_2) / 2, (x_1 + x_2) / 2)|_1 $
 
  Si potrebbe dimostrare che solo per $p=2$ la norma $|arrow(x)|_p$ è indotta da un prodotto scalare in quanto solo per $p=2$ è valida la proprietà del parallelogramma @eq:parallelogramma.
] <ex:norma_p>