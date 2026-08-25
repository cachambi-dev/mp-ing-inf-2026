#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 3
// -------------------------------------------------------------
== 🔹 Punto 3: Análisis de Paradigma Lógico (Prolog)

=== Consigna:
Un sistema académico almacena la siguiente información en su base de conocimiento:

```prolog
aprobo(ana, programacion).
aprobo(luis, programacion).

puede_rendir_final(X) :-
    aprobo(X, programacion).
```

#caja_preguntas[
  A partir del conocimiento anterior, responda:
  + *a)* Identifique cuáles sentencias representan hechos y cuál representa una regla.
  + *b)* ¿Qué respuesta debería obtenerse ante la siguiente consulta?
    `?- puede_rendir_final(ana).`
  + *c)* Explique brevemente cómo puede el sistema obtener esa respuesta aunque no exista el hecho explícito `puede_rendir_final(ana)`.
  + *d)* ¿Con qué paradigma de programación se relaciona principalmente este ejemplo? Justifique.
]

#resolucion(titulo: "Resolución y Justificación del Punto 3")[
  #respuesta("a")[
    - *Hechos (Premisas incondicionales de verdad):*
      - `aprobo(ana, programacion).` (declara que la relación "aprobó" es verdadera entre el átomo `ana` y el átomo `programacion`).
      - `aprobo(luis, programacion).` (declara que la relación "aprobó" es verdadera entre el átomo `luis` y el átomo `programacion`).
    - *Regla (Relación condicional o cláusula de Horn con cabeza y cuerpo):*
      - `puede_rendir_final(X) :- aprobo(X, programacion).`
        - *Cabeza:* `puede_rendir_final(X)` (consecuente).
        - *Operador de implicación:* `:-` ("si").
        - *Cuerpo:* `aprobo(X, programacion)` (antecedente).
  ]

  #respuesta("b")[
    Ante la consulta `?- puede_rendir_final(ana).`, el sistema responderá:
    *`true`* (o *`yes`* dependiendo del intérprete de Prolog, como SWI-Prolog o GNU Prolog).
  ]

  #respuesta("c")[
    El sistema alcanza esta respuesta mediante el mecanismo de *inferencia lógica* (basado en el principio de *resolución SLD* y el proceso de *unificación*):
    1. Al recibir la consulta `puede_rendir_final(ana)`, el motor busca una cláusula que coincida con ese predicado y encuentra la regla `puede_rendir_final(X) :- aprobo(X, programacion).`.
    2. *Unificación:* Se asocia la variable lógica `X` con la constante `ana` ($X = "ana"$).
    3. La regla establece que para que la cabeza sea verdadera, el cuerpo debe ser demostrado como verdadero. Por lo tanto, el sistema genera la submeta (*goal*): `aprobo(ana, programacion)`.
    4. El sistema consulta su base de hechos y encuentra una coincidencia exacta: `aprobo(ana, programacion).`.
    5. Como la premisa se cumple plenamente, la regla se satisface y el motor infiere lógicamente que `puede_rendir_final(ana)` es verdadero (*true*).
  ]

  #respuesta("d")[
    Este ejemplo se relaciona directamente con el *Paradigma Lógico*.
    - *Fundamento:* Se apoya en la lógica de predicados de primer orden.
    - *Naturaleza Declarativa:* El programador define *el conocimiento* del dominio (relaciones, hechos y reglas que describen el mundo) en lugar de dictar una secuencia algorítmica de pasos o instrucciones para la CPU.
    - *Ejecución:* Es el motor de inferencia el que se encarga automáticamente de buscar soluciones y deducir respuestas a partir de las consultas.
  ]
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
