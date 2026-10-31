#import "../../lib.typ": *

#exercise[formula per il volume della palla $n$-dimensionale][
  Il volume della palla unitaria di $RR^n$ è dato da:
  $ omega_n = pi^(n/2) / ((n/2)!) $
  Dove si intende $0! = 1$, $(1/2)! = sqrt(pi)/2$, $x! = x dot (x-1)!$.
]

#proof[
  L'impostazione del volume parte dalla definizione per ricorrenza della palla $n$-dimensionale:
  $ omega_n = integral_(-1)^1 omega_(n-1) (sqrt(1-x^2))^(n-1) thin d x $

  Applicando la sostituzione $x = cos t$, da cui otteniamo $d x = -sin t thin d t$ e $sqrt(1-x^2) = sin t$, l'integrale diventa:
  $ omega_n = -integral_pi^0 omega_(n-1) (sin t)^(n-1) sin t thin d t = omega_(n-1) integral_0^pi sin^n t thin d t $

  Definiamo la successione di integrali:
  $ I_n = integral_0^pi sin^n t thin d t $

  Sapendo che i casi base sono $I_0 = pi$ e $I_1 = 2$, ricaviamo la formula ricorsiva generale:
  $ I_n = (n-1)/n I_(n-2) $

  Sviluppando per induzione i termini pari e dispari, otteniamo i seguenti prodotti:
  - *Per indici pari:* $I_(2n) = ((2n-1)!!) / ((2n)!!) pi$
  - *Per indici dispari:* $I_(2n+1) = ((2n)!!) / ((2n+1)!!) 2$

  La relazione per il volume è $omega_n = I_n I_(n-1) omega_(n-2)$. Sostituendo le espressioni trovate per una dimensione pari $2n$, si ottiene:
  $ omega_(2n) = ((2n-1)!!) / ((2n)!!) pi ((2n-2)!!) / ((2n-1)!!) 2 omega_(2n-2) = (2pi) / (2n) omega_(2n-2) $

  Sviluppando la produttoria fino a $omega_0$ (con $omega_0 = 1$), arriviamo alla forma chiusa:
  $ omega_(2n) = (2pi) / (2n) dot (2pi) / (2n-2) dots (2pi) / 2 omega_0 = (2^n pi^n) / ((2n)!!) = pi^n / (n!) $

  Per una dimensione dispari $2n+1$, la relazione ricorsiva si imposta in modo analogo:
  $ omega_(2n+1) = ((2n)!!) / ((2n+1)!!) 2 ((2n-1)!!) / ((2n)!!) pi omega_(2n-1) = (2pi) / (2n+1) omega_(2n-1) $

  Sviluppando la produttoria fino a $omega_1 = 2$:
  $ omega_(2n+1) = (2pi) / (2n+1) dot (2pi) / (2n-1) dots (2pi) / 3 omega_1 $

  Sostituendo $omega_1 = 2$, possiamo raggruppare i termini al numeratore:
  $ omega_(2n+1) = (2^(n+1) pi^n) / ((2n+1)!!) $

  Sfruttando l'identità per il semifattoriale, ovvero $(n+1/2)! = ((2n+1)!!) / 2^n sqrt(pi)/2$, isoliamo il doppio fattoriale $(2n+1)!! = 2^(n+1) / sqrt(pi) (n+1/2)!$ e lo sostituiamo:
  $ omega_(2n+1) = (2^(n+1) pi^n) / (2^(n+1)/sqrt(pi) (n+1/2)!) = pi^(n+1/2) / ((n+1/2)!) $

  Unificando i risultati per una generica dimensione $k$ (sia essa pari o dispari), il volume della palla $k$-dimensionale risulta essere:
  $ omega_k = pi^(k/2) / ((k/2)!) $
]