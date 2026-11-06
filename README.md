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
```

La versione del libro è definita in `lib.typ`. Il repository contiene anche i sorgenti della precedente versione LaTeX.

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
