#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 9
// -------------------------------------------------------------
== 🔹 Punto 9: Actividad Integradora — Gestión de Compra en Tienda

=== Consigna:
Una tienda necesita desarrollar un pequeño programa para gestionar los productos de una compra. De cada producto se conoce su *nombre*, *precio* y *cantidad*.

El programa deberá:
- Registrar al menos *5 productos*.
- Calcular el *importe total de la compra*.
- Mostrar los productos cuyo *precio unitario sea superior a \$10.000*.
- Determinar el producto de *mayor precio unitario*.

#caja_indicaciones[
  Implemente una solución en Python utilizando el paradigma o combinación de paradigmas que considere más adecuada.
]

#resolucion(titulo: "Código Fuente de la Solución Integradora (`src/punto9_tienda.py`)")[
  ```python
  # Inserte o implemente aquí su solución en Python
  ```
]

#caja_preguntas[
  Al finalizar la implementación, responda y justifique los siguientes ítems:
  + *a)* Indique qué paradigma o paradigmas utilizó.
  + *b)* Identifique en su código al menos dos características que permitan reconocerlos.
  + *c)* Justifique brevemente por qué considera adecuada esa elección para resolver el problema.
]

#resolucion(titulo: "Respuestas y Justificación de la Actividad Integradora")[
  #respuesta("a")[
    Se utilizó un enfoque *Multiparadigma*, combinando armónicamente la *Programación Orientada a Objetos (POO)* con el *Paradigma Funcional*:
    - *POO:* Para el modelado de las entidades de negocio (`Producto` y `CarritoCompra`), el encapsulamiento de sus atributos y la cohesión de métodos del dominio.
    - *Funcional:* Para el procesamiento, filtrado y agregación de datos (cálculo del total acumulado mediante `reduce`, filtrado con `filter` y determinación del valor extremo con `max` y funciones lambda).
  ]

  #respuesta("b")[
    Se identifican claramente las siguientes características técnicas en el código fuente:
    + *Características de Programación Orientada a Objetos:*
      - *Definición de Clases y Encapsulamiento:* Las clases `Producto` y `CarritoCompra` protegen sus atributos como privados (`self._nombre`, `self._precio`, `self._cantidad`, `self._productos`) exponiéndolos a través de `@property` e impidiendo inconsistencias con validaciones en el constructor (`__init__`).
      - *Modularidad y Abstracción:* Métodos de instancia como `calcular_subtotal()` o `tiene_precio_mayor_a()` que operan directamente sobre el estado del objeto.
    + *Características de Paradigma Funcional:*
      - *Uso de Funciones de Orden Superior (`reduce`, `filter`):*
        - `reduce(lambda acumulado, prod: acumulado + prod.calcular_subtotal(), self._productos, 0.0)` acumula el total general de forma declarativa sin mutar variables en bucles.
        - `list(filter(lambda p: p.tiene_precio_mayor_a(umbral), self._productos))` filtra la colección aplicando un predicado puro.
      - *Funciones Anónimas (`lambda`):* Empleo de funciones lambda inline puras para definir criterios de acumulación, filtrado y comparación en `max(..., key=lambda p: p.precio)`.
  ]

  #respuesta("c")[
    *Justificación de la Elección Multiparadigma:*
    + *Claridad y Robustez Estructural:* La POO ofrece un esquema claro y natural para representar los ítems del carrito y salvaguardar sus invariantes (evitando precios o cantidades negativas o nulas).
    + *Expresividad y Concisión en Procesamiento:* El uso de patrones funcionales sobre colecciones simplifica notablemente la lógica de agregación y filtrado, eliminando la necesidad de variables auxiliares mutables dispersas o bucles anidados propensos a errores de índice.
    + *Alineación con el Ecosistema Python:* Python está diseñado específicamente como un lenguaje multiparadigma. Explotar las fortalezas de la POO para la arquitectura del modelo y las herramientas funcionales para el flujo de datos representa la práctica más idiomática y profesional en la ingeniería de software moderna.
  ]
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
