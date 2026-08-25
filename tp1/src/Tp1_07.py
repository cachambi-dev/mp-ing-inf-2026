# Ejercicio 7 tp1
# Cachambi, Nahuel Alberto

estudiantes = []

print("--- Carga de 10 estudiantes ---")
for i in range(10):
    print(f"\nEstudiante #{i + 1}")
    nombre = input("Ingrese el nombre: ")
    
    calificacion = float(input("Ingrese la calificación (0-100): "))
    while calificacion < 0 or calificacion > 100:
        print("Error: La calificación debe estar entre 0 y 100.")
        calificacion = float(input("Ingrese la calificación nuevamente: "))
        
    estudiantes.append({"nombre": nombre, "calificacion": calificacion})

estudiante_sobresaliente = estudiantes[0]
estudiantes_aplazados = []
suma_calificaciones = 0

for estudiante in estudiantes:
    suma_calificaciones += estudiante["calificacion"]

    if estudiante_sobresaliente["calificacion"] < estudiante["calificacion"]:
        estudiante_sobresaliente = estudiante

    if estudiante["calificacion"] < 50:
        estudiantes_aplazados.append(estudiante)

promedio = round(suma_calificaciones / len(estudiantes),2)

print("Promedio general de calificaciones:", promedio)

print("\nEstudiante sobresaliente:")
print(estudiante_sobresaliente)

print("\nEstudiantes aplazados:")
for aplazado in estudiantes_aplazados:
    print(aplazado)