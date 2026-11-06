// Copertina distesa: quarta | dorso | prima.
// Cartonato KDP, colori premium su carta bianca, 8.25 x 11 in,
// 222 pagine (221 + bianca). Misure verificate nel calcolatore KDP.
// Totale: 477.13 x 315.4 mm; piatti: 214.55 x 285.4 mm;
// dorso: 18.03 mm; risvolti: 15 mm; cerniere: 10 mm.
// Se cambia il numero di pagine, ricalcolare il modello KDP e impostare
// dorso-mm; larghezza-mm e altezza-mm consentono ulteriori adattamenti.
// https://kdp.amazon.com/cover-calculator
#import "lib.typ": version
#import "print-layout.typ": print-page

#let misura(nome, predefinita) = {
  let valore = sys.inputs.at(nome, default: none)
  if valore == none { predefinita } else { float(valore) * 1mm }
}
#let pagine-interne = int(sys.inputs.at("pagine", default: "221"))
// KDP arrotonda il numero di pagine al successivo numero pari.
#let pagine = pagine-interne + calc.rem(pagine-interne, 2)
#assert(pagine == 222 or sys.inputs.at("dorso-mm", default: none) != none,
  message: "Numero di pagine cambiato: ricalcolare il dorso con KDP e indicare --input dorso-mm=...")
#let dorso = misura("dorso-mm", 18.03mm)
#let bordo = misura("bordo-mm", 15mm)
#let cerniera = misura("cerniera-mm", 10mm)
#let larghezza = misura("larghezza-mm", 2 * (print-page.width + 5mm) + dorso + 2 * bordo)
#let altezza = misura("altezza-mm", print-page.height + 6mm + 2 * bordo)
#let piatto = (larghezza - dorso) / 2 - bordo
#let inizio-dorso = (larghezza - dorso) / 2
#let inizio-prima = inizio-dorso + dorso
#let margine = 17mm
#let sinistra-prima = inizio-prima + cerniera + margine
#let testo-prima = larghezza - bordo - margine - sinistra-prima
#let testo-quarta = piatto - cerniera - 2 * margine
#assert(dorso > 4mm and testo-prima > 110mm and altezza > 200mm,
  message: "Controllare le misure del modello di copertina")

// Un unico spazio colore CMYK, senza trasparenze e senza immagini raster.
#let blu = cmyk(88%, 58%, 12%, 8%)
#let blu-scuro = cmyk(94%, 74%, 35%, 30%)
#let chiaro = cmyk(22%, 5%, 0%, 0%)
#let bianco = cmyk(0%, 0%, 0%, 0%)
#let inchiostro = cmyk(0%, 0%, 0%, 88%)
#let carta-fondo = cmyk(2%, 1%, 4%, 0%)

#set document(title: "Appunti di Analisi Matematica Due - Copertina", author: "Emanuele Paolini")
#set page(width: larghezza, height: altezza, margin: 0mm, fill: blu,
  numbering: none, header: none, footer: none)
#set text(font: "Lato", lang: "it", size: 12pt, fill: bianco)
#set par(leading: 0.65em)

// Tutti i fondi arrivano al bordo esterno del PDF, inclusa la smarginatura.
#place(top + left)[#rect(width: inizio-dorso, height: altezza, fill: carta-fondo, stroke: none)]
#place(top + left, dx: inizio-dorso)[#rect(width: dorso, height: altezza, fill: blu, stroke: none)]

// PRIMA
#place(top + left, dx: sinistra-prima, dy: bordo + 21mm)[
  #text(size: 18pt)[Emanuele Paolini]
]
#place(top + left, dx: sinistra-prima, dy: bordo + 49mm)[
  #block(width: testo-prima)[
    #set par(leading: 0.18em)
    #text(size: 24pt)[Appunti di]
    #v(5mm)
    #text(size: 47pt, weight: "bold")[Analisi\ Matematica\ Due]
  ]
]
#place(top + left, dx: sinistra-prima, dy: bordo + 126mm)[
  #line(length: 26mm, stroke: 1.2pt + chiaro)
  #v(4mm)
  #text(size: 11pt, fill: chiaro)[Versione #version]
]

// Famiglia di orbite nel piano delle fasi di un oscillatore armonico.
// Disegno vettoriale: resta nitido a qualunque risoluzione di stampa.
#let centro-x = sinistra-prima + testo-prima / 2
#let centro-y = bordo + 204mm
#for i in range(1, 9) {
  let rx = i * 8.2mm
  let ry = i * 3.7mm
  place(top + left, dx: centro-x - rx, dy: centro-y - ry)[
    #ellipse(width: 2 * rx, height: 2 * ry, fill: none, stroke: 0.55pt + chiaro)
  ]
}
#place(top + left, dx: centro-x - 72mm, dy: centro-y)[
  #line(length: 144mm, stroke: 0.5pt + chiaro)
]
#place(top + left, dx: centro-x, dy: centro-y - 35mm)[
  #line(end: (0mm, 70mm), stroke: 0.5pt + chiaro)
]
#place(top + left, dx: sinistra-prima, dy: altezza - bordo - 20mm)[
  #text(size: 14pt, weight: "bold")[manu-fatto]
]

// QUARTA
#place(top + left, dx: bordo + margine, dy: bordo + 23mm)[
  #block(width: testo-quarta)[
    #set text(fill: inchiostro, size: 13pt)
    #set par(justify: false, leading: 0.8em)
    #text(size: 23pt, weight: "bold", fill: blu-scuro)[Analisi Matematica Due]
    #v(9mm)
    Appunti del corso di Analisi Matematica Due di Emanuele Paolini.
    #v(5mm)
    Dagli spazi metrici alle equazioni differenziali, un percorso attraverso
    i concetti e i metodi dell'analisi, con definizioni, teoremi,
    dimostrazioni, esempi ed esercizi.
    #v(10mm)
    #text(size: 10pt, weight: "bold", fill: blu-scuro)[ARGOMENTI]
    #v(4mm)
    Spazi metrici e convergenza uniforme\
    Funzioni di più variabili\
    Integrali multipli\
    Forme differenziali\
    Equazioni differenziali
    #v(11mm)
    #line(length: 25mm, stroke: 0.8pt + blu)
    #v(4mm)
    #text(size: 10pt)[Testo disponibile anche online:\
      paolini.codeberg.page/AnalisiDue/]
  ]
]
#place(top + left, dx: bordo + margine, dy: altezza - bordo - 25mm)[
  #text(size: 9pt, fill: inchiostro)[CC BY-SA 4.0 #linebreak() Versione #version]
]
// Zona bianca riservata al codice ISBN inserito da KDP. Non è un barcode.
#place(top + left,
  dx: inizio-dorso - cerniera - 10mm - 2in,
  dy: altezza - bordo - 12mm - 1.2in)[
  #rect(width: 2in, height: 1.2in, fill: bianco, stroke: none)
]

// DORSO: testo centrato, con almeno 1,6 mm liberi su ciascun lato.
#let testo-dorso = [Emanuele Paolini   ·   Appunti di Analisi Matematica Due]
#place(center + horizon)[
  #rotate(90deg, origin: center)[
    #box(width: altezza - 2 * bordo - 36mm)[
      #set align(center)
      #text(size: calc.min(12pt, (dorso - 3.2mm) * 0.65), weight: "bold")[#testo-dorso]
    ]
  ]
]
