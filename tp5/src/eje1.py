from typing import List, Dict, Any

def cargar_productos(ruta_archivo:str) -> List[Dict[str,Any]]:
    productos: List[Dict[str,Any]] = []
    try:
        with open(ruta_archivo, mode="r", encoding="utf-8") as fichero:
            for linea_num, linea in enumerate(fichero, start=1):
                linea_limpia = linea

                if not linea_limpia:
                    continue

                partes = linea_limpia.split(";")

                if len(partes) == 5:
                    id, descripcion, marca, precio, stock = partes

                    producto = {
                        "id": id.strip(),
                        "descripcion": descripcion.strip(),
                        "marca": marca.strip(),
                        "precio": float(precio.strip()),
                        "stock": int(stock.strip())
                    }

                    productos.append(producto)
                else:
                    print(f"Adevertencia: Linea {linea_num} ignorada por formato invalido.")
    except FileExistsError:
        print(f"Error: No se encontro el archivo de origen en '{ruta_archivo}'")
    return productos

def generar_informe_critico(productos: List[Dict[str,Any]], ruta_salida: str, limite_stock: int=10 ) -> int:
    criticos = [p for p in productos if p["stock"] <= limite_stock]
    try:
        with open(ruta_salida, mode="w", encoding="utf-8") as fichero_salida:
            fichero_salida.write("Productos con stock bajo\n\n")

            for prod in criticos:
                linea_informe = f"{prod["id"]} - {prod["descripcion"]} - {prod["marca"]}\n"
                fichero_salida.write(linea_informe)

            fichero_salida.write(f"\nCantidad de tipos de productos bajo: {len(criticos)}")
    except IOError as e:
        print(f"Error de E/S al intentar escribir el archivo '{ruta_salida}`:{e}")
        return 0
    return len(criticos)

def eliminar_productos_marca(productos: List[Dict[str,Any]], marca: str)-> List[Dict[str,Any]]:
    return [p for p in productos if p["marca"]!=marca]

def listar_producto_segun_rango(productos: List[Dict[str,Any]], min:float, max:float) -> List[Dict[str,Any]]:
    return [p for p in productos if p["precio"]>=min and p["precio"]<=max]


ARCHIVO_ENTRADA = "./Archivos-txt/productos.txt"
ARCHIVO_SALIDA = "./Archivos-txt/producto_stock_critico.txt"

lista_productos = cargar_productos(ARCHIVO_ENTRADA)
print(f"-> Se cargaron {len(lista_productos)} productos correctamente.")
total_reportado = generar_informe_critico(lista_productos,ARCHIVO_SALIDA)
print(f"-> Informe generado en '{ARCHIVO_SALIDA}' con {total_reportado} alertas de stock.")
marca_producto = str(input("Ingrese marca a elminar: "))
print(f"Productos sin la marca {marca_producto} \n{eliminar_productos_marca(lista_productos,marca_producto)}")
precio_min = float(input("Ingrese el precio minimo: "))
precio_max = float(input("Ingrese el precio maximo: "))
print(f"Productos listado desde el precio {precio_min} hasta el precio {precio_max}\n {listar_producto_segun_rango(lista_productos,precio_min,precio_max)}")




