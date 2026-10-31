#import "../../lib.typ": *

Norme equivalenti sullo spazio delle matrici. Lipschitzianità delle funzioni $C^1$.
Le funzioni continue mandano compatti in compatti.
Se $A,B$ sono compatti, se $f: A -> B$ e continua e bigettiva allora $f^(-1)$ è continua (cioè $f$ è un omeomorfismo).

#exercise[punto di frontiera][
  Sia $gamma: [0,1] -> X$ una curva continua in uno spazio topologico $X$ e sia $A subset X$ tale che $gamma(0) in A$ e $gamma(1) not in A$.
  Dimostrare che esiste $t in [0,1]$ tale che $gamma(t) in partial A$.
] <ex:punto-di-frontiera>

#theorem[Teorema spettrale][
  Sia $V$ uno spazio euclideo di dimensione $n$ e sia $A: V times V -> RR$ una forma bilineare simmetrica.
  Allora esiste una base ortonormale $v_1, dots, v_n$ di $V$ tale che $L(v_j,v_k) = 0$ se $j != k$.

  Equivalentemente, se $A$ è una matrice reale simmetrica $n times n$, allora esiste una matrice ortogonale $P$ (cioè $P^t=P^(-1)$) tale che $P^t A P$ è diagonale.
]

#proof[
  La corrispondenza tra i due enunciati si ottiene considerando la matrice $P$ le cui colonne sono i vettori $v_1, dots, v_n$.

  Faremo la dimostrazione per induzione sulla dimensione $n$ di $V$.
  Se $n=0$ il risultato è banale.
  Supponiamo dunque $n>0$ e supponiamo per induzione che il teorema sia vero per spazi di dimensione $n-1$.

  Senza perdere di generalità possiamo supporre che sia $V = RR^n$.
  Consideriamo la funzione $f(x) = x^t A x$, $f: RR^n -> RR$ e restringiamo la funzione $f$ alla sfera unitaria $S^(n-1) = {x in RR^n : |x| = 1}$.
  Per il teorema di Weierstrass $f$ ha minimo in un punto $v_1$ su $S^(n-1)$ e per il teorema dei moltiplicatori di Lagrange esiste $lambda in RR$ tale che $nabla f(v_1) = lambda nabla g(v_1)$ dove $g(x) = |x|^2$. Ma $nabla f(x) = 2 A x$ e $nabla g(x) = 2 x$, quindi si ottiene $A v_1 = lambda v_1$.

  Sia $V_1 = v_1^bot$ lo spazio ortogonale a $v_1$ (rispetto al prodotto scalare canonico di $RR^n$).
  Visto che $A$ è simmetrico, se $(w,v_1)=0$ allora $(A w,v_1) = (A v_1,w) = lambda (v_1,w) = 0$.
  Questo significa che $A$ manda $V_1$ in se stesso.
  L'ipotesi induttiva garantisce dunque l'esistenza di una base ortonormale $v_2, dots, v_n$ per cui $(A v_j,v_k) = 0$ se $j != k$, $j,k >= 2$.
  Ma per $k >= 2$ si ha anche $(A v_k,v_1) = (A v_1,v_k) = lambda (v_1,v_k) = 0$.
  Dunque la base ortonormale $v_1, v_2, dots, v_n$ soddisfa la tesi.
]

#theorem[decomposizione singolare][
  Sia $V$ uno spazio vettoriale euclideo di dimensione $n$ e sia $W$ uno spazio vettoriale euclideo di dimensione $m$.
  Sia $L: V -> W$ una applicazione lineare.
  Allora esistono basi ortonormali $v_1, dots, v_n$ di $V$ e $w_1, dots, w_m$ di $W$ tali che $(L v_k, w_j) = 0$ se $j != k$.

  Equivalentemente se $L$ è una matrice reale $m times n$ esistono due matrici ortogonali $U$ di ordine $m$ e $V$ di ordine $n$ tali che $U^t L V$ è una matrice diagonale $m times n$.
] <th:decomposizione_singolare>

