#import "../../lib.typ": *

= Formula di Cauchy-Binet

#theorem[formula di Cauchy-Binet][
  Siano $A$ una matrice $m times n$ e $B$ una matrice $n times m$.
  Allora
  $ det(A B) = sum_(arrow(k)) det A^arrow(k) dot det B_arrow(k) $
  dove $arrow(k) = (k_1, dots, k_m) in {1, dots, n}^m$ è un elenco crescente di indici: $1 <= k_1 < dots < k_m <= n$ e $A^arrow(k)$ e $B_arrow(k)$ sono le matrici $m times m$ che rappresentano i _minori_ di $A$ e $B$:
  $ (A^arrow(k))_(i,j) = A_(i,k_j), quad (B_arrow(k))_(i,j) = B_(k_i, j). $
]

#proof[
  Denotiamo con $Sigma_m$ il gruppo delle permutazioni di ${1, dots, m}$ e con $(-1)^sigma$ il segno della permutazione.
  Si ha
  $ det(A B)
      &= sum_(sigma in Sigma_m) (-1)^sigma product_(i=1)^m (A B)_(i,sigma(i)) \
      &= sum_sigma (-1)^sigma product_(i=1)^m sum_(k=1)^n A_(i,k) B_(k,sigma(i)) \
      &= sum_sigma (-1)^sigma sum_(k_1=1)^n dots sum_(k_m=1)^n product_(i=1)^m A_(i,k_i) B_(k_i,sigma(i)) \
      &= sum_(k_1, dots, k_m = 1)^n product_(i=1)^m A_(i,k_i) sum_sigma (-1)^sigma product_(i=1)^m B_(k_i,sigma(i)) \
      &= sum_(arrow(k) in {1, dots, n}^m) product_(i=1)^m A_(i,k_i) det B_arrow(k) $

  Notiamo ora che se $arrow(k) = (k_1, dots, k_m)$ non è iniettiva, cioè se $k_i = k_j$ per qualche $i != j$, la matrice $B_arrow(k)$ ha due righe uguali e quindi $det B_arrow(k) = 0$.
  Possiamo dunque restringere $arrow(k)$ alle funzioni iniettive.
  Se $arrow(k) : {1, dots, m} -> {1, dots, n}$ è iniettiva c'è una unica permutazione $phi$ tale che $i |-> k_(phi(i))$ è strettamente crescente.
  Dunque ogni $arrow(k)$ iniettiva si ottiene prendendo tutte le $arrow(k)$ strettamente crescenti e componendole con tutte le permutazioni $phi$ di ${1, dots, m}$.
  Dunque
  $ det(A B)
      &= sum_(1 <= k_1 < dots < k_m <= n) sum_(phi in Sigma_m) product_i A_(i, k_(phi(i))) det B_(arrow(k) compose phi) \
      &= sum_(phi in Sigma_m) sum_(1 <= k_1 < dots < k_m <= n) product_i A_(i, k_(phi(i))) (-1)^phi det B_arrow(k) \
      &= sum_(1 <= k_1 < dots < k_m <= n) det A^arrow(k) det B_arrow(k) $
  avendo usato il fatto che $det B_(arrow(k) compose phi)$ si ottiene da $det B_arrow(k)$ scambiando le righe secondo la permutazione $phi$, ogni scambio di righe cambia segno al determinante e dunque si ha $det B_(arrow(k) compose phi) = (-1)^phi det B_arrow(k)$.
]