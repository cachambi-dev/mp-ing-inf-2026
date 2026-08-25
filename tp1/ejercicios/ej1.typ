#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 1
// -------------------------------------------------------------
== 🔹 Punto 1: Conceptos Fundamentales de Paradigmas de Programación

=== Consigna:
Indicar si cada una de las siguientes afirmaciones es *Verdadera (V)* o *Falsa (F)*, justificando de manera conceptual y técnica cada respuesta:

#caja_preguntas[
  + *A.* En el paradigma imperativo, el programador describe una secuencia de instrucciones que modifican el estado del programa para alcanzar un resultado.
  + *B.* En programación orientada a objetos, los objetos pueden combinar datos (estado) y operaciones que actúan sobre esos datos (comportamiento).
  + *C.* En el paradigma funcional, la solución se basa principalmente en modificar variables mediante una secuencia de instrucciones.
  + *D.* En el paradigma lógico, el programador puede expresar hechos y reglas a partir de los cuales el sistema infiere respuestas.
  + *E.* Un lenguaje de programación debe pertenecer exclusivamente a un único paradigma.
  + *F.* Python permite utilizar características de diferentes paradigmas, como programación imperativa, orientada a objetos y funcional.
]

#resolucion(titulo: "Resolución y Justificación del Punto 1")[
  #respuesta("A")[
    *VERDADERO (V)* \
    El paradigma imperativo se fundamenta en la arquitectura de Von Neumann y en el concepto de *máquina de estados*. En este enfoque, el programador especifica explícitamente el *cómo* resolver el problema mediante una secuencia ordenada de sentencias o comandos que transforman el estado mutable de la memoria (variables) a lo largo del tiempo hasta producir la salida deseada.
  ]

  #respuesta("B")[
    *VERDADERO (V)* \
    El pilar central de la Programación Orientada a Objetos (POO) es el principio de *encapsulamiento* y *cohesión*. Un objeto es una entidad computacional que integra y cohesiona sus datos o atributos internos (que conforman su *estado*) junto con los métodos o funciones miembro (que definen su *comportamiento* y las operaciones que puede realizar sobre dicho estado).
  ]

  #respuesta("C")[
    *FALSO (F)* \
    El paradigma funcional es de naturaleza *declarativa* y se basa en el cálculo lambda. Sus principios rectores son la *inmutabilidad* de los datos y la ausencia de *efectos secundarios* (side effects). Las soluciones se expresan mediante la evaluación y composición de funciones matemáticas puras, evitando explícitamente la mutación de variables y las secuencias de órdenes paso a paso características del paradigma imperativo.
  ]

  #respuesta("D")[
    *VERDADERO (V)* \
    En la programación lógica (cuyo máximo exponente es *Prolog*), el programador no define algoritmos secuenciales, sino que describe una base de conocimiento compuesta por *hechos* (afirmaciones incondicionales de verdad) y *reglas* (relaciones lógicas condicionales basadas en cláusulas de Horn). A partir de allí, el motor de inferencia (utilizando unificación y resolución) deduce las respuestas ante las consultas realizadas.
  ]

  #respuesta("E")[
    *FALSO (F)* \
    La gran mayoría de los lenguajes de programación industriales y modernos son *multiparadigma* (por ejemplo: Python, C++, Java, JavaScript, Scala, Rust, C\#). Permiten al desarrollador seleccionar y combinar libremente herramientas imperativas, orientadas a objetos, funcionales o declarativas según resulte más conveniente para la arquitectura y legibilidad del software.
  ]

  #respuesta("F")[
    *VERDADERO (V)* \
    Python es un lenguaje multiparadigma por excelencia:
    - *Imperativo:* Soporta ejecución secuencial, estructuras de control (`for`, `while`, `if`) y variables mutables.
    - *Orientado a Objetos:* Trata a todos los elementos como objetos y soporta clases, herencia, encapsulamiento y polimorfismo.
    - *Funcional:* Provee funciones como ciudadanos de primera clase (*first-class citizens*), funciones anónimas (`lambda`), funciones de orden superior (`map`, `filter`, `reduce`), módulos como `functools` e `itertools`, y comprensiones de listas (*list comprehensions*).
  ]
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
