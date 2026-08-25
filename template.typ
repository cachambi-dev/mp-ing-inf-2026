// template.typ - Plantilla base para Trabajos Prácticos de Paradigmas de Programación (UNJu - FI)

#let tp_doc(
  title: "Trabajo Práctico",
  tp_num: "1",
  subtitle: "",
  materia: "Paradigmas de Programación",
  ciclo: "2026",
  carreras: "Ingeniería Informática — Licenciatura en Sistemas",
  institucion: "Facultad de Ingeniería – Universidad Nacional de Jujuy",
  autor: "Estudiante: [Nombre y Apellido]",
  lu: "[N° de Libreta Universitaria / DNI]",
  fecha: datetime.today().display("[day]/[month]/[year]"),
  doc,
) = {
  // Configuración de página: Formato PDF A4 con márgenes equilibrados
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.2cm, right: 2.2cm),
    header: context {
      if counter(page).get().first() > 1 [
        #grid(
          columns: (1fr, auto),
          align: (left + horizon, right + horizon),
          text(size: 8pt, fill: rgb("#64748b"), weight: "medium")[
            #materia (#ciclo) — #institucion
          ],
          text(size: 8pt, fill: rgb("#0f4c81"), weight: "bold")[
            TP N° #tp_num #if subtitle != "" [— #subtitle]
          ]
        )
        #v(-4pt)
        #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
      ]
    },
    footer: context [
      #line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
      #v(2pt)
      #grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        text(size: 8pt, fill: rgb("#64748b"))[
          #carreras
        ],
        text(size: 8pt, fill: rgb("#64748b"), weight: "medium")[
          Página #counter(page).display("1 de 1", both: true)
        ]
      )
    ]
  )

  // Tipografía y espaciado general
  set text(
    font: ("Liberation Sans", "DejaVu Sans", "Arial", "Roboto", "Noto Sans"),
    size: 10pt,
    lang: "es",
    fill: rgb("#1e293b")
  )
  set par(justify: true, leading: 0.7em)
  set list(marker: ([•], [--], [▹]))
  set enum(indent: 8pt, spacing: 1.2em)

  // Jerarquía de encabezados estilizados
  show heading.where(level: 1): it => block(
    width: 100%,
    stroke: (bottom: 1.5pt + rgb("#0f4c81")),
    inset: (bottom: 6pt),
    above: 18pt,
    below: 12pt,
    text(fill: rgb("#0f4c81"), weight: "bold", size: 14pt, it.body)
  )

  show heading.where(level: 2): it => block(
    width: 100%,
    above: 14pt,
    below: 8pt,
    text(fill: rgb("#1e3a8a"), weight: "bold", size: 12pt, it.body)
  )

  show heading.where(level: 3): it => block(
    above: 12pt,
    below: 6pt,
    text(fill: rgb("#1e40af"), weight: "bold", size: 11pt, it.body)
  )

  show heading.where(level: 4): it => block(
    above: 8pt,
    below: 4pt,
    text(fill: rgb("#334155"), weight: "bold", size: 10pt, it.body)
  )

  // Bloques de código (sintaxis y fuente monoespaciada)
  show raw.where(block: true): it => block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: 0.6pt + rgb("#cbd5e1"),
    inset: 10pt,
    radius: 4pt,
    text(
      font: ("MesloLGS Nerd Font", "DejaVu Sans Mono", "Liberation Mono", "Hack Nerd Font", "Courier New"),
      size: 8.5pt,
      it
    )
  )

  show raw.where(block: false): it => box(
    fill: rgb("#f1f5f9"),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 2.5pt),
    radius: 3pt,
    text(
      font: ("MesloLGS Nerd Font", "DejaVu Sans Mono", "Liberation Mono", "Hack Nerd Font", "Courier New"),
      size: 9pt,
      fill: rgb("#0f172a"),
      it
    )
  )

  // Encabezado institucional / Carátula compacta
  block(
    width: 100%,
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#cbd5e1"),
    radius: 6pt,
    inset: 14pt,
    [
      #align(center)[
        #text(size: 9pt, weight: "bold", fill: rgb("#64748b"))[#upper(institucion)] \
        #text(size: 8.5pt, fill: rgb("#64748b"))[#carreras] \
        #v(4pt)
        #text(size: 15pt, weight: "bold", fill: rgb("#0f4c81"))[#title] \
        #if subtitle != "" [
          #text(size: 11.5pt, weight: "medium", fill: rgb("#334155"))[#subtitle] \
        ]
      ]
      #v(4pt)
      #line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))
      #v(4pt)
      #grid(
        columns: (1fr, 1fr),
        gutter: 8pt,
        [
          *Materia:* #materia \
          *Ciclo Lectivo:* #ciclo \
        ],
        [
          *Alumno/a:* #autor \
          *LU / DNI:* #lu \
          *Fecha:* #fecha \
        ]
      )
    ]
  )

  v(8pt)

  doc
}

