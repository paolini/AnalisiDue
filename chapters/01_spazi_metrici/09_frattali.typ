#import "../../lib.typ": *

= Distanza di Hausdorff

In questo capitolo mostriamo una applicazione geometrica del teorema delle contrazioni.
Considereremo uno spazio metrico i cui punti sono le figure geometriche e vedremo che i frattali autosimili non sono altro che punti fissi di opportune mappe contrattive.

#definition[
  Siano $A$ e $B$ sottoinsiemi non vuoti di $RR^n$.
  Definiamo la _distanza di Hausdorff_ tra $A$ e $B$ come:
  $ d_cal(H)(A,B) = max({sup_(a in A) inf_(b in B) |a-b|, sup_(b in B) inf_(a in A) |a-b|}). $

  Definiamo
  $ cal(K)(RR^n) = {A subset RR^n : text("$A$ chiuso, limitato, non vuoto")}. $
]

#theorem[caratterizzazione della distanza di Hausdorff][
  Se $A$ e $B$ sono compatti di $RR^n$ (cioè chiusi e limitati) allora per ogni $r in RR$ si ha
  $ d_cal(H)(A,B) <= r $
  se e solo se valgono entrambe le seguenti proprietà:
  + per ogni $a in A$ esiste $b in B$ tale che $|a-b| <= r$;
  + per ogni $b in B$ esiste $a in A$ tale che $|a-b| <= r$.
]

#proof[
  Per ogni compatto non vuoto $A$ e per ogni $x in RR^n$ definiamo la distanza tra il punto $x$ e l'insieme $A$ come:
  $ d(x,A) = min_(a in A) |x-a|. $
  Il minimo esiste in quanto $A$ è compatto e $a |-> d(x,a)$ è una funzione continua. Fissato $A$ la funzione $x |-> d(x,A)$ è anch'essa continua, anzi è $1$-lipschitziana. Infatti se $x' in RR^n$ esiste $a' in A$ tale che $d(x',A) = d(x',a')$ e dunque
  $ d(x,A) = min_(a in A) |x-a| <= |x-a'| <= |x-x'| + |x'- a'| = |x-x'| + d(x',A) $
  da cui $d(x,A) - d(x',A) <= |x-x'|$.
  Scambiando $x$ e $x'$ si ottiene anche la disuguaglianza inversa da cui la $1$-lipschitzianità di $d(x,A)$. Dunque sui compatti la funzione $d(x,A)$ assume sempre massimo e si ha:
  $ d_cal(H)(A,B) = max({max_(a in A) d(a,B), max_(b in B) d(b,A)}). $

  In particolare se $d_cal(H)(A,B) <= r$ per ogni $a in A$ si deve avere $d(a,B) <= r$ e per ogni $b in B$ si deve avere $d(b,A) <= r$. Ma allora valgono le due proprietà dell'enunciato.

  Viceversa se vale la proprietà 1. allora $d(a,B) <= r$ e se vale la 2. $d(b,A) <= r$ e di conseguenza $d_cal(H)(A,B) <= r$.
]

#theorem[distanza di Hausdorff][
  La distanza di Hausdorff $d_cal(H)$ è una distanza su $cal(K)(RR^n)$ e lo spazio metrico $cal(K)(RR^n)$ è completo.
]

