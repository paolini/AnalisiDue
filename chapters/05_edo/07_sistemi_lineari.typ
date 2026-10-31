#import "../../lib.typ": *

= Sistemi lineari

Un sistema lineare omogeneo a coefficienti costanti del primo ordine si scrive in generale nella forma:
$ arrow(u)'(x) = A arrow(u)(x) $
dove $A$ è una matrice $n times n$ costante e la funzione vettoriale incognita sarà $arrow(u): RR -> RR^n$.
Come per i sistemi lineari algebrici sarà utile, se possibile, cercare un sistema di riferimento in cui la matrice $A$ risulti essere diagonale. Se facciamo il cambio di variabile
$ arrow(u) = M arrow(v) $
tramite una matrice invertibile $M$, si ottiene $arrow(u)' = (M arrow(v))' = M arrow(v)'$ (si faccia la verifica!... stiamo supponendo che $M$ sia una matrice costante) e dunque il sistema lineare diventa:
$ M arrow(v)' = A M arrow(v) $
ovvero
$ arrow(v)' = M^(-1) A M arrow(v). $
A meno di un cambio di variabili potremo quindi sostituire la matrice $A$ con una qualunque matrice simile ad essa: $M^(-1) A M$. In particolare se la matrice $A$ è diagonalizzabile (ad esempio se gli autovalori di $A$ sono tutti reali e distinti) potremo ricondurci a un sistema diagonale:
$ cases(
  v_1 ' = lambda_1 v_1,
  dots.v,
  v_n ' = lambda_n v_n
) $
dove $lambda_1, dots, lambda_n$ sono gli autovalori della matrice $A$.
La matrice $M$ del cambio di base avrà come vettori colonna gli autovettori della matrice $A$, che quindi rappresentano la nuova base. A questo punto abbiamo $n$ equazioni indipendenti che possono essere risolte senza difficoltà:
$ v_1(x) &= c_1 e^(lambda_1 x) \
  v_2(x) &= c_2 e^(lambda_2 x) \
  &dots.v \
  v_n(x) &= c_n e^(lambda_n x) $
con $c_1, dots, c_n$ costanti arbitrarie.

Se la matrice $A$ non è diagonalizzabile sul campo reale è possibile che risulti diagonalizzabile nel campo complesso. Più in generale la matrice potrà essere portata in forma di Jordan. Per brevità non cercheremo di trattare il caso generale, ma ci concentreremo sul caso $n=2$ che contiene comunque una casistica piuttosto ampia.

== Sistemi $2 times 2$

Nel caso $n=2$ sarà comodo usare $t$ come variabile indipendente (al posto di $x$) e chiamare $x(t)$ e $y(t)$ le due coordinate della funzione vettoriale incognita.
Il sistema che vogliamo trattare sarà quindi della forma:
$ cases(
  x'(t) = a dot x(t) + b dot y(t),
  y'(t) = c dot x(t) + d dot y(t).
) $
dove $a,b,c,d$ sono i coefficienti costanti (reali) della matrice
$ A = mat(a, b; c, d). $
Vedremo che il comportamento del sistema potrà essere classificato in base agli autovalori della matrice.
Siano $lambda$ e $mu$ gli autovalori (eventualmente complessi) della matrice $A$ cioè gli zeri del polinomio caratteristico:
$ P(z) = det(A - z I) = z^2 - (a+d) z + a d - b c. $

Se gli autovalori sono reali e distinti la matrice è diagonalizzabile, se $arrow(v), arrow(w)$ sono gli autovettori corrispondenti agli autovalori $lambda, mu$, si potrà quindi fare il cambio di variabile
$ mat(x; y) = X arrow(v) + Y arrow(w) $
tramite il quale le equazioni si separano:
$ cases(
  X' = lambda X,
  Y' = mu Y
) $
da cui si ottiene $X = a e^(lambda t)$, $Y = b e^(mu t)$ con $a,b in RR$ costanti arbitrarie.

