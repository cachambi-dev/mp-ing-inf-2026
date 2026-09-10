def insertionSortByDuration(lts):
    vuelos = [vuelo[:] for vuelo in lts]
    for i in range(1, len(vuelos)):
        clave = vuelos[i]
        j=i-1
        while j >= 0 and vuelos[j][1] > clave[1]:
            vuelos[j+1] = vuelos[j]
            j-=1
            vuelos[j+1] = clave
    return vuelos

def bubbleSortByCountPassenges(lts):
    vuelos = [vuelo[:] for vuelo in lts]
    size = len(vuelos)
    for i in range(size):
        for j in range(0,size-i-1):
            if(vuelos[j][2] < vuelos[j+1][2]):
                vuelos[j], vuelos[j+1] = vuelos[j+1], vuelos[j]
    return vuelos    


vuelos = [["IB123", 180, 150], ["UX456", 90, 80], ["RY789", 240, 200], ["VY321", 120, 100],
["AF654", 300, 180]]

# b. Inserción por duración (menor a mayor)
por_duracion = insertionSortByDuration(vuelos)
print("--- Vuelos ordenados por duración (menor a mayor) ---")
for v in por_duracion:
    print(f"Vuelo: {v[0]} | Duración: {v[1]} min | Pasajeros: {v[2]}")

# c. Burbuja por pasajeros (mayor a menor)
por_pasajeros = bubbleSortByCountPassenges(vuelos)
print("\n--- Vuelos ordenados por pasajeros (mayor a menor) ---")
for v in por_pasajeros:
    print(f"Vuelo: {v[0]} | Pasajeros: {v[2]} | Duración: {v[1]} min")
          # d. Extremos
vuelo_mas_corto = por_duracion[0]
vuelo_mas_pasajeros = por_pasajeros[0]
print("\n--- Resultados clave ---")
print(f"Vuelo más corto: {vuelo_mas_corto[0]} ({vuelo_mas_corto[1]} minutos)")
print(f"Vuelo con más pasajeros: {vuelo_mas_pasajeros[0]} ({vuelo_mas_pasajeros[2]} pasajeros)")