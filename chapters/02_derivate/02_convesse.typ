#import "../../lib.typ": *

= Convessità

== Insiemi convessi

#definition[insieme convesso][
  Sia $A subset RR^n$ un insieme.
  Diremo che $A$ è convesso se per ogni $x,y in A$ si ha $[x,y] subset A$ dove $[x,y]$ è il segmento che congiunge $x$ e $y$, cioè
  $ [x,y] = {t x + (1-t) y : t in [0,1]}. $

  Diremo che $A$ è _strettamente convesso_ se per ogni $x,y in A$, $x != y$ si ha che $(x,y) subset accent(A, circle)$.
]

#theorem[proiezione su un convesso][
  Sia $A subset RR^n$ un insieme convesso e chiuso.
  Dato $x in RR^n$ esiste un unico punto $y in A$ tale che
  $ |x-y| = min_(z in A) |x-z|. $
  Possiamo quindi definire la proiezione su $A$, $P_A: RR^n -> A$ che manda $x$ in $y$.

  Allora $P_A$ è una funzione $1$-lipschitziana.
]

#proof[
  Per prima cosa osserviamo che fissato $y$ la funzione $x |-> |x-y|$ è una funzione continua su $A$.
  Inoltre se $A$ è illimitato tale funzione è anche coerciva.
  Quindi per il teorema di Weierstrass (generalizzato) sappiamo che esiste $y in A$ che realizza il minimo.

  Supponiamo ora che esista un altro punto $y' in A$ che realizza il minimo.
  Sia $r = |x-y| = |x-y'|$.
  Visto che $bar(B)_r (x)$ è strettamente convessa, il segmento $(y,y')$ è contenuto in $B_r (x)$.
  E quindi, se fosse $y != y'$ esisterebbe un punto $z in (y,y')$ che ha distanza da $x$ strettamente inferiore a $r$.
  Ma per la convessità di $A$ l'intero segmento $[y,y']$ è contenuto in $A$ e quindi $z in A$.
  Questo è assurdo perché $r$ era la distanza minima da $x$ a $A$.
  Quindi c'è un unico punto $y in A$ che realizza il minimo.

  Per dimostrare che $P_A$ è $1$-lipschitziana, fissati $x, y in RR^n$ dobbiamo dimostrare che
  $ |P_C (x) - P_C (y)| <= |x-y|. $ <eq:convex4855>

  Siano $p=P_C (x)$ e $q=P_C (y)$.
  Andremo ora a dimostrare che
  $ (x-p) dot (q-p) <= 0. $ <eq:convex4856>

  Consideriamo il punto $p_t = (1-t) p + t q$.
  Per la convessità di $C$ si ha $p_t in C$ per ogni $t in [0,1]$ e quindi la funzione $f(t) = |x-p_t|^2$ ha minimo per $t=0$.
  Dunque deve essere $f'(0) >= 0$.
  Ma
  $ f'(t) = 2 (x-p_t) dot q_t' = 2 (x-p_t) dot (q-p) $
  e quindi $0 <= f'(0) = 2 (x-p) dot (q-p)$ e si ottiene la @eq:convex4856.

  Per concludere la dimostrazione osserviamo che per simmetria si ha anche $(y-q) dot (p-q) <= 0$ e, sommando le due disuguaglianze, si ottiene dunque
  $ 0 >= (x - p - y + q) dot (q-p) = (x-y) dot (q-p) + |q-p|^2 $
  da cui
  $ |q-p|^2 <= (y-x) dot (q-p) <= |y-x| dot |q-p| $
  e quindi, dividendo per $|q-p|$, si ottiene la @eq:convex4855.
]

#theorem[piano di supporto][
  Sia $C subset RR^n$ un insieme chiuso e convesso e sia $p in partial C$.
  Allora esiste un semispazio $H$ con $H supset.eq C$ e $p in partial H$.
]

