# Paradigma de programacion orientado a objetos
# Ejercicio 8 tp1
# Cachambi, Nahuel Alberto

class Estudiante:
    def __init__(self, nombre, calificacion):
        if calificacion < 0 or calificacion > 100:
            raise ValueError("La calificación debe estar entre 0 y 100.")

        self._nombre = nombre
        self._calificacion = calificacion

    @property
    def nombre(self):
        return self._nombre

    @property
    def calificacion(self):
        return self._calificacion

    def esta_aplazado(self):
        return self._calificacion < 50

    def __str__(self):
        return f"{self._nombre}: {self._calificacion:.2f}"


class GestionCurso:
    def __init__(self):
        self._estudiantes = []

    def agregar_estudiante(self, estudiante):
        self._estudiantes.append(estudiante)

    def obtener_mejor_estudiante(self):
        mejor_estudiante = self._estudiantes[0]
        for estudiante in self._estudiantes[1:]:
            if estudiante.calificacion > mejor_estudiante.calificacion:
                mejor_estudiante = estudiante
        return mejor_estudiante

    def calcular_promedio(self):
        suma_calificaciones = 0
        for estudiante in self._estudiantes:
            suma_calificaciones += estudiante.calificacion
        return round(suma_calificaciones / len(self._estudiantes), 2)

    def obtener_aplazados(self):
        estudiantes_aplazados = []
        for estudiante in self._estudiantes:
            if estudiante.esta_aplazado():
                estudiantes_aplazados.append(estudiante)
        return estudiantes_aplazados


curso = GestionCurso()

print("--- Carga de 10 estudiantes ---")
for i in range(10):
    print(f"\nEstudiante #{i + 1}")
    nombre = input("Ingrese el nombre: ")
    
    calificacion = float(input("Ingrese la calificación (0-100): "))
    while calificacion < 0 or calificacion > 100:
        print("Error: La calificación debe estar entre 0 y 100.")
        calificacion = float(input("Ingrese la calificación nuevamente: "))
        
    curso.agregar_estudiante(Estudiante(nombre, calificacion))

promedio = curso.calcular_promedio()
estudiante_sobresaliente = curso.obtener_mejor_estudiante()
estudiantes_aplazados = curso.obtener_aplazados()

print("Promedio general de calificaciones:", promedio)

print("\nEstudiante sobresaliente:")
print(estudiante_sobresaliente)

print("\nEstudiantes aplazados:")
for aplazado in estudiantes_aplazados:
    print(aplazado)