Visto che le equazioni a coefficienti costanti sono autonome sappiamo che una traslazione temporale di una soluzione rimane una soluzione. Infatti si osserva che
$ cases(
  X(t+c) = a e^(lambda (t+c)) = a e^(lambda c) e^(lambda t),
  Y(t+c) = b e^(mu (t+c)) = b e^(mu c) e^(mu t).
) $
Questo ci permette di disegnare le traiettorie delle soluzioni nel piano $(x,y)$. Su tale piano le traslazioni temporali di una soluzione si rappresentano sulla stessa traiettoria.
Traiettorie diverse non potranno invece mai incontrarsi per l'unicità della soluzione.

Se $a=b=0$ si ottiene la soluzione nulla $X=0$, $Y=0$ che, nel piano delle fasi, si rappresenta con un singolo punto nell'origine. Se $b=0$ le soluzioni sono della forma $X=a e^(lambda t)$, $Y=0$ che ha una traiettoria, nel piano $x y$ lungo la semiretta uscente dall'origine con direzione $arrow(v)$ se $a>0$ e con direzione $-arrow(v)$ se $a<0$.
La soluzione andrà verso $0$ (all'aumentare di $t$) se $lambda<0$ e sarà invece uscente da $0$ se $lambda > 0$.
Analogamente si ha una traiettoria sulle due semirette con direzione $arrow(w)$ e $-arrow(w)$ quando $a=0$ e $b != 0$.

Se entrambi $a$ e $b$ sono non nulli potremo trovare l'equazione della traiettoria eliminando la variabile $t$ nelle equazioni che rappresentano la soluzione.
Se $X=a e^(lambda t)$, $Y=b e^(mu t)$ risulta
$ (|b|^lambda |X|^mu)/(|a|^mu |Y|^lambda) = (e^(lambda t mu))/(e^(mu t lambda)) = 1 $
da cui
$ Y = k |X|^(mu / lambda) $
con $k$ costante arbitraria.

#figure(
  grid(
    columns: 2,
    gutter: 1.2em,
    figure(image("../../figure/sistemi_sella.pdf", width: 75%), caption: [sella (instabile)], numbering: none),
    figure(image("../../figure/sistemi_nodo.pdf", width: 75%), caption: [nodo stabile], numbering: none),
    figure(image("../../figure/sistemi_nodo_improprio.pdf", width: 75%), caption: [nodo improprio stabile], numbering: none),
    figure(image("../../figure/sistemi_stella.pdf", width: 75%), caption: [stella stabile], numbering: none),
    figure(image("../../figure/sistemi_fuoco.pdf", width: 75%), caption: [fuoco stabile], numbering: none),
    figure(image("../../figure/sistemi_centro.pdf", width: 75%), caption: [centro (stabile)], numbering: none),
  ),
  caption: [Tipologie di comportamento e ritratti di fase per sistemi lineari $2 times 2$.],
) <fig:sistemi_2x2>

Se i segni di $lambda$ e $mu$ sono opposti, si ottiene una configurazione chiamata _sella_ (si veda la figura).
Lungo l'autovettore con autovalore negativo ci sarà convergenza verso l'origine, ma questa convergenza è instabile in quanto ogni altra curva tenderà invece a essere deviata e a tendere asintoticamente verso la direzione dell'autovettore con autovalore positivo.

Se $lambda$ e $mu$ sono entrambi negativi si ha un _nodo stabile_ in cui tutte le curve convergono verso l'origine (soluzione attrattiva). Se invece $lambda$ e $mu$ sono entrambi positivi le curve saranno percorse in senso inverso e saranno uscenti dall'origine: si avrà allora un _nodo instabile_.

Se gli autovalori sono coincidenti $lambda = mu$ e se la matrice è diagonalizzabile allora la matrice è diagonale, tutti i vettori sono autovettori quindi in ogni direzione c'è una traiettoria rettilinea.
La configurazione si chiama _stella_ (stabile o instabile a seconda del segno negativo o positivo).