#proof[
  Visto che $p in partial C$ esiste $p_k in RR^n without C$ con $p_k -> p$.
  Grazie al teorema precedente possiamo considerare $q_k in C$ il punto di minima distanza da $p_k$.
  Se $r_k = |p_k - q_k|$ allora $B_(r_k)(p_k) inter C = emptyset$ altrimenti ci sarebbe un punto di $C$ che dista da $p_k$ meno di $q_k$.
  Consideriamo il semispazio chiuso $H_k$ con $partial H_k$ tangente a $B_(r_k)(p_k)$ in $q_k$ e con $H_k inter B_(r_k)(p_k) = emptyset$.
  Vogliamo dimostrare che $H_k supset.eq C$.

  Supponiamo per assurdo che esista $z in C without H_k$.
  Allora il segmento $[q_k,z]$ da un lato è contenuto in $C$ per la convessità di $C$, d'altro lato tale segmento dovrebbe entrare in $B_(r_k)(p_k)$ (perché il complementare di $H_k$ è il tangente a $B_(r_k)(p_k)$ in $q_k$).
  Ma questo è assurdo perché allora sul segmento $[q_k,z]$ ci sarebbe un punto di $C$ che dista da $p_k$ meno di $q_k$.
  Dunque $H_k supset.eq C$.

  Se consideriamo $v_k$ il versore normale a $partial H_k$ in modo che $H_k = {x in RR^n : v_k dot (x-q_k) <= 0}$ allora visto che $v_k$ è limitata, per il teorema di Bolzano-Weierstrass possiamo estrarre una sottosuccessione $v_(k_j)$ che converge a un certo $v$.
  Per continuità si ha $|v_(k_j)| -> |v|$ e quindi anche $v$ è un versore.
  Visto che $H_k supset.eq C$, per ogni $x in C$ si ha
  $ v_k dot (x-q_k) <= 0. $
  Osservando che $|q_k - p_k| <= |p-p_k| -> 0$, passando al limite nella disuguaglianza precedente otteniamo
  $ v dot (x-p) <= 0 $
  che significa che $x in H$ e $p in partial H$.
  Per l'arbitrarietà di $x in C$ otteniamo $C subset H$, come volevamo dimostrare.
]

#corollary[
  Un insieme chiuso $C subset RR^n$ è convesso se e solo se $C$ è intersezione (eventualmente infinita) di semispazi chiusi.
]

#proof[
  Da un lato è immediato verificare che l'intersezione di convessi è convessa (direttamente dalla definizione).
  Viceversa $C$ è l'intersezione di tutti i semispazi di supporto, in quanto ogni $x in RR^n without C$ è separato da $C$ dal semispazio di supporto passante dalla sua proiezione su $C$.
]

#definition[funzione convessa][
  Sia $A subset RR^n$ un insieme convesso e sia $f: A -> RR$ una funzione definita su $A$.
  Diremo che $f$ è convessa se per ogni $x,y in A$ e per ogni $t in [0,1]$ si ha
  $ f(t x + (1-t) y) <= t f(x) + (1-t) f(y). $ <eq:convex>

  Diremo che $f$ è concava se $-f$ è convessa ovvero se vale la disuguaglianza opposta della @eq:convex.
  Diremo che $f$ è strettamente convessa se è convessa e la @eq:convex è verificata con disuguaglianza stretta per ogni $x,y in A$, $x != y$ e per ogni $t in (0,1)$.
  Diremo che $f$ è strettamente concava se $-f$ è strettamente convessa.
]

#theorem[
  Sia $A subset RR^n$ un insieme convesso e sia $f: A -> RR$ una funzione.
  Sia
  $ E_f := {(x,y) in RR^(n+1) : y >= f(x)} $
  l'epigrafo di $f$.
  Allora sono equivalenti:
  + $A$ è convesso ed $f$ è convessa;
  + $E_f$ è convesso.
]

