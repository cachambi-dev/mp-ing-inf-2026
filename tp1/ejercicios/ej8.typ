#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 8
// -------------------------------------------------------------
== 🔹 Punto 8: Comparación de Enfoques sobre el Mismo Problema

=== Consigna:
Resuelva el problema planteado en el punto 7 utilizando *dos paradigmas de programación diferentes*.

Para cada solución:
- Indique el paradigma utilizado.
- Implemente la solución en Python.
- Compare ambas soluciones e indique cuál considera más apropiada para este problema, justificando su elección.

#resolucion(titulo: "Solución 1: Paradigma Orientado a Objetos (POO)")[
  *Paradigma Utilizado:* *Programación Orientada a Objetos (POO)*.

  *Fundamentación del Enfoque:*
  - Se modela la entidad `Estudiante` encapsulando su estado (`_nombre`, `_calificacion`) y sus reglas de validación en el constructor.
  - La clase `GestionCurso` actúa como gestor del dominio, encapsulando la lista de estudiantes y proveyendo métodos de alto nivel (`obtener_mejor_estudiante()`, `calcular_promedio()`, `obtener_aplazados()`).

  *Código Fuente (`src/punto8_poo.py`):*
  ```python
  # Inserte o implemente aquí su solución en Python (POO)
  ```
]

#resolucion(titulo: "Solución 2: Paradigma Funcional")[
  *Paradigma Utilizado:* *Programación Funcional (Declarativo)*.

  *Fundamentación del Enfoque:*
  - Se utiliza una estructura inmutable (`NamedTuple`) para representar al estudiante.
  - No hay mutación de estado: se definen funciones puras sin efectos secundarios (`es_aplazado`, `calcular_promedio`, `encontrar_mejor_estudiante`).
  - Uso de funciones de orden superior (`map`, `filter`, `reduce`) y expresiones declarativas (`lambda`).

  *Código Fuente (`src/punto8_funcional.py`):*
  ```python
  # Inserte o implemente aquí su solución en Python (Funcional)
  ```
]

#resolucion(titulo: "Comparación Crítica y Elección del Paradigma Más Apropiado")[
  #table(
    columns: (1.2fr, 2fr, 2fr),
    align: (left, left, left),
    stroke: 0.5pt + rgb("#cbd5e1"),
    fill: (x, y) => if y == 0 { rgb("#e2e8f0") } else { none },
    [*Criterio*], [*Paradigma Orientado a Objetos (POO)*], [*Paradigma Funcional*],
    [*Modelado del Dominio*], [Excelente: representa fielmente entidades del mundo real (`Estudiante`, `Curso`).], [Abstrayente: modela el problema como un flujo continuo de transformaciones de datos.],
    [*Manejo de Estado*], [Estado encapsulado y protegido dentro de cada instancia.], [Inmutabilidad total; no existen variables de estado mutables.],
    [*Escalabilidad*], [Muy alta: permite agregar atributos (legajo, comisiones), herencia y polimorfismo.], [Alta para operaciones analíticas, pero requiere tuberías de funciones más complejas.],
    [*Extensibilidad de Comportamiento*], [Fácil adición de métodos de negocio dentro de la clase.], [Fácil adición de nuevas funciones sin alterar estructuras de datos preexistentes.],
    [*Testeo Unitario*], [Requiere instanciación previa de objetos de prueba.], [Muy directo gracias al determinismo de las funciones puras.]
  )

  #v(6pt)
  #text(weight: "bold", fill: rgb("#0f4c81"))[Justificación de la Elección:] \
  Para este problema particular de *gestión académica de calificaciones*:
  - El *Paradigma Orientado a Objetos (POO)* se considera el *más apropiado y robusto*.
  - *Razón principal:* Un sistema académico real tiende a complejizarse rápidamente (incorporando legajos, múltiples materias, asistencias, promociones, correlatividades y reglas de validación específicas). La POO proporciona el encapsulamiento idóneo para salvaguardar la integridad de los datos de cada estudiante y desacoplar la interfaz de usuario de las reglas del dominio.
  - No obstante, la combinación de POO para modelar las entidades junto con *herramientas funcionales* (como `reduce` o comprensiones para estadísticas y filtrados) constituye la solución idiomática moderna más elegante y eficiente en Python.
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
