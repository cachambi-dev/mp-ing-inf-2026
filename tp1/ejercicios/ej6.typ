#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 6
// -------------------------------------------------------------
== 🔹 Punto 6: Comparación de Paradigmas — Cuenta Bancaria

=== Consigna:
Una aplicación necesita representar una cuenta bancaria y permitir realizar depósitos. Se proponen dos formas simplificadas de resolver el problema:

#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    *Solución A:*
    ```python
    saldo = 1000
    deposito = 500
    saldo = saldo + deposito
    ```
  ],
  [
    *Solución B:*
    ```python
    class Cuenta:
        def __init__(self, saldo):
            self.saldo = saldo

        def depositar(self, monto):
            self.saldo += monto

    cuenta = Cuenta(1000)
    cuenta.depositar(500)
    ```
  ]
)

#caja_preguntas[
  A partir de ambas soluciones:
  + *a)* ¿Con qué paradigma relaciona principalmente cada solución? Justifique.
  + *b)* ¿Dónde se encuentra representado el estado en cada caso?
  + *c)* ¿Qué diferencia observa en la forma en que ambas soluciones organizan los datos y las operaciones?
  + *d)* Si el sistema creciera y cada cuenta necesitara almacenar titular, saldo, número de cuenta y diferentes operaciones, ¿cuál de las dos formas considera que facilitaría mejor la organización del programa? Justifique.
]

#resolucion(titulo: "Resolución y Justificación del Punto 6")[
  #respuesta("a")[
    - *Solución A -> Paradigma Imperativo:* Opera con variables globales/sueltas y modifica su valor mediante sentencias aritméticas directas y asignaciones secuenciales.
    - *Solución B -> Paradigma Orientado a Objetos (POO):* Modela la entidad `Cuenta` como una clase, encapsulando los datos (`self.saldo`) y ofreciendo una interfaz de métodos (`depositar`) para interactuar con la instancia.
  ]

  #respuesta("b")[
    - *En la Solución A:* El estado se encuentra disperso en variables libres del espacio de nombres local o global (`saldo = 1000`).
    - *En la Solución B:* El estado se encuentra *encapsulado* dentro del atributo de instancia `self.saldo` perteneciente al objeto `cuenta` alojado en memoria dinámica (Heap).
  ]

  #respuesta("c")[
    - *Desacoplamiento vs. Encapsulamiento:* En la Solución A, los datos (`saldo`) y la operación matemática (`+`) están completamente separados; cualquier parte externa del código puede alterar `saldo` sin control ni validaciones. En la Solución B, los datos y las operaciones están fuertemente cohesionados dentro de la clase `Cuenta`.
    - *Comunicación por Mensajes:* En POO, la interacción se realiza enviando un mensaje al objeto (`cuenta.depositar(500)`), garantizando que toda operación sobre el saldo pase obligatoriamente por la lógica definida en el método de la clase.
  ]

  #respuesta("d")[
    La *Solución B (Orientada a Objetos)* facilitaría enormemente la organización y escalabilidad del software por las siguientes razones:

    + *Modularidad y Escalabilidad:* Permite crear múltiples cuentas bancarias independientes (`cuenta1 = Cuenta(...)`, `cuenta2 = Cuenta(...)`) sin colisión de nombres de variables. En el enfoque imperativo simple, se requeriría una maraña de listas paralelas (`titulares[]`, `saldos[]`, `numeros[]`) o variables prefijadas (`saldo1`, `saldo2`).
    + *Encapsulamiento y Validación:* Permite proteger los atributos e incorporar reglas de negocio dentro de los métodos (por ejemplo, validar que el depósito sea positivo, que una extracción no deje saldo negativo, etc.) en un único lugar centralizado.
    + *Mantenibilidad y Extensibilidad:* Facilita la adición de nuevas funcionalidades (métodos como `transferir()`, `extraer()`, `emitir_resumen()`) o la especialización mediante herencia (ej. `CuentaAhorro`, `CuentaCorriente`) sin romper el resto del sistema.
  ]
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
