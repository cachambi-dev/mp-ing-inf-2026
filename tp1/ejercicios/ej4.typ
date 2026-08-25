#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 4
// -------------------------------------------------------------
== 🔹 Punto 4: Análisis de una Solución en Paradigma Imperativo

=== Consigna:
Un comercio necesita calcular el importe final de una compra aplicando un descuento. Observe el siguiente código:

```python
precio = 10000
descuento = 10

importe_descuento = precio * descuento / 100
precio_final = precio - importe_descuento

print(precio_final)
```

#caja_preguntas[
  A partir del código anterior:
  + *a)* ¿Con qué paradigma de programación se relaciona principalmente esta solución? Justifique.
  + *b)* Identifique la secuencia de pasos que sigue el programa para obtener el resultado.
  + *c)* ¿Qué variables cambian o representan el estado del programa durante la ejecución?
  + *d)* ¿Cuál será el valor de `precio_final` al finalizar la ejecución?
]

#resolucion(titulo: "Resolución y Justificación del Punto 4")[
  #respuesta("a")[
    Esta solución se relaciona directamente con el *Paradigma Imperativo* (estructurado y secuencial).
    - El programa está estructurado como una serie ordenada de sentencias ejecutadas secuencialmente de arriba hacia abajo.
    - Se basa en la modificación del estado del programa mediante sentencias de asignación sobre posiciones de memoria (variables).
    - La lógica se enfoca en detallar explícitamente el *cómo* paso a paso para transformar los datos de entrada en el resultado de salida.
  ]

  #respuesta("b")[
    La secuencia cronológica de pasos que sigue el intérprete es la siguiente:
    + *Paso 1 (Inicialización de precio):* Se asigna el valor literal entero `10000` a la variable `precio`.
    + *Paso 2 (Inicialización de tasa de descuento):* Se asigna el valor literal entero `10` a la variable `descuento`.
    + *Paso 3 (Cálculo del descuento):* Se evalúa la expresión aritmética `precio * descuento / 100` ($10000 times 10 / 100 = 1000.0$) y se almacena en la variable `importe_descuento`.
    + *Paso 4 (Cálculo del precio final):* Se evalúa la resta entre `precio` e `importe_descuento` ($10000 - 1000.0 = 9000.0$) y se asigna a la variable `precio_final`.
    + *Paso 5 (Salida por consola):* Se invoca la función predefinida `print()`, enviando el valor de `precio_final` (`9000.0`) a la salida estándar.
  ]

  #respuesta("c")[
    El estado del programa en memoria está constituido por el conjunto de variables y sus valores en cada instante de tiempo:
    - `precio`: Variable numérica (`int`) que almacena el costo original (\$10.000).
    - `descuento`: Variable numérica (`int`) que representa el porcentaje a descontar (10%).
    - `importe_descuento`: Variable numérica (`float`) que almacena el monto monetario deducido (\$1.000,0).
    - `precio_final`: Variable numérica (`float`) que representa el importe neto a pagar (\$9.000,0).
  ]

  #respuesta("d")[
    Al finalizar la ejecución, el valor de la variable `precio_final` será exactamente *`9000.0`* (en formato de punto flotante en Python).
  ]
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
