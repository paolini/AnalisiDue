#import "../../lib.typ": *

= Topologia degli spazi metrici

#definition[distanza indotta][
  Se $d: X times X -> RR$ è una distanza su $X$ e $A subset X$ allora restringendo $d$ ad $A times A$ si ottiene ancora (ovviamente) una distanza. Tale restrizione si chiama _distanza indotta_ da $X$ su $A$. Dunque se $A$ è un sottoinsieme di uno spazio metrico $(X, d)$ anche $A$ ha una struttura di spazio metrico.
]

#example[sfera][
  Se $X subset RR^n$ la distanza euclidea di $RR^n$ induce su $X$ una struttura di spazio metrico. Se $X$ non è un sottospazio vettoriale di $RR^n$ abbiamo quindi esempi di spazi metrici che non sono spazi normati. Ad esempio la _sfera $n$-dimensionale_
  $ bb(S)^n = { vec(x) in RR^(n+1) : abs(vec(x)) = 1 } $
  è uno spazio metrico con la distanza indotta da $RR^n$.

  Per $n=1$ si osserva che $bb(S)^1$ è la circonferenza unitaria nel piano, per $n=2$ si ottiene l'usuale sfera unitaria immersa nello spazio tridimensionale.
]

#definition[palla][
  Sia $(X, d)$ uno spazio metrico. Per ogni $r > 0$ e per ogni $x_0 in X$ definiamo la _palla_ di raggio $r$ centrata in $x_0$ come l'insieme
  $ B_r(x_0) = { x in X : d(x, x_0) < r }. $
] <def:palla>

#figure(
  [
    // TODO: Convertire diagramma TikZ in fletcher o immagine
    _[Diagramma TikZ da convertire]_
  ],
  caption: [Un insieme $A$ e la sua parte interna $accent(A, ∘)$, parte esterna, frontiera $partial A$, chiusura $overline(A)$ e punti di accumulazione $A'$.],
) <fig:int_ext_front>

#definition[relazioni e proprietà topologiche][
  Sia $(X, d)$ uno spazio metrico. Un insieme $A subset X$ si dirà essere un insieme _aperto_ in $X$ se per ogni $x in A$ esiste $r > 0$ tale che $B_r(x) subset A$. Un insieme $A subset X$ si dirà essere un insieme _chiuso_ in $X$ se il suo complementare $X without A$ è aperto.

  La famiglia di tutti gli insiemi aperti si chiama _topologia_ dello spazio metrico $X$. Tutte le definizioni che seguono non dipendono dalla distanza $d$ ma solamente dalla topologia: basterà usare aperti qualunque al posto delle palle $B_r(x)$.

  Se $A subset X$ è un insieme qualunque e $x in X$ è un punto qualunque diremo che:
  + $x$ è _punto interno_ ad $A$ se esiste $r > 0$ tale che $B_r(x) subset A$; chiameremo _parte interna_ di $A$ l'insieme dei punti interni di $A$ e la denoteremo con $accent(A, ∘)$;
  + $A$ è un _intorno_ di $x$ se $x$ è punto interno ad $A$ ovvero esiste $r > 0$ tale che $B_r(x) subset A$;
  + $x$ è _punto esterno_ ad $A$ se è interno al complementare di $A$ ovvero esiste $r > 0$ tale che $B_r(x) inter A = emptyset$; chiameremo _parte esterna_ di $A$ l'insieme dei punti esterni ad $A$;
  + $x$ è _punto di frontiera_ per $A$ se non è né interno né esterno ad $A$ ovvero per ogni $r > 0$ l'insieme $B_r(x)$ contiene punti di $A$ e di $X without A$; chiameremo _frontiera_ (o bordo) di $A$ l'insieme dei punti di frontiera che denoteremo con $partial A$;
  + $x$ è _punto di aderenza_ di $A$ se è interno o di frontiera ovvero se per ogni $r > 0$ si ha $B_r(x) inter A != emptyset$; chiameremo _chiusura_ di $A$ l'insieme dei punti di aderenza, che denoteremo con $overline(A)$;
  + $x$ è _punto di accumulazione_ di $A$ se è punto di aderenza per $A without {x}$ ovvero se per ogni $r > 0$ l'insieme $A inter B_r(x)$ contiene punti diversi da $x$, chiameremo _derivato_ di $A$ l'insieme dei punti di accumulazione (che si potrebbe denotare con $A'$);
  + $x$ è _punto isolato_ di $A$ se è un punto di $A$ ma non di accumulazione per $A$ cioè se esiste $r > 0$ per cui $B_r(x) inter A = {x}$.
] <def:466342>

#theorem[le palle sono aperte][
  Sia $(X, d)$ uno spazio metrico, sia $x in X$ e $r > 0$. Allora la palla $B_r(x)$ è un insieme aperto in $X$.
]

#proof[
  Sia $y in B_r(x)$: è sufficiente trovare $rho > 0$ tale che $B_rho(y) subset B_r(x)$. Prendendo $rho = r - d(y, x)$ si osserva che $rho > 0$ e, per la disuguaglianza triangolare, dato $z in B_rho(y)$ si ha
  $ d(z, x) <= d(z, y) + d(y, x) < rho + d(y, x) = r $
  da cui $B_rho(y) subset B_r(x)$ come volevamo dimostrare.
]

#definition[distanze equivalenti][
  Sia $X$ uno spazio metrico con una distanza $d$. La famiglia di tutti gli insiemi aperti in $X$ si chiama _topologia indotta_ dalla distanza $d$. Se due distanze $d_1$ e $d_2$ su $X$ inducono la stessa topologia si dice che le due distanze sono _equivalenti_.
]

Vedremo che molte proprietà degli spazi metrici possono essere espresse in termini di topologia e quindi non dipendono dalla distanza scelta. In particolare: limiti, continuità e compattezza sono proprietà topologiche.

#example[
  Consideriamo la norma $abs(vec(x))_p$ su $RR^n$ definita nell'esempio @ex:norma_p con $p in [1, +infinity]$. Si può dimostrare che per ogni $vec(x) in RR^n$ risulta
  $ abs(vec(x))_infinity <= abs(vec(x))_p <= abs(vec(x))_1. $
  Visto che si ha anche
  $ abs(vec(x))_1 <= n abs(vec(x))_infinity $
  si evince che la palla di raggio $r$ rispetto ad una qualunque norma-$p$ è contenuta nella palla di raggio $n r$ di una qualunque norma-$q$. Dunque le distanze indotte da queste norme sono equivalenti perché se un insieme $A$ contiene una palla di una norma-$p$ allora contiene anche una palla (centrata nello stesso punto) di una norma-$q$, con $p, q in [1, +infinity]$, e viceversa.

  In particolare tutte queste norme sono equivalenti alla norma euclidea e inducono quindi la topologia euclidea canonica su $RR^n$.
]