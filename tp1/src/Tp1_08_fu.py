# Paradigma de programación funcional
# Ejercicio 8 tp1
# Cachambi, Nahuel Alberto

from functools import reduce
from typing import NamedTuple


class Estudiante(NamedTuple):
	nombre: str
	calificacion: float


def crear_estudiante(datos):
	nombre, calificacion = datos
	if calificacion < 0 or calificacion > 100:
		raise ValueError("La calificación debe estar entre 0 y 100.")
	return Estudiante(nombre, calificacion)


def calcular_promedio(estudiantes):
	suma = reduce(
		lambda acumulado, estudiante: acumulado + estudiante.calificacion,
		estudiantes,
		0,
	)
	return round(suma / len(estudiantes), 2)


def encontrar_mejor_estudiante(estudiantes):
	return reduce(
		lambda mejor, estudiante: (
			estudiante
			if estudiante.calificacion > mejor.calificacion
			else mejor
		),
		estudiantes[1:],
		estudiantes[0],
	)


def es_aplazado(estudiante):
	return estudiante.calificacion < 50


def obtener_aplazados(estudiantes):
	return tuple(filter(es_aplazado, estudiantes))


def cargar_estudiantes():
	print("--- Carga de 10 estudiantes ---")
	datos = []

	for numero in range(10):
		print(f"\nEstudiante #{numero + 1}")
		nombre = input("Ingrese el nombre: ")
		calificacion = float(input("Ingrese la calificación (0-100): "))

		while calificacion < 0 or calificacion > 100:
			print("Error: La calificación debe estar entre 0 y 100.")
			calificacion = float(
				input("Ingrese la calificación nuevamente: ")
			)

		datos.append((nombre, calificacion))

	return tuple(map(crear_estudiante, datos))


def mostrar_resultados(estudiantes):
	mejor_estudiante = encontrar_mejor_estudiante(estudiantes)
	estudiantes_aplazados = obtener_aplazados(estudiantes)
	promedio = calcular_promedio(estudiantes)

	print("Promedio general de calificaciones:", promedio)
	print("\nEstudiante sobresaliente:")
	print(f"{mejor_estudiante.nombre}: {mejor_estudiante.calificacion:.2f}")
	print("\nEstudiantes aplazados:")
	for estudiante in estudiantes_aplazados:
		print(f"{estudiante.nombre}: {estudiante.calificacion:.2f}")


estudiantes = cargar_estudiantes()
mostrar_resultados(estudiantes)