La convessità delle funzioni di più variabili può essere in buona parte ricondotta alla convessità delle funzioni di una variabile.
Se $f: A subset RR^n -> RR$, $x in A$ e $v in RR^n$ possiamo definire la restrizione di $f$ alla retta passante per $x$ in direzione $v$, ponendo
$ g(t) = f(x+t v). $
Osserviamo quindi che $f$ è convessa se e solo se la corrispondente $g$ è convessa per ogni $x in A$ e $v in RR^n$.

Si osserva inoltre che se $f$ è differenziabile si ha
$ g'(t) = D f(x+t v) v $
e se $f$ è differenziabile due volte si ha
$ g''(t) = v^t D^2 f(x+t v) v. $

I tre seguenti risultati sono quindi conseguenza degli analoghi risultati per le funzioni di una variabile.

#theorem[criterio di convessità al primo ordine][
  Sia $A subset RR^n$ un insieme aperto convesso e sia $f: A -> RR$.
  Se $f$ è convessa e $f$ è differenziabile in un punto $x_0 in accent(A, circle)$, allora per ogni $x in A$ si ha
  $ f(x) >= f(x_0) + d f(x_0)[x-x_0]. $ <eq:conv474>
  Viceversa, se $f$ è differenziabile in $accent(A, circle)$ e la @eq:conv474 è verificata per ogni $x in A$, allora $f$ è convessa.
]

#theorem[criterio di convessità al secondo ordine][
  Sia $A subset RR^n$ un insieme aperto convesso e sia $f: A -> RR$.
  Se $f$ è convessa e differenziabile due volte in un punto $x in A$ allora la matrice hessiana $D^2 f(x)$ è semidefinita positiva.
  Viceversa se $f$ è differenziabile due volte in $A$ e per ogni $x in A$ la matrice hessiana $D^2 f(x)$ è semidefinita positiva, allora $f$ è convessa.
]

#theorem[combinazioni convesse][
  Sia $A subset RR^n$ un insieme convesso e sia $f: A -> RR$ una funzione convessa.
  Dati $x_1, dots, x_N in A$ e $t_1, dots, t_N in [0,1]$ con $sum_(j=1)^N t_j = 1$ si ha
  $ f(sum_(k=1)^N t_k x_k) <= sum_(k=1)^N t_k f(x_k). $
]

#proof[
  Si dimostra per induzione su $N$.
  Se $N=1$ il risultato è banale.
  Supponiamo dunque $N>1$ e supponiamo per induzione che il teorema sia vero per $N-1$ punti.
  Sia $s = 1-t_N$.
  Allora $s > 0$ e possiamo definire $s_k = t_k / s$ per $k=1, dots, N-1$.
  Per ipotesi di induzione si ha
  $ f(sum_(k=1)^(N-1) s_k x_k) <= sum_(k=1)^(N-1) s_k f(x_k). $
  D'altra parte, per la convessità di $f$, si ha
  $ f(sum_(k=1)^N t_k x_k)
      &= f(s sum_(k=1)^(N-1) s_k x_k + t_N x_N) \
      &<= s f(sum_(k=1)^(N-1) s_k x_k) + t_N f(x_N) \
      &<= s sum_(k=1)^(N-1) s_k f(x_k) + t_N f(x_N) \
      &= sum_(k=1)^N t_k f(x_k). $
]

#theorem[sottolivelli di una funzione convessa][
  Sia $A subset RR^n$ un insieme convesso e sia $f: A -> RR$ una funzione convessa.
  Allora per ogni $c in RR$ gli insiemi _sottolivello_
  $ {x in A : f(x) <= c} quad text("e") quad {x in A : f(x) < c} $
  sono convessi.
  Se inoltre $f$ è strettamente convessa, allora i sottolivelli sono strettamente convessi.
]

#proof[
  Segue direttamente dalla definizione di convessità.
]

#example[
  Fissato $y in RR^n$ la funzione $f(x) = |x-y|^2$ è strettamente convessa in quanto $D^2 f(x) = 2 I$ è definita positiva.
  Dunque le palle $B_rho (y)$ e $bar(B)_rho (y)$, essendo sottolivelli di tale funzione, sono strettamente convesse.
]

