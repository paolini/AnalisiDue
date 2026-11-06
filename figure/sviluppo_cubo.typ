#import "../lib.typ": cetz

// Stesse posizioni, etichette e coordinate del diagramma TikZ originale.
#cetz.canvas(length: 1cm, {
  import cetz.draw: *
  for (x, y, label) in (
    (1, 2, $psi_1^+$), (1, 3, $psi_3^+$),
    (0, 2, $psi_2^-$), (2, 2, $psi_2^+$),
    (1, 1, $psi_3^-$), (1, 0, $psi_1^-$),
  ) {
    rect((x, y), (x + 1, y + 1), fill: luma(85%), stroke: 0.8pt)
    content((x + 0.5, y + 0.5), label)
  }
  line((0, 0), (3.5, 0), stroke: 0.8pt, mark: (end: ">"))
  line((0, 0), (0, 4.5), stroke: 0.8pt, mark: (end: ">"))
  content((3.7, 0), $t$)
  content((0, 4.7), $s$)
  for i in range(0, 4) {
    line((i, 0.08), (i, -0.08))
    content((i, -0.3), text(size: 8pt, str(i)))
  }
  for j in range(0, 5) {
    line((0.08, j), (-0.08, j))
    content((-0.3, j), text(size: 8pt, str(j)))
  }
})
