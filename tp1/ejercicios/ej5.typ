#import "../../template.typ": *

// -------------------------------------------------------------
// EJERCICIO 5
// -------------------------------------------------------------
== 🔹 Punto 5: Paradigma Orientado a Objetos (POO) — Clase `Producto`

=== Consigna:
Una tienda necesita representar los productos disponibles en su sistema. Observe el siguiente código:

```python
class Producto:
    def __init__(self, nombre, precio):
        self.nombre = nombre
        self.precio = precio

    def aplicar_descuento(self, porcentaje):
        self.precio -= self.precio * porcentaje / 100

producto = Producto("Teclado", 10000)
producto.aplicar_descuento(10)
```

#caja_preguntas[
  + *a)* ¿Con qué paradigma de programación se relaciona principalmente esta solución? Justifique.
  + *b)* Identifique en el código:
    - la clase;
    - el objeto;
    - los atributos que representan su estado;
    - el método que representa su comportamiento.
  + *c)* ¿Cuál es el estado inicial del objeto `producto`?
  + *d)* ¿Qué ocurre con su estado después de ejecutar `producto.aplicar_descuento(10)`?
]

#resolucion(titulo: "Resolución y Justificación del Punto 5")[
  #respuesta("a")[
    Esta solución se relaciona con el *Paradigma Orientado a Objetos (POO)*.
    - Se modela la entidad del mundo real a través de una abstracción denominada clase (`Producto`).
    - *Encapsulamiento:* Se combinan de forma cohesiva los datos/atributos (`nombre`, `precio`) con las operaciones que actúan sobre ellos (`aplicar_descuento`).
    - La ejecución se produce mediante la instanciación de un objeto en memoria y el posterior envío de mensajes / llamada a métodos (`producto.aplicar_descuento(10)`), provocando la mutación controlada del estado interno de dicha instancia.
  ]

  #respuesta("b")[
    Identificación de los elementos fundamentales de POO en el código:
    - *La clase:* `Producto` (es la plantilla o molde que define la estructura y el comportamiento de cualquier producto).
    - *El objeto / instancia:* `producto` (la variable que almacena la referencia a la instancia concreta creada en memoria mediante `Producto("Teclado", 10000)`).
    - *Los atributos (estado interno):*
      - `self.nombre`: almacena el nombre descriptivo del producto (`str`).
      - `self.precio`: almacena el valor monetario del producto (`int` / `float`).
    - *El método (comportamiento):*
      - `aplicar_descuento(self, porcentaje)`: define la operación que recalcula y actualiza el precio del producto según un porcentaje dado.
      - _(Nota: `__init__(self, nombre, precio)` es el método constructor especial encargado de inicializar el estado del objeto al momento de su creación)._
  ]

  #respuesta("c")[
    El *estado inicial* del objeto `producto` tras ejecutarse el constructor `__init__` es:
    - `nombre` $=$ `"Teclado"`
    - `precio` $=$ `10000`
  ]

  #respuesta("d")[
    Al ejecutar la instrucción `producto.aplicar_descuento(10)`:
    - El método evalúa: `self.precio = self.precio - (self.precio * 10 / 100)` $==> 10000 - 1000.0 = 9000.0$.
    - *Mutación de estado:* El atributo `self.precio` cambia su valor a *`9000.0`*, mientras que el atributo `self.nombre` permanece inalterado como `"Teclado"`.
    - El *nuevo estado* del objeto pasa a ser: `{ nombre: "Teclado", precio: 9000.0 }`.
  ]
]

#line(length: 100%, stroke: 0.5pt + rgb("#cbd5e1"))