#theorem[
  Sia $A subset RR^n$ un insieme aperto convesso e sia $f: A -> RR$ una funzione strettamente convessa. Allora $f$ ha al più un punto di minimo globale.
]

#theorem[locale lipschitzianità delle funzioni convesse][
  Sia $A subset RR^n$ un aperto convesso e sia $f: A -> RR$ una funzione convessa.
  Allora $f$ è localmente lipschitziana, cioè per ogni $x in A$ esiste $rho > 0$ per cui $f$ è lipschitziana su $B_rho (x)$.
  In particolare $f$ è continua.
]

#proof[
  _Passo 1:_ mostriamo che $f$ è localmente superiormente limitata.
  Dato $x in A$ possiamo trovare un cubo $Q$ con centro in $x$ interamente contenuto in $A$.
  Siano $x_1, dots, x_(2^n)$ i vertici di $Q$.
  Allora ogni punto del cubo è una combinazione convessa dei vertici e quindi il valore della funzione è inferiore alla combinazione convessa dei valori della funzione nei vertici e quindi, in particolare, è inferiore al valore massimo sui vertici.

  _Passo 2:_ mostriamo che $f$ è localmente inferiormente limitata.
  Fissiamo un punto $x_0 in A$ e un cubo $Q$ con centro in $x_0$ su cui $f$ è superiormente limitata da una costante $M$.
  Se $x in Q$ allora anche $x' = 2 x_0 - x$ è in $Q$ e si ha $x_0 = (x+x') / 2$.
  Quindi, per la convessità di $f$, si ha
  $ f(x_0) <= 1/2 f(x) + 1/2 f(x') $
  da cui
  $ f(x) >= 2 f(x_0) - f(x') >= 2f(x_0) - M. $

  _Conclusione._
  Dato $x_0 in A$ scegliamo $r>0$ per cui $m <= f(x) <= M$ per ogni $x in bar(B)_(2r)(x_0)$.
  Dati $x,y in B_r (x_0)$ se $y != x$ la semiretta uscente da $y$ passante per $x$ interseca la sfera $partial B_(2r)(x_0)$ in un punto $z$.
  Si avrà allora $x = (1-t) y + t z$ per un certo $t in (0,1)$ e per la convessità di $f$ avremo
  $ f(x) - f(y) <= (1-t) f(y) + t f(z) - f(y) = t (f(z) - f(y)) <= t (M-m). $
  Per stimare $t$, sappiamo che $|x-y| <= 2r$ mentre $|z-y| >= r$ e quindi
  $ t = (|x-y|) / (|z-y|) <= 2. $
  Dunque $f(x) - f(y) <= 2 (M-m) |x-y|$.
  Scambiando $x$ e $y$ otteniamo anche $f(y) - f(x) <= 2 (M-m) |x-y|$ e quindi la conclusione.
]

#definition[sottodifferenziale][
  Sia $A subset RR^n$ un insieme aperto convesso e sia $f: A -> RR$ una funzione convessa.
  Dato $x in A$ definiamo il _sottodifferenziale_ di $f$ in $x$ come l'insieme
  $ partial f(x) = {v in RR^n : f(y) >= f(x) + v dot (y-x) text(" per ogni ") y in A}. $
]

La condizione al primo ordine per la convessità di $f$ garantisce che se $f$ è convessa e differenziabile in $x$ allora $nabla f (x) in partial f(x)$.

#theorem[proprietà del sottodifferenziale][
  Sia $A subset RR^n$ un insieme aperto convesso e sia $f: A -> RR$ una funzione convessa.
  Allora per ogni $x in A$:
  + $partial f(x)$ è un insieme convesso;
  + $partial f$ è _crescente_ nel senso che per ogni $x,y in A$, $v in partial f(x)$ e $w in partial f(y)$ si ha
    $ (v-w) dot (y-x) >= 0; $
  + $partial f$ è _continuo_ nel senso che se $x_k -> x$ e $v_k in partial f(x_k)$ con $v_k -> v$ allora $v in partial f(x)$.
  + $f$ è differenziabile in $x$ se e solo se $partial f(x) = {nabla f(x)}$;
  + $partial f(x) != emptyset$ per ogni $x in A$.
]

