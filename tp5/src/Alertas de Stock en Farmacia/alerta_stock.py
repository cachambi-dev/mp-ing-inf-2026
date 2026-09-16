from pathlib import Path
from typing import List, Dict, Any

def cargar_medicamentos(ruta_archivo: str) -> List[Dict[str,Any]]:
    medicamentos: List[Dict[str, Any]] = []
    try:
        with open(ruta_archivo, mode="r", encoding="utf-8") as fichero:
            for linea_num, linea in enumerate(fichero, start=1):
                linea_limpia = linea.strip()

                if not linea_limpia:
                    continue

                partes = linea_limpia.split(";")

                if len(partes) == 5:
                    codigo, nombre, categoria, precio_str, stock_str = partes

                    medicamento = {
                        "codigo": codigo.strip(),
                        "nombre": nombre.strip().capitalize(),
                        "categoria": categoria.strip(),
                        "precio": float(precio_str.strip()),
                        "stock": int(stock_str.strip())
                    }
                    medicamentos.append(medicamento)
                else:
                    print(f"advertencia: Linea {linea_num} ignorada por formato invalido.")
    except FileNotFoundError:
        print(f"Error: No se encontro el archivo de origen en `{ruta_archivo}`")
    return medicamentos

def generar_informe_critico(medicamentos: List[Dict[str,Any]], ruta_salida:str,limite_stock:int = 10) -> int:
    criticos = [m for m in medicamentos if m["stock"] < limite_stock]
    try:
        with open(ruta_salida, mode="w", encoding="utf-8") as fichero_salida:
            fichero_salida.write("MEDICAMENTOS CON STOCK CRITICO: \n")

            for med in criticos:
                linea_informe = f"- {med['nombre']} (Stock: {med['stock']})\n"
                fichero_salida.write(linea_informe)

            fichero_salida.write(f"\nTotal de productos en alerta: {len(criticos)}\n")

    except IOError as e:
        print(f"Error de E/S al intentar escribir el archivo '{ruta_salida}`:{e}")
        return 0

    return len(criticos)

def calcular_valor_inventario(medicamentos: List[Dict[str,Any]]) -> float:
    valor_total = 0.0
    for m in medicamentos:
        valor_total+= m["precio"]
    return valor_total

def buscar_por_categoria(medicamentos: List[str,Any], categoria: str) -> List[Dict[str,Any]]:
    lista_categoria = []
    for m in medicamentos:
        if m["categoria"] == categoria:
            lista_categoria.append(m)
    return lista_categoria


ARCHIVO_ENTRADA = "./Archivos-txt/medicamentos.txt"
ARCHIVO_SALIDA = "./Archivos-txt/stock_critico.txt"

try:

    lista_medicamentos = cargar_medicamentos(ARCHIVO_ENTRADA)
    print(f"-> Se cargaron {len(lista_medicamentos)} medicamentos correctamente.")
    total_reportados = generar_informe_critico(lista_medicamentos, ARCHIVO_SALIDA)
    print(f"-> Informe generado en '{ARCHIVO_SALIDA}' con {total_reportados} alertas de stock.")
    print(f"El valor total del inventario de medicamentos es: {calcular_valor_inventario(lista_medicamentos)}\n")
    categoria = str(input("Ingrese Categoria de medicamento a buscar: "))
    print(f"Lista de categoria: {categoria}\n {buscar_por_categoria(lista_medicamentos, categoria)}")
except FileNotFoundError:
     print("-> Proceso abortado debido a la falta del archivo fuente.")