#proof[
  Nel caso $n=0$ o $m=0$ la dimostrazione è banale perché uno dei due spazi avrà una base vuota e per l'altro qualunque base ortonormale va bene.
  Supponiamo dunque $n>0$ e $m>0$ e supponiamo per induzione che il teorema sia vero per spazi di dimensione $n-1$ e $m-1$.

  Consideriamo la funzione $f: RR^n times RR^m -> RR$ definita da $f(x,y) = (L x, y)$.
  Restringiamo $f$ al compatto $K = S^(n-1) times S^(m-1)$ formato dai punti $(x,y) in RR^n times RR^m$ tali che $|x| = 1$ e $|y| = 1$.
  Posto $g_1(x,y) = 1/2 |x|^2$ e $g_2(x,y) = 1/2 |y|^2$, si ha $K = {(x,y) : g_1(x,y) = 1/2, g_2(x,y) = 1/2}$.
  Per il teorema di Weierstrass $f$ ha minimo in un punto $(v_1,w_1) in K$ e per il teorema dei moltiplicatori di Lagrange, si deve avere $nabla f(v_1,w_1) = lambda nabla g_1(v_1,w_1) + mu nabla g_2(v_1,w_1)$.
  Un facile calcolo mostra che $nabla f(x,y) = (L^t y, L x)$, mentre $nabla g_1(x,y) = (x,0)$ e $nabla g_2(x,y) = (0,y)$.
  Dunque si ottiene
  $ L^t w_1 = lambda v_1, quad L v_1 = mu w_1. $
  Sia $V_1 = v_1^bot subset RR^n$ e sia $W_1 = w_1^bot subset RR^m$.
  Mostriamo che $L$ manda $V_1$ in $W_1$.
  Infatti se $x in V_1$ allora $(x,v_1) = 0$ e quindi
  $ (L x, w_1) = (x, L^t w_1) = (x, lambda v_1) = 0. $
  Inoltre $w_1$ è ortogonale a $L(V_1)$, in quanto se $y = L x$ per qualche $x in V_1$ allora
  $ (y,w_1) = (L x, w_1) = (x, L^t w_1) = (x, lambda v_1) = 0. $
  Per ipotesi induttiva esistono delle basi ortonormali $v_2, dots, v_n$ di $V_1$ e $w_2, dots, w_m$ di $W_1$ tali che $(L v_k, w_j) = 0$ se $j != k$, $j >= 2$, $k >= 2$.
  Ovviamente $v_1, v_2, dots, v_n$ è una base ortonormale di $V$ e $w_1, w_2, dots, w_m$ è una base ortonormale di $W$.
  Per $j >= 2$ si ha
  $ (L v_1, w_j) = mu (w_1, w_j) = 0 $
  e per $k >= 2$
  $ (L v_k, w_1) = (v_k, L^t w_1) = (v_k, lambda v_1) = 0 $
  dunque la tesi $(L v_k, w_j) = 0$ è verificata per ogni $k != j$.
]

= Discesa lungo il gradiente (algoritmo discreto)

Sia $f: RR^n -> RR$ una funzione di classe $C^1$ coerciva (cioè $f(x) -> +infinity$ per $|x| -> +infinity$).
Per il teorema di Weierstrass generalizzato sappiamo che $f$ ammette minimo.

Il metodo di discesa lungo il gradiente è un algoritmo usato per determinare tale minimo.
L'idea è quella di partire da un punto $x$ qualunque (possibilmente vicino al minimo) e cercare il minimo muovendosi lungo la semiretta uscente da $x$ in direzione $-nabla f(x)$.
Sappiamo che questa è la direzione di massima discesa e quindi ci aspettiamo di avvicinarci al punto di minimo.

La funzione $g(t) = f(x - t nabla f(x))$ tende a $+infinity$ per $t -> +infinity$, dunque per il teorema di Weierstrass generalizzato, in una variabile, ammette minimo assoluto per $t in [0,+infinity)$.
Denotiamo con $bar(t)(x)$ tale punto di minimo assoluto.

Fissato allora $x_0 in RR^n$ possiamo costruire una successione definita ricorsivamente da
$ x_(n+1) = x_n - bar(t)(x_n) nabla f(x_n). $ <eq:discesa_discreta>

