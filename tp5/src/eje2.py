from typing import List, Dict, Any

def cargar_videojuegos(ruta_archivo:str) -> List[Dict[str,Any]]:
    videojuegos: List[Dict[str,Any]] = []
    try:
        with open(ruta_archivo, mode="r", encoding="utf-8") as fichero:
            for linea_num, linea in enumerate(fichero, start=1):
                linea_limpia = linea
                if not linea_limpia:
                    continue

                partes = linea_limpia.split(";")

                if len(partes) == 7:
                     codigo, titulo, estudio, genero, anio_lanzamiento, precio, estado = partes
                     videojuego = {
                         "codigo" : codigo.strip(),
                         "titulo": titulo.strip().capitalize(),
                         "estudio": estudio.strip(),
                         "genero": genero.strip().upper(),
                         "anio_lanzamiento": int(anio_lanzamiento.strip()),
                         "precio": float(precio.strip()),
                         "estado": estado.strip()
                     }
                     videojuegos.append(videojuego)
                else:
                    print(f"Adevertencia: Linea {linea_num} ignorada por formato invalido.")
    except FileExistsError:
        print(f"Error: No se encontro el archivo de origen en '{ruta_archivo}'")
    return videojuegos

def generar_informe_ofertas(limite_precio: float, videojuegos: List[Dict[str,Any]]) -> int:
    ofertas = [v for v in videojuegos if v["precio"] < limite_precio]
    ARCHIVO_SALIDA = f"./Archivos-txt/ofertasMenoresa({len(ofertas)}).txt"
    try:
        with open(ARCHIVO_SALIDA, mode="w", encoding="utf-8") as fichero_salida:
            fichero_salida.write("Videojuegos en oferta\n\n")

            for juego in ofertas:
                lista_juego = [juego["titulo"], juego["estudio"], f"{juego['precio']:.2f}"]
                linea_informe = f"{';'.join(lista_juego)}\n"
                fichero_salida.write(linea_informe)

            fichero_salida.write(f"\nCantidad de videojuegos en oferta: {len(ofertas)}")
    except IOError as e:
        print(f"Error de E/S al intentar escribir el archivo '{ARCHIVO_SALIDA}`:{e}")
        return 0
    return len(ofertas)

def metodo_sort_quick_descendiente_por_precio(videojuegos: List[Dict[str,Any]]) -> List[Dict[str,Any]]:
    if len(videojuegos) <= 1:
        return videojuegos
    else:
        pivote = videojuegos[0]
        menores = [v for v in videojuegos[1:] if v["precio"] > pivote["precio"]]
        iguales = [v for v in videojuegos[1:] if v["precio"] == pivote["precio"]]
        mayores = [v for v in videojuegos[1:] if v["precio"] < pivote["precio"]]

        return metodo_sort_quick_descendiente_por_precio(menores) + [pivote] + iguales + metodo_sort_quick_descendiente_por_precio(mayores)

def devolver_2_juegos_mas_caros(videojuegos: List[Dict[str,Any]]) -> List[Dict[str,Any]]:
    videojuegos_ordenados = metodo_sort_quick_descendiente_por_precio(videojuegos)
    return videojuegos_ordenados[:2]

def buscar_videojuego_por_titulo(videojuegos: List[Dict[str,Any]], titulo: str) -> int:
    videojuegos = [v for v in videojuegos if v["titulo"].lower().find(titulo.lower()) != -1]
    return len(videojuegos)

#a
ARCHIVO_ENTRADA = "./Archivos-txt/juegos.txt"
lista_videojuegos = cargar_videojuegos(ARCHIVO_ENTRADA)
print(f"-> Se cargaron {len(lista_videojuegos)} videojuegos correctamente.")

#c
titulo_busqueda = input("Ingrese un titulo de videojuego a buscar: ")
print(f"-> Se encontraron {buscar_videojuego_por_titulo(lista_videojuegos, titulo_busqueda)} videojuegos con el titulo '{titulo_busqueda}'.")

# d
lista_videojuegos_ordenados = metodo_sort_quick_descendiente_por_precio(lista_videojuegos)
print(f"-> Se ordenaron {len(lista_videojuegos_ordenados)} videojuegos por precio descendente.")
lista_2_juegos_mas_caros = devolver_2_juegos_mas_caros(lista_videojuegos)
print(f"-> Los 2 juegos mas caros son: {lista_2_juegos_mas_caros[0]['titulo']} y {lista_2_juegos_mas_caros[1]['titulo']}.")

# e 
precio = int(input("Ingrese un precio limite para generar el informe de ofertas: "))
cantidad_ofertas = generar_informe_ofertas(precio, lista_videojuegos)
print(f"-> Se generaron {cantidad_ofertas} ofertas.")