# Appunti di Analisi Matematica Due

Appunti del corso di Analisi Matematica Due di Emanuele Paolini, scritti in Typst.

- [Leggi il libro online](https://paolini.codeberg.page/AnalisiDue/)
- [Scarica il PDF della versione 1.1.0](https://codeberg.org/paolini/AnalisiDue/releases/download/v1.1.0/AnalisiDueTyp.pdf)
- [Tutte le release](https://codeberg.org/paolini/AnalisiDue/releases)

## Compilazione

È necessario avere installato [Typst](https://typst.app/).

```sh
make pdf   # Genera AnalisiDueTyp.pdf
make html  # Genera AnalisiDueTyp.html (esportazione sperimentale)
make       # Genera entrambi i formati
make copertina  # Genera copertina.pdf (quarta, dorso e prima)
make pages  # Genera l'HTML e aggiorna il branch pages su origin
make github-release  # Rispecchia su GitHub la release Codeberg (archiviata su Zenodo)
```

`make pages` esegue il fetch di `pages`, copia `AnalisiDue.html` come
`index.html` in un worktree temporaneo e fa commit e push sul remoto `origin`.
Il branch di lavoro e le modifiche locali restano al loro posto. Se l'HTML
non è cambiato non crea commit. Per scegliere un altro remoto, usare
`make pages PAGES_REMOTE=github`. Il push non forza la sovrascrittura di
eventuali aggiornamenti concorrenti.

`make github-release` va eseguito dopo aver pubblicato la release su Codeberg:
fa il push del tag sul remoto `github` e crea su GitHub una release con lo
stesso titolo, testo e allegati. GitHub la notifica a Zenodo, che la archivia
con i metadati di `.zenodo.json`. Il tag predefinito è `v` seguito dalla
versione in `lib.typ`; per sceglierne un altro: `make github-release TAG=v1.1.0`.

I metadati del libro (titolo, autore, versione, lingua, editore, link al PDF e
licenza) sono raccolti nel dizionario `book-info` in `lib.typ`, condiviso dai
due formati. Il repository contiene anche i sorgenti della precedente versione LaTeX.

Entrambi i formati sono compilati da `AnalisiDue.typ`. La configurazione
comune è in `setup` (`lib.typ`), che rileva il formato con `target()`.
Riferimenti e numerazione sono condivisi; `setup-print.typ` contiene
l'impaginazione cartacea e `setup-html.typ` le regole di esportazione HTML.
I due setup ricevono i metadati da `lib.typ` come parametro.

### Margini alternati o fissi

Il PDF usa per impostazione predefinita margini alternati: lo spazio per le
note e le didascalie resta sul lato esterno del libro. È possibile disattivare
l'alternanza e mantenere il margine largo sempre a destra:

```sh
make pdf ALT_MARGINS=true   # Alternati (predefinito)
make pdf ALT_MARGINS=false  # Fissi, margine largo a destra
```

Il flag equivalente per la compilazione diretta è
`typst compile --input alt-margins=false AnalisiDue.typ AnalisiDue.pdf`.
Le didascalie seguono la scelta dei margini.

Per la stampa KDP i margini fisici laterali sono di 17 mm: anche le barre dei
teoremi, che sporgono verso sinistra, restano oltre i 12,7 mm richiesti per la
rilegatura. La colonna delle note è larga 41 mm; la larghezza del testo
principale resta invariata.

### Numerazione delle equazioni

Vengono numerate soltanto le formule con una label:

```typ
$ a = b $                 // Senza numero
$ a = b $ <eq:esempio>    // Numerata e richiamabile con @eq:esempio
```

Per una formula su più righe, una label esterna numera tutte le righe del
gruppo; una label interna (`#<eq:riga>`) numera soltanto la riga corrispondente.
Le formule senza label non incrementano il contatore.

## Copertina per KDP

`copertina.typ` genera una sola pagina con quarta, dorso e prima di copertina,
compresi i risvolti. L'impostazione è per **copertina rigida, interno a colori
premium su carta bianca, formato 8,25 × 11 pollici**. Il PDF interno ha 221
pagine, arrotondate a 222 per la stampa.

Le misure del [calcolatore KDP](https://kdp.amazon.com/cover-calculator),
verificate per questa configurazione, sono: copertina intera **477,13 × 315,4 mm**,
piatti **214,55 × 285,4 mm**, dorso **18,03 mm**, risvolti **15 mm** e cerniere
**10 mm**. Lo spazio bianco sulla quarta è riservato al codice a barre di KDP.
Il PDF non contiene guide di taglio.

Compilazione diretta: `typst compile copertina.typ copertina.pdf`.
Per modificare testi, colori e disegno, intervenire in `copertina.typ`.
La versione viene letta da `lib.typ`.

Se cambia il numero di pagine o il tipo di stampa/carta, ricalcolare il modello
KDP. Passare il nuovo numero di pagine con `make copertina PAGINE=...` e le
nuove misure attraverso `COPERTINA_OPZIONI`, ad esempio
`COPERTINA_OPZIONI="--input dorso-mm=18.5"` (valore solo illustrativo).
Sono configurabili anche `larghezza-mm`, `altezza-mm`, `bordo-mm` e `cerniera-mm`.
Il sorgente segnala un errore se cambia il numero di pagine di stampa senza
indicare una nuova larghezza del dorso.

## Licenza

Il testo è distribuito con licenza [Creative Commons Attribuzione – Condividi allo stesso modo 4.0 Internazionale (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/deed.it).