#proof[
  Chiaramente se $A,B$ sono non vuoti si ha $d_cal(H)(A,B) >= 0$.
  Inoltre, in base alla caratterizzazione del teorema precedente è facile osservare che $d_cal(H)(A,B) < +infinity$.

  Se $d_cal(H)(A,B) = 0$ significa che per ogni $a in A$ esiste $b in B$ tale che $|a-b|=0$. Cioè $b=a$. Dunque $A subset B$. Scambiando i ruoli di $A$ e $B$ si ottiene anche $B subset A$ da cui $A=B$.

  Che sia $d_cal(H)(A,B) = d_cal(H)(B,A)$ è ovvio in quanto la definizione è simmetrica in $A$ e $B$.

  Verifichiamo ora la disuguaglianza triangolare. Siano $A,B,C$ tre compatti non vuoti. Per ogni $a in A$ esiste $b in B$ tale che $|a-b| <= d_cal(H)(A,B)$ e per tale $b in B$ esiste un $c in C$ tale che $|b-c| <= d_cal(H)(B,C)$. Dunque per ogni $a in A$ esiste un $c in C$ tale che
  $ |a-c| <= |a-b| + |b-c| <= d_cal(H)(A,B) + d_cal(H)(B,C). $
  Scambiando i ruoli di $A$ e $C$ si ottiene anche la condizione simmetrica e dunque, per la caratterizzazione della distanza di Hausdorff si ottiene la disuguaglianza triangolare:
  $ d_cal(H)(A,C) <= d_cal(H)(A,B) + d_cal(H)(B,C). $

  Abbiamo quindi verificato che $d_cal(H)$ è una distanza su $cal(K)(RR^n)$. Verifichiamo ora che $cal(K)(RR^n)$ è completo.

  Sia $A_k in cal(K)(RR^n)$ una successione di Cauchy.
  Senza perdita di generalità possiamo supporre che
  $ d_cal(H)(A_k,A_(k+1)) <= 1 / 2^k. $
  Infatti essendo $A_k$ di Cauchy è possibile trovarne una sottosuccessione con tale proprietà, e se poi dimostriamo che la sottosuccessione converge allora l'intera successione, essendo di Cauchy, deve convergere.

  Consideriamo come candidato limite l'insieme di tutti i possibili limiti di punti degli insiemi $A_k$:
  $ A = {x in RR^n : exists x_k in A_k : x_k -> x}. $

  Per prima cosa vogliamo verificare che $A$ non è vuoto. Scelto un punto qualunque $a_0 in A_0$ esiste $a_1 in A_1$ tale che $|a_0 - a_1| = d_cal(H)(A_0,A_1)$. Iterando otteniamo una successione di punti $a_k in A_k$ tale che $|a_k - a_(k+1)| <= d_cal(H)(A_k,A_(k+1)) <= 1/2^k$.
  Dunque $a_k$ è una successione di Cauchy in $RR^n$ ed essendo $RR^n$ completo dovrà convergere ad un punto $a$ che quindi è un punto di $A$.

  Avendo assunto $d_cal(H)(A_k, A_(k+1)) < 1/2^k$ si ottiene (sommando la serie geometrica):
  $ d_cal(H)(A_k, A_n) <= sum_(j=k)^(n-1) d_cal(H)(A_j, A_(j+1)) <= 2 / 2^k quad text("se ") n > k. $
  Questo ci permette di dimostrare che per ogni $a in A$ e per ogni $k in NN$ esiste $a_k in A_k$ tale che $|a - a_k| <= 4/2^k$. Infatti se a distanza $4/2^k$ non ci fossero punti di $A_k$ allora a distanza $2/2^k$ non ci potrebbero essere punti di $A_n$ per nessun $n > k$ in quanto visto che $d_cal(H)(A_k,A_n) <= 2/2^k$ se ci fosse un punto di $A_n$ a distanza inferiore a $2/2^k$ ci dovrebbe anche essere un punto di $A_k$ a distanza inferiore a $4/2^k$. Ma questo è impossibile perché per come è definito $A$ deve esistere $x_n in A_n$ tale che $x_n -> a$. Abbiamo quindi mostrato che
  $ sup_(a in A) inf_(b in A_k) |a-b| <= 4/2^k -> 0. $

  Viceversa ci proponiamo di mostrare che per ogni $p in A_k$ esiste $a in A$ tale che $|p-a| < 2/2^k$.
  Visto che $d_cal(H)(A_(j+1),A_j) <= 1/2^j$ possiamo infatti costruire a partire da $a_k = p in A_k$ una successione $a_j in A_j$ con $j > k$, tale che $d(a_(j+1),a_j) <= 1/2^j$. Tale successione è di Cauchy quindi converge: $a_j -> a$ e il suo limite $a$ è quindi un punto di $A$ e si ha
  $ |a-p| <= sum_(j=k)^infinity |a_j - a_(j+1)| <= sum_(j=k)^infinity 1 / 2^j <= 2 / 2^k. $
  Abbiamo quindi dimostrato che
  $ sup_(b in A_k) inf_(a in A) |a-b| <= 2/2^k -> 0 $
  e quindi $d_cal(H)(A_k,A) -> 0$.

  Ci rimane solo da mostrare che $A$ è un insieme chiuso.
  Presa una successione di punti $x_k in A$ convergente $x_k -> x$, dobbiamo mostrare che $x in A$. Per ogni $x_k in A$ per quanto già detto sappiamo esistere $a_k in A_k$ tale che $|a_k-x_k| <= 4/2^k$. Ma allora $|a_k-a| <= 4/2^k + |x_k-a| -> 0$ e quindi $a_k -> a$ da cui $a in A$.
]

#theorem[frattali autosimilari][
  Siano $phi_1, dots, phi_N : RR^n -> RR^n$ contrazioni (cioè funzioni lipschitziane con costante di lipschitz inferiore ad $1$).
  Allora esiste un unico insieme $C subset RR^n$ chiuso e limitato tale che
  $ C = union.big_(k=1)^N phi_k(C). $
]