#theorem[
  Sia $f: RR^n -> RR$ una funzione di classe $C^1$ coerciva.
  Sia $x_n$ una successione definita per ricorrenza tramite la @eq:discesa_discreta. Allora
  + $chevron.l x_(n+2)-x_(n+1), x_(n+1)-x_n chevron.r = 0$ per ogni $n in NN$;
  + $f(x_n)$ è decrescente;
  + $x_n$ è limitata e quindi ha punti di accumulazione;
  + se $bar(x)$ è un punto di accumulazione per $x_n$ allora $nabla f(bar(x))=0$.

  In particolare se $f$ ha un unico punto critico la successione converge a tale punto.
]

#proof[
  Visto che $f(x_(n+1))$ è il minimo della funzione ristretto ad una semiretta uscente da $x_n$ è ovvio che $f(x_(n+1)) <= f(x_n)$ dunque esiste $ell = lim f(x_n)$.
  Inoltre $ell in RR$ in quanto $f(x_n)$ è decrescente e $f$ è inferiormente limitata.
  Dunque anche $x_n$ è limitata perché altrimenti si avrebbe $limsup f(x_n) = +infinity$ per la coercività.

  Se $nabla f(x_n) != 0$ la funzione $g(t) = f(x_n - t nabla f(x_n))$ ha derivata negativa per $t=0$, infatti $g'(0) = chevron.l nabla f(x_n), -nabla f(x_n) chevron.r < 0$ e quindi $g(t) < g(0)$ in un intorno destro di $t=0$.
  Significa che in tal caso $f(x_(n+1)) < f(x_n)$.
  Viceversa se $nabla f(x_n) = 0$ si ha $x_(n+1) = x_n$ e la successione rimane definitivamente nel punto critico (per cui il teorema è dimostrato).

  Possiamo dunque assumere che $nabla f(x_n) != 0$ per ogni $n in NN$ e che quindi $f(x_n)$ sia strettamente decrescente.
  Se $g(t) = f(x_n - t nabla f(x_n))$ sappiamo che nel punto $bar(t)(x_n) > 0$ la funzione $g(t)$ ha minimo e quindi $g'(bar(t)(x_n)) = 0$.
  Ma
  $ g'(t) = - chevron.l nabla f(x_n - t nabla f(x_n)), nabla f(x_n) chevron.r $
  e dunque $chevron.l nabla f(x_(n+1)), nabla f(x_n) chevron.r = 0$ da cui segue $chevron.l x_(n+2) - x_(n+1), x_(n+1) - x_n chevron.r = 0$.

  _Affermazione:_ se $nabla f(bar(x)) != 0$ esiste $rho > 0$ tale che per ogni $x in B_rho (bar(x))$ esiste $t > 0$ tale che $f(x - t nabla f(x)) <= f(bar(x))$.

  Sia $C = {x : 2 chevron.l x - bar(x), -nabla f(bar(x)) chevron.r > |x - bar(x)|}$ il cono di ampiezza 120 gradi centrato in $bar(x) = 0$ con asse in direzione $-nabla f(bar(x))$.
  Esiste $R > 0$ sufficientemente piccolo per cui se $x in C inter B_R (bar(x))$ si ha $chevron.l nabla f(x), nabla f(bar(x)) chevron.r > 0$ e quindi essendo $chevron.l nabla f(x), x - bar(x) chevron.r < 0$ si ottiene $f(x) <= f(bar(x))$.
  Ora basta osservare che se $rho > 0$ è sufficientemente piccolo per ogni $x in B_rho (bar(x))$ la semiretta $x - t nabla f(x)$ incontra certamente $C inter B_R (bar(x))$ visto che la direzione è interna al cono, e la distanza dal vertice è piccola.
  Questo conclude la dimostrazione della affermazione.

  Ora se $bar(x)$ è un punto di accumulazione per la successione $x_n$ e se fosse $nabla f(bar(x)) != 0$, ci sarebbe un $x_n$ sufficientemente vicino a $bar(x)$ in modo che per un qualche $t > 0$ si avrebbe $f(x_(n+1)) <= f(x_n + t nabla f(x)) <= f(bar(x))$.
  Ma $f(bar(x)) = liminf f(x_n) = ell$ e quindi si ottiene un assurdo avendo assunto che $f(x_n)$ è strettamente decrescente.
  Deve quindi essere $nabla f(bar(x)) = 0$.
]