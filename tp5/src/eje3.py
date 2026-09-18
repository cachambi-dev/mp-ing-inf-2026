from typing import List, Dict, Any

def cargar_libros(ruta_archivo:str) -> List:
    libros: List = []
    try:
        with open(ruta_archivo, mode="r", encoding="utf-8") as fichero:
            for linea_num, linea in enumerate(fichero, start=1):
                linea_limpia = linea.rstrip("\r\n")
                if not linea_limpia.strip():
                    continue

                partes = linea_limpia.split(";")

                if len(partes) == 7:
                     libros.append(partes)
                else:
                    print(f"Adevertencia: Linea {linea_num} ignorada por formato invalido.")
    except FileExistsError:
        print(f"Error: No se encontro el archivo de origen en '{ruta_archivo}'")
    return libros

def bubble_sort_titulo(lts:List)->List:
    ordenado = [r[:] for r in lts]
    n = len(lts)
    for i in range(n):
        for j in range(0, n -i -1):
            if ordenado[j][1] > ordenado[j+1][1]:
                ordenado[j], ordenado[j+1] = ordenado[j+1], ordenado[j]
    return ordenado

def busqueda_binaria_por_titulo(lts:List, titulo:str)->str:
    ordenado = bubble_sort_titulo(lts)
    inicio = 0
    fin = len(ordenado) -1
    while inicio <= fin:
        medio = (inicio + fin) // 2
        if ordenado[medio][1].lower() == titulo.lower():
            return f"El libro con titulo '{titulo}' tiene la siguiente informacion: {ordenado[medio]}"
        elif ordenado[medio][1].lower() < titulo.lower():
            inicio = medio + 1
        else:
            fin = medio - 1

    return f"No se encontro el libro con titulo '{titulo}' en la lista."

def buscar_por_genero(lts:List, genero:str)->List:
    resultado = []
    for libro in lts:
        if libro[3].lower().find(genero.lower()) == 0:
            resultado.append(libro)
    return resultado


def bumble_sort_precio(lts:List)->List:
    ordenado = [r[:] for r in lts]
    n = len(lts)
    for i in range(n):
        for j in range(0, n -i -1):
            if ordenado[j][5] > ordenado[j+1][5]:
                ordenado[j], ordenado[j+1] = ordenado[j+1], ordenado[j]
    return ordenado

def obtener_libros_por_autor(lts:List, autor:str)->List:
    ordenado = bumble_sort_precio(lts)
    resultado = []
    for libro in ordenado:
        if libro[2].lower() == autor.lower():
            resultado.append(libro)
    return resultado

def listar_libros_segun_rango_precio(lts:List, precio_min:float, precio_max:float)->List:
    resultado = []
    ordenado = bumble_sort_precio(lts)
    for libro in ordenado:
        if precio_min <= float(libro[5]) <= precio_max:
            resultado.append(libro)
    return resultado


def modificar_precio_libro_segun_estado_p(lts:List, porcentaje:float = 15)->List:
    for libro in lts:
        if libro[6].lower() == "P":
            libro[5] = str(float(libro[5]) * (1 + porcentaje / 100))
    return lts


ARCHIVO_ENTRADA = "./Archivos-txt/libros.txt"
lista_libro = cargar_libros(ARCHIVO_ENTRADA)
print(f"{lista_libro}")
print("Busqueda binaria por titulo")
titulo_a_buscar = str(input("Ingrese el titulo del libro a buscar: "))
print(busqueda_binaria_por_titulo(lista_libro, titulo_a_buscar))

print("Busqueda por genero")
genero_a_buscar = input("Ingrese el genero del libro a buscar: ")
print(buscar_por_genero(lista_libro, genero_a_buscar))

print("Busqueda por autor")
autor_a_buscar = input("Ingrese el autor del libro a buscar: ")
print(obtener_libros_por_autor(lista_libro, autor_a_buscar))

print("Busqueda por rango de precio")
precio_min = float(input("Ingrese el precio minimo: "))
precio_max = float(input("Ingrese el precio maximo: "))
print(listar_libros_segun_rango_precio(lista_libro, precio_min, precio_max))

print("Modificacion de precio por estado")
porcentaje = float(input("Ingrese el porcentaje de aumento: "))
print(modificar_precio_libro_segun_estado_p(lista_libro, porcentaje))