#proof[
  Basterà dimostrare che la funzione $T: cal(K)(RR^n) -> cal(K)(RR^n)$ definita da
  $ T(A) = union.big_(k=1)^N phi_k(A) $
  è una contrazione: dopodiché sapendo che $cal(K)(RR^n)$ è completo il risultato è conseguenza diretta del teorema di punto fisso di Banach-Caccioppoli.

  Ogni $phi_k$ per ipotesi è una contrazione, cioè per ogni $a,b in X$
  $ |phi_k(a)-phi_k(b)| <= L_k |a-b| $
  con $L_k < 1$. Posto $L = max({L_1, dots, L_N}) < 1$ vogliamo dimostrare che $T$ è $L$-lipschitziana (e dunque una contrazione). Siano $A,B in cal(K)(RR^n)$ e sia $d = d_cal(H)(A,B)$. Preso $a' in T(A)$ dovrà esistere $k$ tale che $a' in phi_k(A)$. Cioè $a' = phi_k(a)$ con $a in A$. Ma allora esiste $b in B$ con $|a-b| <= d_cal(H)(A,B) = d$ e quindi $b' = phi_k(b) in T(B)$ e $|a'-b'| = |phi_k(a)-phi_k(b)| <= L |a-b| <= L dot d$. Dunque abbiamo mostrato che
  $ sup_(a' in T(A)) inf_(b' in T(B)) |a'-b'| <= L d_cal(H)(A,B). $
  La stessa disuguaglianza rimane valida con $A$ e $B$ scambiati, ottenendo quindi:
  $ d_cal(H)(T(A),T(B)) <= L dot d_cal(H)(A,B). $
]

#example[insieme di Cantor][
  Si prendano $phi, psi : RR -> RR$ definite da
  $ phi(x) = x / 3, quad psi(x) = (2+x) / 3. $
  Chiaramente $phi$ e $psi$ sono $1/3$-lipschitziane e dunque, per il teorema precedente, esiste un unico insieme $C$ chiuso e limitato in $RR$ tale che
  $ C = C / 3 union (C+2) / 3. $
  Tale insieme si chiama _insieme di Cantor_.

  L'insieme di Cantor è un frattale autosimile in quanto si ottiene come l'unione di due copie riscalate di sé stesso.

  È facile mostrare che $C subset [0,1]$ in quanto $T$ manda sottoinsiemi di $[0,1]$ in sottoinsiemi di $[0,1]$.
  Ogni $x in [0,1]$ può essere rappresentato in base $3$ con una sequenza di cifre ternarie: $0,1,2$. La funzione $phi(x)$ aggiunge uno $0$ in cima alla sequenza di cifre, mentre la funzione $psi(x)$ aggiunge un $2$ in cima alla sequenza.
  Vogliamo mostrare che $C$ è l'insieme di tutti i numeri in $[0,1]$ che possono essere scritti in base $3$ utilizzando solamente le cifre $0$ e $2$. Osserviamo innanzitutto che $C$ è chiuso: il suo complementare in $[0,1]$ è formato da tutti i numeri che in base $3$ si devono scrivere utilizzando almeno una cifra $1$. Ma se c'è una cifra $1$ posso modificare tutte le cifre successive rimanendo nel complementare di $C$: dunque il complementare di $C$ è aperto. Si osservi che gli unici numeri che hanno una doppia rappresentazione in base $3$ sono quelli che terminano con una sequenza infinita di $2$,
] <ex:insieme_Cantor>

#figure(
  image("../../figure/koch_picture.pdf", width: 100%),
  caption: [
    Chiamato $K_0 in RR^2$ il segmento $[0,1] times {0}$, in figura è rappresentata la quarta iterata $K_4 = T^4(K_0)$ della contrazione che definisce la curva di Koch.
    A pagina \@code:Koch il codice per generare la figura.
  ],
) <fig:koch>

#example[curva di Koch][
  Sia $R_theta : RR^2 -> RR^2$ la rotazione con centro l'origine di $theta$ radianti in senso antiorario.
  Sia $alpha = pi/3$, $p=(1,0)$ e siano $phi_1, phi_2, phi_3, phi_4 : RR^2 -> RR^2$ le funzioni definite da:
  $ phi_1(v) &= v / 3, quad &phi_2(v) = R_alpha v / 3 + phi_1(p), \
    phi_3(v) &= R_(-alpha) v / 3 + phi_2(p), quad &phi_4(v) = v / 3 + phi_3(p). $
  Allora esiste un unico insieme chiuso $K subset RR^2$ tale che
  $ K = phi_1(K) union phi_2(K) union phi_3(K) union phi_4(K). $
  L'insieme $K$ si chiama _curva di Koch_.
  È un frattale autosimile in quanto è composto da quattro copie riscalate di se stesso.
]