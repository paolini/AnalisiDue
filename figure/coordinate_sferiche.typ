#import "../lib.typ": cetz, primary-color

// Proiezione parallela con z verticale e il piano xy visto dall'alto.
#cetz.canvas(length: 3.2cm, {
  import cetz.draw: *
  let theta-angle = 60deg
  let phi-angle = 50deg
  let project(x, y, z) = (-0.65 * x + y, -0.45 * x + z)
  let spherical(r, polar, azimuth) = project(
    r * calc.sin(polar) * calc.cos(azimuth),
    r * calc.sin(polar) * calc.sin(azimuth),
    r * calc.cos(polar),
  )
  let p = spherical(1, phi-angle, theta-angle)
  let q = project(calc.sin(phi-angle) * calc.cos(theta-angle), calc.sin(phi-angle) * calc.sin(theta-angle), 0)
  let auxiliary = (paint: luma(50%), thickness: 0.6pt, dash: "dashed")

  // Un lembo del piano xy rende riconoscibile la proiezione verticale PQ.
  line((0, 0), project(1.05, 0, 0), project(1.05, 1.05, 0),
    project(0, 1.05, 0), close: true,
    fill: primary-color.lighten(94%), stroke: none)

  line((0, 0), project(1.2, 0, 0), stroke: 0.7pt, mark: (end: ">"))
  line((0, 0), project(0, 1.2, 0), stroke: 0.7pt, mark: (end: ">"))
  line((0, 0), project(0, 0, 1.1), stroke: 0.7pt, mark: (end: ">"))
  content(project(1.32, 0, 0), $x$)
  content(project(0, 1.3, 0), $y$)
  content(project(0, 0, 1.2), $z$)
  content((-0.08, 0.07), $O$)

  line(p, q, stroke: auxiliary)
  line((0, 0), q, stroke: auxiliary)
  // Indicatore di angolo retto nel piano verticale OPQ.
  let inset = 0.13
  line(
    (q.at(0), q.at(1) + 0.06),
    (q.at(0) * (1 - inset), q.at(1) * (1 - inset) + 0.06),
    (q.at(0) * (1 - inset), q.at(1) * (1 - inset)),
    stroke: 0.5pt + luma(50%),
  )
  line((0, 0), p, stroke: 1.1pt + primary-color)
  content((p.at(0) * 0.6 + 0.09, p.at(1) * 0.6), text(fill: primary-color)[$rho$])

  // theta appartiene al piano xy; phi al piano verticale OPQ.
  line(..range(0, 61).map(i => project(
    0.3 * calc.cos(i * 1deg), 0.3 * calc.sin(i * 1deg), 0,
  )), stroke: 0.7pt)
  content(project(0.46 * calc.cos(32deg), 0.46 * calc.sin(32deg), 0), $theta$)
  line(..range(0, 51).map(i => spherical(0.36, i * 1deg, theta-angle)), stroke: 0.7pt)
  content(spherical(0.48, 25deg, theta-angle), $phi.alt$)

  circle(q, radius: 0.012, fill: luma(50%), stroke: none)
  content((q.at(0) + 0.06, q.at(1) - 0.06), $Q$, anchor: "north-west")
  circle(p, radius: 0.018, fill: primary-color, stroke: none)
  content((p.at(0) + 0.06, p.at(1) + 0.04), $P(rho, theta, phi.alt)$, anchor: "west")
})