Se gli autovalori sono coincidenti $lambda = mu$ e la matrice non è diagonalizzabile consideriamo l'autovettore (unico) $arrow(u)$ con $A arrow(u) = lambda arrow(u)$ e prendiamo un qualunque vettore $arrow(w)$ indipendente da $arrow(u)$. Allora si avrà
$ A arrow(w) = alpha arrow(u) + beta arrow(w). $
Certamente $alpha != 0$ altrimenti $arrow(w)$ sarebbe un autovettore e la matrice sarebbe diagonalizzabile.
Consideriamo allora $arrow(v) = arrow(w) / alpha$ cosicché si ha $A arrow(v) = arrow(u) + beta/alpha arrow(w)$.
Nella base $arrow(u), arrow(v)$ la matrice $A$ diventa triangolare, e sulla diagonale troviamo i valori $lambda$ e $beta/alpha$.
Ma allora $beta/alpha = lambda$ in quanto sulla diagonale abbiamo solo gli autovalori. Dunque se $X,Y$ sono le coordinate nel sistema $arrow(u), arrow(v)$, il sistema di equazioni diventa:
$ cases(
  X' = lambda X + Y,
  Y' = lambda Y.
) $
Dalla seconda equazione si ottiene quindi $Y = a e^(lambda t)$ con $a in RR$ costante arbitraria e sostituendo nella prima si ottiene l'equazione
$ X' - lambda X = a e^(lambda t) $
che può essere risolta trovando una seconda costante arbitraria $b in RR$ e
$ X = (a t + b) e^(lambda t). $
Se $a=0$ una traiettoria con $Y=0$ cioè nella direzione dell'unico autovettore.
Se $lambda < 0$ tale traiettoria sarà convergente a $0$ altrimenti sarà divergente.
Se $a != 0$ possiamo eliminare $t$ ponendo:
$ t = 1/lambda ln Y/a $
e quindi
$ X = (a/lambda ln Y/a + b) Y/a = Y/lambda ln Y/a + b/a Y. $
Studiando il grafico di questa funzione si ottengono qualitativamente le curve disegnate in figura: la configurazione si chiama _nodo improprio_.
Come per i nodi le traiettorie convergono all'origine se $lambda < 0$ e divergono se $lambda > 0$.

Proviamo a trattare il caso, più interessante, degli autovalori complessi. Se la matrice è a coefficienti reali gli autovalori, quando non reali, saranno certamente complessi coniugati:
$ lambda = alpha - i beta, quad mu = alpha + i beta $
con $alpha, beta in RR$, $beta != 0$.

Sia $arrow(v) + i arrow(w)$ un autovettore complesso relativo all'autovalore $alpha - i beta$.
Allora si ha
$ A arrow(v) + i A arrow(w) = A(arrow(v) + i arrow(w)) = (alpha - i beta)(arrow(v) + i arrow(w)) = alpha arrow(v) + beta arrow(w) + i(-beta arrow(v) + alpha arrow(w)). $
Uguagliando parte reale e parte immaginaria si trova
$ A arrow(v) = alpha arrow(v) + beta arrow(w), quad A arrow(w) = -beta arrow(v) + alpha arrow(w). $
A questo punto non è difficile verificare che $arrow(v) - i arrow(w)$ è un autovettore relativo all'autovalore coniugato $alpha + i beta$.
Visto che $arrow(v) +/- i arrow(w)$ sono due autovettori con autovalori distinti sicuramente sono vettori indipendenti.
Dunque anche $arrow(v)$ e $arrow(w)$ (che si ottengono come multipli di somma e differenza) sono vettori indipendenti (stavolta reali).
Se $X,Y$ sono le coordinate nella base $arrow(v), arrow(w)$, l'equazione differenziale diventa:
$ cases(
  X' = alpha X - beta Y,
  Y' = beta X + alpha Y.
) $
Si ha allora #footnote[Si potrebbe osservare che la matrice $mat(alpha, -beta; beta, alpha)$ è la matrice che rappresenta la moltiplicazione complessa per il numero $alpha + i beta$. Dunque chiamando $Z = X + i Y$ il sistema si potrebbe scrivere nella forma $Z' = (alpha + i beta) Z$ e si potrebbe quindi osservare immediatamente che la soluzione deve essere della forma $Z = c e^((alpha + i beta) t)$ con $c$ costante complessa. Ponendo poi $c = rho e^(i theta)$ si ottiene il risultato.]
$ X'' = alpha X' - beta Y' = alpha X' - beta (beta X + alpha Y) $
da cui, usando $beta Y = alpha X - X'$ possiamo eliminare la variabile $Y$ e ottenere una equazione del secondo ordine in $X$:
$ X'' = alpha X' - beta^2 X - alpha (alpha X - X') = 2 alpha X' - (alpha^2 + beta^2) X $
ovvero
$ X'' - 2 alpha X' + (alpha^2 + beta^2) X = 0. $
Risolvendo questa equazione del secondo ordine ci si accorge che le radici del polinomio caratteristico sono proprio $alpha +/- i beta$ e quindi le soluzioni si scrivono nella forma
$ X = e^(alpha t) (a cos(beta t) + b sin(beta t)) $
da cui
$ beta Y &= alpha X - X' \
  &= alpha e^(alpha t) (a cos(beta t) + b sin(beta t)) \
  &quad - alpha e^(alpha t) (a cos(beta t) + b sin(beta t)) - e^(alpha t) (-beta a sin(beta t) + b beta cos(beta t)) \
  &= beta e^(alpha t) (a sin(beta t) - b cos(beta t)). $
