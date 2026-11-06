#import "../../lib.typ": *

== invertibilità locale e funzione implicita

#theorem[Lagrange vettoriale][
  Sia $Omega subset RR^n$ un aperto convesso, sia $vec(f): Omega -> RR^m$ una funzione differenziabile.
  Allora dati $vec(x), vec(y) in Omega$, $vec(x) != vec(y)$, esiste $vec(z) in [vec(x), vec(y)]$ (il segmento che congiunge $vec(x)$ e $vec(y)$) tale che
  $ |vec(f)(vec(y)) - vec(f)(vec(x))|^2 = D vec(f)(vec(z))[vec(y) - vec(x)] dot (vec(f)(vec(y)) - vec(f)(vec(x))). $
  In particolare si ha
  $ |vec(f)(vec(y)) - vec(f)(vec(x))| <= max_(vec(z) in [vec(x), vec(y)]) |D vec(f)(vec(z))| dot |vec(y) - vec(x)|. $
] <th:lagrange>

#proof[
  Basta applicare il teorema di Lagrange alla funzione $g: [0,1] -> RR$
  $ g(t) &= chevron.l f(vec(x) + t(vec(y) - vec(x))), f(vec(y)) - f(vec(x)) chevron.r \
    g'(t) &= chevron.l D f(vec(x) + t(vec(y) - vec(x)))[vec(y) - vec(x)], f(vec(y)) - f(vec(x)) chevron.r $
  per ottenere che esiste $t in [0,1]$ e $z = vec(x) + t(vec(y) - vec(x))$ per cui
  $ |f(vec(y)) - f(vec(x))|^2
      &= g(1) - g(0) = g'(t) \
      &= chevron.l D f(z)[vec(y) - vec(x)], f(vec(y)) - f(vec(x)) chevron.r. $
]

#theorem[invertibilità locale][
  Sia $A$ un aperto di $RR^n$, $f in C^1(A,RR^n)$, $x_0 in A$ e supponiamo che $D f(x_0)$ sia invertibile.
  Allora esiste $delta > 0$ tale che $f(B_delta (x_0))$ è aperto, e la restrizione $f: B_delta (x_0) -> f(B_delta (x_0))$ è invertibile con inversa di classe $C^1$.
  Inoltre per ogni $x in B_delta (x_0)$
  $ D f^(-1)(f(x)) = (D f(x))^(-1). $
]

#proof[
  Sia $M = (D f(x_0))^(-1)$.
  Siccome $A$ è aperto e $D f$ è continuo, possiamo scegliere $rho > 0$ in modo che
  $ macron(B)_rho (x_0) subset A quad text("e") quad norm(D f(x) - D f(x_0)) <= 1 / (2 norm(M)) quad forall x in macron(B)_rho (x_0). $
  Poniamo $r = rho / (2 norm(M))$ e $y_0 = f(x_0)$.
  Fissato $macron(y) in B_r (y_0)$ consideriamo l'applicazione
  $ T: macron(B)_rho (x_0) &-> RR^n \
    T(x) &= x + M[macron(y) - f(x)]. $

  Si ha, per $x in macron(B)_rho (x_0)$,
  $ norm(D T(x)) = norm(op("Id") - M D f(x)) <= norm(M (D f(x_0) - D f(x))) <= 1/2 $
  e quindi, per il criterio di Lipschitz, la funzione $T$ è $1/2$-lipschitziana.

  Verifichiamo anche che $T(macron(B)_rho (x_0)) subset macron(B)_rho (x_0)$.
  Infatti, per $x in macron(B)_rho (x_0)$, si ha
  $ |T(x) - x_0|
      &<= |T(x) - T(x_0)| + |T(x_0) - x_0| \
      &<= 1/2 |x - x_0| + |M(macron(y) - y_0)| \
      &<= rho / 2 + norm(M) r <= rho. $

  Dunque $T: macron(B)_rho (x_0) -> macron(B)_rho (x_0)$ è una contrazione, $macron(B)_rho (x_0)$ è uno spazio metrico completo e quindi, per il Teorema delle contrazioni, esiste un'unica soluzione dell'equazione $T(x)=x$, cioè esiste un unico punto $x$ in $macron(B)_rho (x_0)$ per cui $f(x)=macron(y)$.

  Dato $y in B_r (y_0)$ chiamiamo $g(y)$ l'unico $x in macron(B)_rho (x_0)$ per cui $f(x)=y$.
  Abbiamo quindi definito una funzione $g: B_r (y_0) -> macron(B)_rho (x_0)$ tale che $f(g(y)) = y$.

  Mostriamo ora che $g$ è lipschitziana. Fissati $y, macron(y) in B_r (y_0)$ consideriamo la mappa $T(x) = x + (D f(x))^(-1)[macron(y) - f(x)]$ già considerata prima.
  Ricordando che $T$ è $1/2$-lipschitziana, scopriamo che
  $ 1/2 |g(y) - g(macron(y))|
      &>= |T(g(y)) - T(g(macron(y)))| \
      &= |g(y) - g(macron(y)) + (D f(g(macron(y))))^(-1)[macron(y) - f(g(y))]| \
      &>= |g(y) - g(macron(y))| - norm((D f(g(macron(y))))^(-1)) dot |y - macron(y)| $
  da cui
  $ |g(y) - g(macron(y))| <= (|y - macron(y)|) / (2 norm((D f(g(macron(y))))^(-1))) <= L |y - macron(y)| $
  in quanto $norm((D f(x))^(-1))$ è una funzione continua su $macron(B)_rho (x_0)$ e dunque ammette minimo (non nullo visto che la matrice inversa non è mai nulla).

  Dunque per $y -> macron(y)$ si ha $g(y) -> g(macron(y))$ e possiamo dunque scrivere la differenziabilità di $f$ in $g(macron(y))$ per $y -> macron(y)$,
  $ y - macron(y) = f(g(y)) - f(g(macron(y))) = D f(g(macron(y)))[g(y) - g(macron(y))] + o(|y - macron(y)|) $
  da cui si ricava
  $ g(y) - g(macron(y))
      &= (D f(g(macron(y))))^(-1)[y - macron(y) + o(|y - macron(y)|)] \
      &= (D f(g(macron(y))))^(-1)[y - macron(y)] + o(|y - macron(y)|) $
  ovvero $g$ è differenziabile in $macron(y)$ e si ha, come volevamo dimostrare,
  $ D g(macron(y)) = (D f(g(macron(y))))^(-1). $
  Visto che $D f$ è continua e $g$ è continua anche $D g$ è continua, e quindi $g$ è $C^1$.

  La dimostrazione è conclusa.
  Per la continuità di $f$ esiste $delta > 0$ per cui $f(B_delta (x_0)) subset B_r (y_0)$.
  Preso $V = g^(-1)(B_delta (x_0))$ sappiamo che $V$ è aperto per la continuità di $g$, e $g: V -> B_delta (x_0)$ è bigettiva e la sua inversa è la restrizione di $f$ a $B_delta (x_0)$.
]

