#import "../../lib.typ": *

#theorem[delle contrazioni o punto fisso di Banach-Caccioppoli][
  Sia $X$ uno spazio metrico completo non vuoto e sia $f: X -> X$ una funzione $L$-lipschitziana con $L < 1$ (diremo che $f$ è una _contrazione_).
  Allora esiste ed è unico un punto $x in X$ tale che $f(x) = x$.
] <th:banach-caccioppoli>

#proof[
  Si consideri un qualunque punto $p in X$ e si definisca la successione $x_k in X$ tramite la definizione ricorsiva
  $ cases(
    x_0 = p,
    x_(k+1) = f(x_k).
  ) $
  Visto che $f$ è $L$-lipschitziana si avrà
  $ d(x_2, x_1) &= d(f(x_1), f(x_0)) <= L dot d(x_1, x_0) \
    d(x_3, x_2) &= d(f(x_2), f(x_1)) <= L dot d(x_2, x_1) <= L^2 dot d(x_1, x_0) \
    d(x_4, x_3) &= d(f(x_3), f(x_2)) <= L dot d(x_3, x_2) <= L^3 dot d(x_1, x_0) \
    & dots.v $
  possiamo quindi dimostrare induttivamente che per ogni $m in NN$ si ha
  $ d(x_(m+1), x_m) <= L^m dot d(x_1, x_0). $
  Ma allora per ogni $k in NN$ e per ogni $j > k$ utilizzando la disuguaglianza triangolare e facendo la somma della progressione geometrica si ha
  $ d(x_k, x_j) <= sum_(m=k)^(j-1) d(x_m, x_(m+1)) <= sum_(m=k)^(j-1) L^m dot d(x_1, x_0) = (L^k - L^j) / (1 - L) d(x_1, x_0). $
  Visto che $L < 1$ se $k -> +infinity$ e $j > k$ questa quantità tende a zero e quindi risulta che $x_k$ è una successione di Cauchy. Essendo per ipotesi $X$ completo sappiamo che la successione converge $x_k -> x$ ad un punto $x in X$.
  Per la continuità di $f$, passando al limite nell'equazione $x_(k+1) = f(x_k)$ si ottiene $x = f(x)$.
  Abbiamo quindi trovato un punto fisso.
  Se $y in X$ fosse un altro punto fisso si avrebbe:
  $ d(x, y) = d(f(x), f(y)) <= L dot d(x, y) $
  che è assurdo se $L < 1$ e $x != y$.
]