#proof[
  Per mostrare che $partial f(x)$ è convesso, fissiamo $v,w in partial f(x)$ e $t in [0,1]$.
  Allora per ogni $y in A$ si ha
  $ f(y) &>= f(x) + v dot (y-x) \
    f(y) &>= f(x) + w dot (y-x) $
  da cui
  $ f(y) = (1-t) f(y) + t f(y) >= f(x) + ((1-t)v + t w) dot (y-x) $
  ovvero $(1-t)v + t w in partial f(x)$, che è quanto dovevamo dimostrare.

  Per mostrare che $partial f$ è crescente, fissiamo $v in partial f(x)$ e $w in partial f(y)$.
  Allora si ha
  $ f(y) &>= f(x) + v dot (y-x) \
    f(x) &>= f(y) + w dot (x-y). $
  Sommando le due disuguaglianze si ottiene il risultato.

  Per la continuità basta osservare che, grazie al teorema precedente, $f$ è continua e quindi si può passare al limite nella disuguaglianza che definisce $v_k in partial f(x_k)$.

  Per quanto riguarda la differenziabilità, abbiamo già osservato che $nabla f(x) in partial f(x)$ se $f$ è differenziabile in $x$.
  Ci rimane da dimostrare che se $xi, eta in partial f(x)$ e $xi != eta$ allora $f$ non è differenziabile in $x$.
  Se $xi != eta$ allora esiste $v in RR^n$ tale che $(xi-eta) dot v != 0$.
  Basta considerare la restrizione di $f$ alla retta passante per $x$ in direzione $v$.
  Sia $g(t) = f(x+t v)$, allora $g$ è convessa e
  $ g(t) &= f(x+t v) >= f(x) + xi dot (t v) = g(0) + t xi dot v \
    g(t) &= f(x+t v) >= f(x) + eta dot (t v) = g(0) + t eta dot v $
  da cui $g(t) - g(0) >= max({t xi dot v, t eta dot v})$.
  Significa che $g$ non è derivabile in $0$ e quindi $f$ non è differenziabile in $x$.

  Per dimostrare che $partial f(x) != emptyset$ per ogni $x in A$ consideriamo il piano di supporto all'epigrafo di $f$ in $(x,f(x))$.
  Tale piano non può essere verticale, altrimenti la funzione $f$ non sarebbe definita in un intorno di $x$.
]

#corollary[
  Sia $A subset RR^n$ un insieme aperto convesso e sia $f: A -> RR$ una funzione convessa.
  Allora $f$ è estremo superiore di una famiglia di funzioni lineari:
  $ f(x) = sup {f(z) + v dot (x-z) : z in A, v in partial f(z)}. $
]

#example[sottodifferenziale della norma][
  Sia $f(x) = |x|$, $f: RR^n -> RR$.
  Allora $partial f(x) = {x / |x|}$ se $x != 0$ e
  $ partial f(0) = bar(B)_1 (0). $
  Infatti se $x != 0$ allora $f$ è differenziabile in $x$ e $nabla f(x) = x / |x|$.
  Se $x=0$ allora $v in partial f(0)$ se e solo se $f(y) >= v dot y$ per ogni $y in RR^n$.
  Ma $|y| >= v dot y$ per ogni $y in RR^n$ se e solo se $|v| <= 1$.
]

#example[stadio][
  Sia $f: RR^2 -> RR$ definita da
  $ f(x,y) = cases(
    sqrt(x^2+y^2) &text("se ") x <= 0,
    |y| &text("se ") x in [0,1],
    sqrt((x-1)^2+y^2) &text("se ") x >= 1.
  ) $
  Allora se $x in [0,1]$ si ha
  $ partial f (x,0) = {0} times [-1,1]. $
]