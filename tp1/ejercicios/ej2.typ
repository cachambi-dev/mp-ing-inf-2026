#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 2
// -------------------------------------------------------------
== 🔹 Punto 2: Análisis de Paradigma Funcional en Python

=== Consigna:
Un sistema de ventas necesita calcular el importe total de una compra. Observe el siguiente fragmento escrito en Python:

```python
from functools import reduce

precios = [1200, 850, 2300, 450]

total = reduce(
    lambda acumulado, precio: acumulado + precio,
    precios,
    0,
)
```

#caja_preguntas[
  + *a)* ¿Con qué paradigma de programación asocia principalmente esta solución?
  + *b)* Identifique dos características del código que permitan justificar su respuesta.
  + *c)* ¿Podría resolverse el mismo problema utilizando otro paradigma? Explique brevemente.
]

#resolucion(titulo: "Resolución y Justificación del Punto 2")[
  #respuesta("a")[
    Esta solución se asocia principalmente al *Paradigma Funcional* (enfoque declarativo). El objetivo se alcanza mediante la aplicación y composición de funciones puras sobre una estructura de datos inmutable en lugar de describir una secuencia de órdenes de control de flujo con variables mutables.
  ]

  #respuesta("b")[
    Se identifican las siguientes características clave del código que sustentan esta asociación:
    1. *Uso de una Función de Orden Superior (`reduce`):* `reduce` (del módulo `functools`) es una función de orden superior característica del paradigma funcional que toma como argumento otra función (`lambda`) y una colección iterable (`precios`), aplicando recursivamente la operación acumulativa sobre los elementos sin necesidad de bucles iterativos explícitos (`for` o `while`).
    2. *Uso de Funciones Anónimas Puras (`lambda`):* La expresión `lambda acumulado, precio: acumulado + precio` define una función matemática pura sin nombre, que recibe dos parámetros y produce un resultado directo sin depender de variables externas ni producir efectos secundarios.
    3. *Enfoque Declarativo e Inmutabilidad:* No se crea una variable acumuladora mutable que cambie de estado en cada iteración del bucle, ni se altera la lista original `precios`. El código declara *qué* resultado se desea obtener a través de una transformación funcional.
  ]

  #respuesta("c")[
    *Sí, el problema puede resolverse perfectamente utilizando otros paradigmas:*

    - *Paradigma Imperativo:* Se puede resolver utilizando una variable acumuladora mutable y un bucle secuencial explícito (`for`):
      ```python
      total = 0
      for precio in precios:
          total += precio
      ```
    - *Paradigma Orientado a Objetos (POO):* Se puede modelar una clase `Carrito` o `Compra` que encapsule la lista de precios como un atributo privado y ofrezca un método `calcular_total()`:
      ```python
      class Compra:
          def __init__(self, precios):
              self._precios = precios

          def calcular_total(self):
              return sum(self._precios)

      compra = Compra([1200, 850, 2300, 450])
      total = compra.calcular_total()
      ```
  ]
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