#theorem[funzione implicita, Dini][
  Sia $Omega$ un aperto di $RR^n times RR^m$ e sia $f in C^1(Omega, RR^m)$. Sia $(x_0,y_0) in Omega subset RR^n times RR^m$.
  Se la matrice $D_y f(x_0,y_0)$ delle derivate di $f(x,y)$ rispetto alle variabili $y$
  $ D_y f(x_0,y_0) = mat((partial f^j) / (partial y^k) (x_0,y_0))_(j,k) quad j=1, dots, m quad k=1, dots, m $
  è invertibile, allora esiste un intorno $U subset RR^n$ di $x_0$ e una funzione $g in C^1(U, RR^m)$ tale che
  $ f(x,g(x)) = f(x_0,y_0) quad forall x in U. $
  Inoltre, per $y=g(x)$ si ha
  $ D g(x) = - (D_y f(x,y))^(-1) D_x f(x,y). $
]

#proof[
  Consideriamo la funzione $tilde(f) in C^1(Omega, RR^n times RR^m)$
  $ tilde(f)(x,y) = (x, f(x,y)). $
  Si trova facilmente che
  $ D tilde(f)(x,y) = mat(augment: #(hline: 1, vline: 1), op("Id"), 0; D_x f, D_y f) $
  dove $op("Id")$ è la matrice identità $n times n$.
  Dunque essendo $D_y f(x_0,y_0)$ invertibile, anche $D tilde(f)(x_0,y_0)$ lo è e posso applicare il teorema di invertibilità locale a $tilde(f)$.
  Dunque esisterà una funzione $tilde(g)$ di classe $C^1$ in un intorno di $(x_0, f(x_0,y_0))$ tale che $tilde(f)(tilde(g)(x,y)) = (x,y)$.
  Posto $tilde(g)(x,y) = (g_1 (x,y), g_2 (x,y))$ con $g_1$ a valori in $RR^n$, e $g_2$ a valori in $RR^m$ si ha dunque
  $ (x,y) = tilde(f)(g_1 (x,y), g_2 (x,y)) = (g_1 (x,y), f(g_1 (x,y), g_2 (x,y))) $
  da cui si ottiene $g_1 (x,y) = x$ e $f(x, g_2 (x,y)) = y$.
  Basterà dunque porre $g(x) = g_2 (x, f(x_0,y_0))$ per ottenere $f(x,g(x)) = f(x_0,y_0)$.

  Per dimostrare la formula di calcolo di $D g$ è sufficiente differenziare l'equazione
  $ f(x,g(x)) = f(x_0,y_0) $
  per ottenere
  $ D_x f(x,g(x)) + D_y f(x,g(x)) D g(x) = 0 $
  da cui la tesi.
]