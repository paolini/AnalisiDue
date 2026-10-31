#import "../../lib.typ": *

In questo capitolo vogliamo introdurre il concetto di $k$-superfici e di $k$-forme.

L'esempio più calzante di questi concetti è dato dallo studio dell'elettromagnetismo in fisica: i campi vettoriali (come il campo elettrico) si rappresentano tramite $2$-forme mentre i campi pseudo-vettoriali (come il campo magnetico) si rappresentano tramite $1$-forme.
Di un campo elettrico vogliamo poter fare il flusso attraverso una superficie $2$-dimensionale.
Di un campo magnetico vogliamo poter fare la circuitazione lungo una curva ($1$-superficie).
La carica elettrica si rappresenta tramite una $3$-forma che vogliamo poter integrare su un volume (ovvero una $3$-superficie).
L'obiettivo finale di questo capitolo sarà quello di dimostrare i teoremi di Stokes e Gauss-Green, che si possono scrivere in questo modo
$ integral.double_S (op("rot") arrow(B)) dot d arrow(S) = integral.cont_(partial S) arrow(B) dot d arrow(r), quad integral.triple_V op("div") arrow(E) thin d V = integral.double_(partial V) arrow(E) dot d arrow(S). $

Ovviamente questi concetti sono fondamentali non solo in fisica ma anche in moltissimi ambiti della matematica.
In particolare vogliamo dare delle definizioni che si generalizzano ad ogni dimensione spaziale, per questo parleremo di $k$-forme, e $k$-superfici in $RR^n$ con $k$ intero, $0 <= k <= n$.

Non vogliamo qui fare la teoria delle varietà differenziabili (argomento della geometria differenziale) né, tantomeno, quella delle correnti rettificabili.
Per mantenere un livello elementare e per poter dimostrare i teoremi a cui stiamo puntando, studieremo una sottoclasse delle correnti rettificabili dato dalle superficie parametrizzate regolari a tratti.

L'esempio più importante di superficie che vogliamo essere in grado di rappresentare è la sfera.
Intuitivamente il flusso di un campo vettoriale $xi$ attraverso una sfera $S$ è l'integrale, che si può indicare con $integral_S xi dot nu_S thin d sigma$, svolto sulla superficie della sfera, del prodotto scalare tra il campo vettoriale $xi$ e il versore normale della sfera $nu_S$.
Il simbolo $d sigma$ rappresenta la misura di superficie, ovvero l'elemento di area infinitesimo.
La superficie della sfera può essere orientata in due modi opposti se si sceglie la normale esterna oppure la normale interna.
L'integrale del campo vettoriale cambierà segno a seconda dell'orientazione.
Inoltre ci aspettiamo che tale integrale sia lineare rispetto al campo vettoriale:
$ integral_S (c xi) dot nu thin d sigma = c integral_S xi dot nu thin d sigma, quad integral_S (xi + eta) dot nu thin d sigma = integral_S xi dot nu thin d sigma + integral_S eta dot nu thin d sigma. $

La sfera unitaria (superficie bidimensionale nello spazio tridimensionale) può essere rappresentata in molti modi diversi.
Il modo più banale è quello di considerare l'insieme ${(x,y,z) : x^2+y^2+z^2=1} subset RR^3$.
Purtroppo questa rappresentazione non è ideale per il nostro scopo perché non è in grado di rappresentare l'orientazione e la molteplicità.
In particolare la possibilità di avere una molteplicità è rilevante per avere una struttura algebrica sulle superfici: una curva che si avvolge più volte su se stessa (come le spire di un trasformatore elettrico) ha una chiara interpretazione fisica che verrebbe persa perché l'unione insiemistica $S union S = S$ non distingue due copie sovrapposte della stessa superficie.
Un problema simile si avrebbe con superfici (o curve) che si autointersecano: nei punti di intersezione non sarà possibile definire univocamente un vettore normale alla superficie.

Dal punto di vista matematico quello che si perde, nell'approccio puramente insiemistico, è la struttura algebrica delle superfici. Vogliamo infatti permettere la definizione di somma di due superfici $S+T$ in modo tale che l'integrale risulti additivo anche rispetto alla superficie.
Vorremmo inoltre definire un operatore di bordo $partial S$ che associ ad una $k$-superficie una $(k-1)$-superficie e che sia tale che $partial(S+T) = partial S + partial T$.

Tutto questo con l'obiettivo finale di ottenere una dimostrazione della formula di Stokes:
$ integral_(partial S) omega = integral_S d omega. $