Dunque, ponendo $rho = sqrt(a^2 + b^2)$ e scegliendo $theta$ tale che $cos theta = a/rho$ e $sin theta = - b/rho$, si ha
$ cases(
  X = rho e^(alpha t) cos(beta t + theta),
  Y = rho e^(alpha t) sin(beta t + theta).
) $
Se $alpha != 0$ le traiettorie corrispondenti formano delle spirali ellittiche che si avvitano nella direzione che porta il vettore $arrow(v)$ verso il vettore $arrow(w)$. Se $alpha < 0$ le spirali convergono verso l'origine del sistema: avremo un _fuoco stabile_. Se $alpha > 0$ le orbite divergono chiameremo la configurazione un _fuoco instabile_.
Se $alpha = 0$ le traiettorie sono delle ellissi concentriche, le soluzioni sono quindi periodiche e la configurazione si chiama _centro_.

Se almeno uno dei due autovalori è nullo il comportamento del sistema è degenere, si hanno delle soluzioni banali che non andremo a investigare.

== Matrice esponenziale

Per risolvere, in astratto, il sistema $n times n$ del primo ordine, lineare omogeneo a coefficienti costanti
$ arrow(u)' = A arrow(u) $
introduciamo le seguenti nozioni.

Sia $A$ una matrice quadrata $n times n$. Definiamo la norma (norma operatoriale) di $A$ come segue:
$ |A| = sup_(|arrow(v)| <= 1) |A arrow(v)| $
dove $|arrow(v)| = sqrt(v_1^2 + dots + v_n^2)$ è l'usuale norma del vettore $arrow(v) in RR^n$.
Osserviamo che $arrow(v) |-> A arrow(v)$ è una funzione continua e che ${arrow(v) : |arrow(v)| <= 1}$ è un insieme compatto, dunque il $sup$ nella definizione è in realtà un $max$.

Per le proprietà del $sup$ si ha:
$ |A arrow(v)| <= |A| |arrow(v)| quad text("e") quad |A B| <= |A| |B|. $
Dunque possiamo affermare che il valore assoluto di ogni elemento di una matrice si stima con la norma della matrice: $|A_(i j)| <= |A|$, infatti:
$ |A_(i j)| = |(A arrow(e)_j)_i| <= |A arrow(e)_j| <= |A| $
(dove $arrow(e)_j$ è il $j$-esimo vettore della base canonica di $RR^n$).

Se $A_k$ è una successione di matrici, diremo che $A_k -> A$ se ogni elemento della matrice $A_k$ converge al corrispondente elemento della matrice $A$: $(A_k)_(i j) -> A_(i j)$. Questo corrisponde a considerare la matrice $n times n$ come un vettore dello spazio $RR^(n^2)$.

