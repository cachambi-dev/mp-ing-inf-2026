# Paradigmas de Programación (2026) — Ingeniería Informática

Este repositorio contiene las resoluciones de los trabajos prácticos de la asignatura **Paradigmas de Programación**, correspondiente al plan de estudios de la carrera **Ingeniería Informática** / **Licenciatura en Sistemas** de la **Facultad de Ingeniería – Universidad Nacional de Jujuy** (Ciclo Lectivo 2026).

---

## 🛠️ Tecnologías y Herramientas

*   **Lenguajes de Programación:** Python 3.10+ & Prolog (SWI-Prolog).
*   **Tipografía y Generación de Documentos:** [Typst](https://typst.app/) (v0.11.0 o superior).
*   **Gestión de Versiones:** Git & GitHub.
*   **Entornos de Desarrollo Recomendados:** Visual Studio Code (con extensiones *Typst LSP / Tinymist* y *Python*) o PyCharm.

---

## 📂 Estructura del Proyecto

El repositorio está organizado por Trabajos Prácticos (TPs), modularizando cada punto para máxima claridad y mantenibilidad:

```
mp-ing-inf-2026/
├── template.typ                 # Plantilla base institucional UNJu (estilos, cajas y encabezados)
├── README.md                    # Documentación general del repositorio
└── tp1/                         # Trabajo Práctico N° 1: Introducción a los Paradigmas de Programación
    ├── TP1.typ                  # Documento maestro Typst (compila el informe completo en PDF)
    ├── ejercicios/              # Módulos individuales de cada punto
    │   ├── ej1.typ              # Punto 1: Verdadero o Falso (Imperativo, Funcional, POO, Lógico, Python)
    │   ├── ej2.typ              # Punto 2: Análisis de Paradigma Funcional en Python (reduce, lambda)
    │   ├── ej3.typ              # Punto 3: Análisis de Paradigma Lógico (Hechos, reglas e inferencia en Prolog)
    │   ├── ej4.typ              # Punto 4: Análisis de Solución Imperativa (Secuencia, estado y variables)
    │   ├── ej5.typ              # Punto 5: Paradigma Orientado a Objetos (Clase Producto, atributos y métodos)
    │   ├── ej6.typ              # Punto 6: Comparación de Paradigmas (Imperativo vs POO - Cuenta Bancaria)
    │   ├── ej7.typ              # Punto 7: Implementación Imperativa en Python (Calificaciones de estudiantes)
    │   ├── ej8.typ              # Punto 8: Comparación de Enfoques (POO vs Funcional en Python)
    │   └── ej9.typ              # Punto 9: Actividad Integradora Multiparadigma (Gestión de tienda / compra)
    └── src/                     # Código fuente Python ejecutable
        ├── punto7_imperativo.py # Script imperativo del Punto 7
        ├── punto8_poo.py        # Script orientado a objetos del Punto 8
        ├── punto8_funcional.py  # Script funcional del Punto 8
        └── punto9_tienda.py     # Script integrador POO + Funcional del Punto 9
```

---

## 🚀 Cómo Ejecutar y Compilar

### 1. Compilación del Informe en PDF (Typst)

Para compilar el informe completo del TP1 a formato PDF:

```bash
# Compilar una sola vez
typst compile tp1/TP1.typ tp1/TP1.pdf

# Modo observación (recarga en vivo al guardar cambios)
typst watch tp1/TP1.typ tp1/TP1.pdf
```

### 2. Ejecución de los Programas en Python

Para ejecutar cualquiera de las soluciones prácticas:

```bash
# Punto 7 (Enfoque Imperativo)
python3 tp1/src/punto7_imperativo.py

# Punto 8 (Enfoque Orientado a Objetos)
python3 tp1/src/punto8_poo.py

# Punto 8 (Enfoque Funcional)
python3 tp1/src/punto8_funcional.py

# Punto 9 (Actividad Integradora)
python3 tp1/src/punto9_tienda.py
```

---

## 📖 Temario del Trabajo Práctico N° 1

1. **Paradigma Imperativo:** Estados mutables, asignaciones, bucles e instrucciones secuenciales.
2. **Programación Orientada a Objetos (POO):** Encapsulamiento, abstracción, clases, instancias, estado y comportamiento.
3. **Paradigma Funcional:** Funciones de orden superior, expresiones lambda, funciones puras e inmutabilidad.
4. **Paradigma Lógico:** Lógica declarativa de predicados, hechos, reglas, variables lógicas y resolución por unificación (Prolog).
5. **Enfoque Multiparadigma:** Integración fluida de modelos en lenguajes modernos (Python).