// Cajas de información estilizadas
#let caja_objetivos(body) = block(
  width: 100%,
  fill: rgb("#eff6ff"),
  stroke: (left: 3.5pt + rgb("#3b82f6"), top: 0.5pt + rgb("#bfdbfe"), right: 0.5pt + rgb("#bfdbfe"), bottom: 0.5pt + rgb("#bfdbfe")),
  inset: 10pt,
  radius: (top-right: 4pt, bottom-right: 4pt),
  above: 8pt,
  below: 8pt,
  [
    #text(weight: "bold", fill: rgb("#1d4ed8"))[🎯 Objetivos y Contexto] \
    #v(4pt)
    #body
  ]
)

#let caja_indicaciones(body) = block(
  width: 100%,
  fill: rgb("#fffbeb"),
  stroke: (left: 3.5pt + rgb("#f59e0b"), top: 0.5pt + rgb("#fde68a"), right: 0.5pt + rgb("#fde68a"), bottom: 0.5pt + rgb("#fde68a")),
  inset: 9pt,
  radius: (top-right: 4pt, bottom-right: 4pt),
  above: 6pt,
  below: 6pt,
  [
    #text(weight: "bold", fill: rgb("#b45309"))[💡 Indicaciones y Consideraciones:] \
    #v(2pt)
    #body
  ]
)

#let caja_preguntas(body) = block(
  width: 100%,
  fill: rgb("#faf5ff"),
  stroke: (left: 3.5pt + rgb("#8b5cf6"), top: 0.5pt + rgb("#ddd6fe"), right: 0.5pt + rgb("#ddd6fe"), bottom: 0.5pt + rgb("#ddd6fe")),
  inset: 9pt,
  radius: (top-right: 4pt, bottom-right: 4pt),
  above: 6pt,
  below: 6pt,
  [
    #text(weight: "bold", fill: rgb("#6d28d9"))[❓ Preguntas de Análisis y Justificación:] \
    #v(3pt)
    #body
  ]
)

// Caja para resoluciones (código y respuestas del estudiante)
#let resolucion(
  body,
  titulo: "Resolución del Ejercicio",
) = block(
  width: 100%,
  fill: rgb("#f0fdf4"),
  stroke: (left: 3.5pt + rgb("#22c55e"), top: 0.5pt + rgb("#bbf7d0"), right: 0.5pt + rgb("#bbf7d0"), bottom: 0.5pt + rgb("#bbf7d0")),
  inset: 10pt,
  radius: (top-right: 4pt, bottom-right: 4pt),
  above: 8pt,
  below: 10pt,
  [
    #text(weight: "bold", fill: rgb("#15803d"))[📝 #titulo]
    #v(4pt)
    #body
  ]
)

#let respuesta(letra, body) = block(
  above: 5pt,
  below: 5pt,
  [
    #text(weight: "bold", fill: rgb("#166534"))[Respuesta #letra\):] #body
  ]
)