Se $A(t)$ è una funzione a valori matrici (ovvero una matrice i cui elementi sono funzioni di $t$), si potrà farne la derivata come si fa per le funzioni vettoriali: $(A'(t))_(i j) = (A_(i j)(t))'$ cioè componente per componente. Le usuali regole per le derivate valgono anche per le matrici, in particolare non è difficile verificare (si espliciti la definizione del prodotto di matrici) che
$ (A(t) B(t))' = A'(t) B(t) + A(t) B'(t) $
dove, puntualizziamo, è importante mantenere i prodotti nell'ordine giusto, in quanto il prodotto di matrici può non essere commutativo.

Se $A$ è una matrice quadrata, si definisce la matrice potenza $A^k$ per ogni $k$ naturale, mediante le proprietà
$ A^0 = I, quad A^(k+1) = A^k A. $
(se $A$ è invertibile si possono definire anche le potenze negative $A^(-k) = (A^(-1))^k = (A^k)^(-1)$).

Definiamo allora la matrice esponenziale di $A$:
$ e^A = sum_(k=0)^(+infinity) A^k / k!. $
Per dare significato a questa definizione dobbiamo verificare che la serie appena scritta sia convergente. Cioè dobbiamo verificare che per ogni coppia di indici $i j$ sia convergente la serie numerica:
$ sum_(k=0)^(+infinity) (A^k)_(i j) / k!. $
Per quanto detto prima sappiamo che $|(A^k)_(i j)| <= |A^k| <= |A|^k$.
Dunque la serie in questione è assolutamente convergente in quanto il suo valore assoluto si stima con la serie
$ sum_(k=0)^(+infinity) |A|^k / k! = e^(|A|) $
che è convergente. La definizione della matrice $e^A$ è dunque ben posta e si ha
$ |e^A| <= e^(|A|). $

#theorem[proprietà dell'esponenziale matrice][
  Siano $A$ e $B$ matrici quadrate $n times n$ e $t$ uno scalare.
  Valgono le seguenti proprietà:
  + $e^0 = I$ (dove $0$ è la matrice nulla $n times n$ ed $I$ è la matrice identità con le stesse dimensioni);
  + se $A B = B A$ allora $e^A B = B e^A$;
  + $(e^(t A))' = A e^(t A)$;
  + $e^(-A) = (e^A)^(-1)$ (in particolare la matrice esponenziale è sempre invertibile);
  + se $arrow(u)(t)$ è una funzione a valori in $RR^n$ che soddisfa l'equazione differenziale $arrow(u)'(t) = A arrow(u)(t)$ allora $arrow(u)(t) = e^(t A) arrow(u)(0)$;
  + se $A B = B A$ allora $e^(A+B) = e^A e^B$;
  + se $A$ è invertibile allora $e^(A B A^(-1)) = A e^B A^(-1)$;
  + se $A$ è la matrice diagonale $A = op("diag")(lambda_1, dots, lambda_n)$, allora $e^A$ è pure una matrice diagonale con $e^A = op("diag")(e^(lambda_1), dots, e^(lambda_n))$;
  + se $A$ è una matrice triangolare con la diagonale nulla (cioè $A_(i j) = 0$ se $i >= j$) allora $e^A = sum_(k=0)^n A^k / k!$ (basta sommare i primi $n+1$ termini);
  + se $B$ è una matrice triangolare (cioè $B_(i j) = 0$ se $i > j$) allora $B = D + A$ con $D$ matrice diagonale e $A$ matrice triangolare con la diagonale nulla e quindi $e^B = e^D e^A$ si può calcolare riconducendosi ai punti precedenti.
]

