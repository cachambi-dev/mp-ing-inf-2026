#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 7
// -------------------------------------------------------------
== 🔹 Punto 7: Implementación en Python — Paradigma Imperativo

=== Consigna:
El área académica necesita procesar las calificaciones de un grupo de estudiantes.
Desarrolle un programa en Python que permita registrar el nombre y la calificación de *10 estudiantes*.

Una vez finalizada la carga, el programa deberá informar:
- El nombre y la calificación del estudiante con *mayor nota*.
- El *promedio general* de las calificaciones.
- Los nombres de los estudiantes *aplazados*.

#caja_indicaciones[
  - Las calificaciones deben estar comprendidas entre *0 y 100 puntos*.
  - Se considera aplazado a un estudiante cuya calificación sea *menor a 50 puntos*.
  - Para este ejercicio, resuelva el problema utilizando principalmente un *enfoque imperativo*.
  - Utilice nombres de variables descriptivos y organice el código de manera clara y secuencial.
]

#resolucion(titulo: "Resolución del Punto 7 — Código Fuente y Explicación")[
  *Explicación y Justificación del Enfoque Imperativo:*

  El código implementado en `Tp1_07.py` sigue estrictamente los principios del *Paradigma Imperativo*, estructurando la solución en tres fases secuenciales bien diferenciadas:

  + *1. Estructura de Datos y Carga con Validación:*
    - Se utiliza una lista de diccionarios (`estudiantes = []`) donde cada elemento almacena los pares clave-valor `{"nombre": nombre, "calificacion": calificacion}`.
    - Se emplea un bucle iterativo determinado `for i in range(10)` para solicitar los datos de los 10 estudiantes.
    - Se implementa una validación por control de flujo mediante un bucle condicional `while calificacion < 0 or calificacion > 100:`, garantizando que la ejecución no prosiga hasta que se ingrese un valor dentro del rango válido $[0, 100]$.

  + *2. Procesamiento mediante Variables de Estado Mutables:*
    - Se inicializan variables de seguimiento y acumulación: `estudiante_sobresaliente` (tomando como base inicial el primer elemento `estudiantes[0]`), la lista `estudiantes_aplazados = []` y el acumulador `suma_calificaciones = 0`.
    - Se recorre la colección de forma secuencial (`for estudiante in estudiantes:`), transformando el estado del programa paso a paso:
      - *Acumulación:* `suma_calificaciones += estudiante["calificacion"]` para sumar las notas.
      - *Determinación del máximo:* Se compara y reasigna `estudiante_sobresaliente` si la nota actual es mayor.
      - *Filtrado de aplazos:* Se evalúa la condición `estudiante["calificacion"] < 50` y se agrega el estudiante a la lista de aplazados.

  + *3. Cálculo de Métricas y Emisión de Resultados:*
    - Se calcula el promedio aritmético general mediante `promedio = round(suma_calificaciones / len(estudiantes), 2)`.
    - Se emiten los resultados requeridos por consola: el promedio general, los datos del estudiante con mayor calificación y la lista detallada de estudiantes aplazados.

  *Código Fuente (`src/Tp1_07.py`):*

  #raw(read("../src/Tp1_07.py"), lang: "python")
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