#proof[
  1. Per quanto riguarda $e^0$ osserviamo che per definizione $0^0 = I$ mentre $0^k = 0$ se $k>0$. Dunque direttamente dalla definizione si ottiene $e^0 = I$.

  2. Se $A B = B A$ osserviamo che si ha anche $A^k B = B A^k$ (la matrice $B$ commuta con ogni fattore del prodotto $A^k$). Dunque:
  $ sum_(k=0)^N A^k / k! B = B sum_(k=0)^N A^k / k! $
  e passando al limite $N -> infinity$ si ottiene $e^A B = B e^A$.

  3. Per calcolare la derivata di $e^(t A)$ vogliamo dimostrare che la serie che definisce $e^(t A)$ converge totalmente quando $t$ varia in un qualunque intervallo limitato. Poniamo allora $t in [-M, M]$. Si ha:
  $ sup_(t in [-M, M]) |(t A)^k| / k! = sup_(t in [-M, M]) |t|^k / k! |A^k| <= (M^k |A|^k) / k! $
  la cui serie è convergente qualunque sia $M in RR$. Dunque la serie che definisce $e^(t A)$ è una serie di funzioni continue e derivabili che converge totalmente su ogni intervallo limitato. Possiamo quindi derivare la serie termine a termine:
  $ (e^(t A))' = sum_(k=0)^infinity ((t A)^k)' / k! = sum_(k=1)^infinity (k t^(k-1) A^k) / k! = A sum_(k=1)^infinity (t^(k-1) A^(k-1)) / (k-1)! = A e^(t A). $

  4. Dimostriamo ora che $U(t) = e^(t A) e^(-t A) = I$ per ogni $t$. Si ha:
  $ U'(t) = A e^(t A) e^(-t A) + e^(t A) (-A) e^(-t A) = A e^(t A) e^(-t A) - A e^(t A) e^(-t A) = 0 $
  ($A e^(t A) = e^(t A) A$ in quanto $A$ e $t A$ commutano).
  Dunque $U'(t) = 0$ cioè $U(t)$ è costante ovvero $U(t) = U(0)$. Ma $U(0) = I$ in quanto $e^0 = I$ e quindi $U(t) = I$ per ogni $t$.

  5. Prendiamo l'equazione $arrow(u)' = A arrow(u)$, moltiplicando a sinistra per $e^(-t A)$ l'equazione diventa $e^(-t A) arrow(u)' - e^(-t A) A arrow(u) = 0$ cioè $(e^(-t A) arrow(u))' = 0$. Questo significa che la funzione $e^(-t A) arrow(u) = arrow(c)$ costante e moltiplicando a sinistra per $e^(t A)$ si ottiene dunque $arrow(u) = e^(t A) arrow(c)$ come volevasi dimostrare.

  6. Per dimostrare la proprietà $e^(A+B) = e^A e^B$ consideriamo la quantità $U(t) = e^(-t(A+B)) e^(t A) e^(t B)$. Se dimostriamo che $U$ è costante, visto che $U(0) = I$ si avrà anche $U(1) = I$ che è equivalente a quanto vogliamo dimostrare. Dunque verifichiamo che la derivata è nulla, sfruttando l'ipotesi $A B = B A$ che ci permette di far commutare i prodotti:
  $ U'(t) &= -(A+B) e^(-t(A+B)) e^(t A) e^(t B) + e^(-t(A+B)) A e^(t A) e^(t B) + e^(-t(A+B)) e^(t A) B e^(t B) \
          &= [-(A+B) + A + B] U(t) = 0. $

  7. Se $A$ è invertibile allora $(A B A^(-1))^k = A B A^(-1) A B A^(-1) dots A B A^(-1) = A B^k A^(-1)$. Dunque nelle somme parziali della serie che definisce l'esponenziale $e^(A B A^(-1))$ si può raccogliere $A$ a sinistra e $A^(-1)$ a destra e al centro rimane la serie che definisce $e^B$.

  8. Se la matrice $A$ è diagonale con $A_(i i) = lambda_i$ allora $A^k$ risulta essere una matrice diagonale con $(A^k)_(i i) = lambda_i^k$. Dunque nella definizione di esponenziale $e^A$ i termini della serie sono tutte matrici diagonali, e sulla diagonale compare la serie che definisce l'esponenziale $e^(lambda_i)$.

  9. Se $A$ è una matrice triangolare con $A_(i j) = 0$ quando $i >= j$, si osserva che $A^2$ avrà degli zeri anche sopra la diagonale: $(A^2)_(i j) = 0$ quando $i+1 >= j$ (si applichi la definizione di prodotto, riga per colonna). Nelle moltiplicazioni successive $A^3, A^4, dots$ si aggiungerà sempre una diagonale di zeri finché la matrice non si annulla completamente $A^n = 0$. Dunque la serie che definisce $e^A$ contiene solo un numero finito di termini (i primi $n+1$) e può essere calcolata esplicitamente.

  10. L'ultima proprietà è una osservazione che non richiede dimostrazione.
]
