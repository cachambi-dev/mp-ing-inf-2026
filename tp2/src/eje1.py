import os


def clear():
    os.system('clear' if os.name == 'nt' else 'clear')

def menu():
    print("Menú de opciones:")
    print("1. Agregar vehiculo")
    print("2. Buscar vehiculo")
    print("3. Actualizar estado de reparación de vehiculo")
    print("4. Mostrar todos los vehiculos segun la marca")
    print("5. Mostrar todos los vehiculos segun el estado de reparación")
    print("6. Salir")
    return int(input("Ingrese el número de opción: "))
    
def agregarVehiculo(vehiculos):
    patente = validarPatente()
    marca = validarMarca()
    modelo = validarModelo()
    anio = validarAnio()
    tipoVehiculo = validarTipoVehiculo()
    estado_reparacion = valiarEstadoReparacion()
    dni = input("Ingrese el DNI del propietario: ")
    nombre = input("Ingrese el nombre del propietario: ")
    telefono = input("Ingrese el teléfono del propietario: ")
    direccion = input("Ingrese la dirección del propietario: ")
    propietario = [dni, nombre, telefono, direccion]
    vehiculos.append([patente, marca, modelo, anio, tipoVehiculo, estado_reparacion, propietario])
    print("Vehiculo agregado exitosamente.")

def validarPatente():
    while True:
        patente = input("Ingrese la patente del vehiculo (3 letras seguidas de 3 números): ")
        if len(patente) != 6:
            print("Patente inválida. Debe tener 3 letras seguidas de 3 números.")
            continue
        if not patente[:3].isalpha() or not patente[3:].isdigit():
            print("Patente inválida. Debe tener 3 letras seguidas de 3 números.")
            continue
        return patente  
  

def validarMarca():
    while True:
        marca = input("Ingrese la marca del vehiculo: ")
        if not marca.isalpha():
            print("Marca inválida. Debe contener solo letras.")
            continue
        if len(marca) < 2 or len(marca) > 20:
            print("Marca inválida. Debe tener entre 2 y 20 caracteres.")
            continue
        return marca

def validarModelo():
    while True:
        modelo = input("Ingrese el modelo del vehiculo: ")
        if not modelo.isalpha():
            print("Modelo inválido. Debe contener solo letras.")
            continue
        if len(modelo) < 2 or len(modelo) > 20:
            print("Modelo inválido. Debe tener entre 2 y 20 caracteres.")
            continue
        return modelo

def validarAnio():
    while True:
        anio = input("Ingrese el año del vehiculo (4 dígitos): ")
        if len(anio) != 4 or not anio.isdigit():
            print("Año inválido. Debe tener 4 dígitos.")
            continue
        if int(anio) < 2000 or int(anio) > 2025:
            print("Año inválido. Debe estar entre 2000 y 2025.")
            continue
        return anio

def validarTipoVehiculo():
    while True:
        tipoVehiculo = input("Ingrese el tipo de vehiculo (A=Auto, M=Moto, C=Camioneta): ")
        if tipoVehiculo.upper() not in ["A", "M", "C"]:
            print("Tipo de vehiculo inválido. Debe ser 'Auto', 'Moto' o 'Camioneta'.")
            continue
        else:
            if tipoVehiculo.upper() == "A":
                tipoVehiculo = "Auto"
            elif tipoVehiculo.upper() == "M":
                tipoVehiculo = "Moto"
            elif tipoVehiculo.upper() == "C":
                tipoVehiculo = "Camioneta"
        return tipoVehiculo

def valiarEstadoReparacion():
    while True:
        estado_reparacion = input("Ingrese el estado de reparación del vehiculo (R=Reparado, E=En reparación, N=No reparado): ")
        if estado_reparacion.upper() not in ["R", "E", "N"]:
            print("Estado de reparación inválido. Debe ser 'Reparado' o 'En reparación' o 'No reparado'.")
            continue
        else:
            if estado_reparacion.upper() == "R":
                estado_reparacion = "Reparado"
            elif estado_reparacion.upper() == "E":
                estado_reparacion = "En reparación"
            elif estado_reparacion.upper() == "N":
                estado_reparacion = "No reparado"
        return estado_reparacion

def buscarVehiculoPorPatente(vehiculos):
    patente = input("Ingrese la patente del vehículo a buscar: ")
    for v in vehiculos:
        if v[0] == patente:
            return v
    return None

def actualizarEstadoReparacion(vehiculos):
    patente = input("Ingrese la patente del vehículo a actualizar: ")
    for v in vehiculos:
        if v[0] == patente:
            nuevo_estado = valiarEstadoReparacion()
            v[5] = nuevo_estado
            print("Estado de reparación actualizado exitosamente.")
            return
    print("Vehículo no encontrado.")

def mostrarVehiculosPorMarca(vehiculos):
    marca = input("Ingrese la marca de los vehículos a mostrar: ")
    encontrados = [v for v in vehiculos if v[1].lower() == marca.lower()]
    if encontrados:
        print(f"Vehículos de la marca {marca}:")
        for v in encontrados:
            print(f"Patente: {v[0]}, Modelo: {v[2]}, Año: {v[3]}, Tipo: {v[4]}, Estado de reparación: {v[5]}")
    else:
        print(f"No se encontraron vehículos de la marca {marca}.")

def mostrarVehiculosPorEstadoReparacion(vehiculos):
    estado = valiarEstadoReparacion()
    encontrados = [v for v in vehiculos if v[5].lower() == estado.lower()]
    if encontrados:
        print(f"Vehículos con estado de reparación '{estado}':")
        for v in encontrados:
            print(f"Patente: {v[0]}, Marca: {v[1]}, Modelo: {v[2]}, Año: {v[3]}, Tipo: {v[4]}")
    else:
        print(f"No se encontraron vehículos con estado de reparación '{estado}'.")


vehiculos = [
    ["ABC123", "Toyota", "Corolla", "2020", "Auto", "Reparado", ["12345678", "Juan Perez", "123456789", "Calle Falsa 123"]],
    ["DEF456", "Ford", "Focus", "2019", "Auto", "En reparación", ["23456789", "Maria Gomez", "234567890", "Av. Siempre Viva 742"]],
    ["GHI789", "Honda", "Wave", "2021", "Moto", "No reparado", ["34567890", "Carlos Lopez", "345678901", "San Martin 1250"]],
    ["JKL012", "Chevrolet", "S10", "2018", "Camioneta", "Reparado", ["45678901", "Ana Rodriguez", "456789012", "Belgrano 456"]],
    ["MNO345", "Volkswagen", "Gol", "2017", "Auto", "En reparación", ["56789012", "Pedro Fernandez", "567890123", "Rivadavia 890"]],
    ["PQR678", "Yamaha", "FZ", "2022", "Moto", "Reparado", ["67890123", "Laura Martinez", "678901234", "Mitre 321"]],
    ["STU901", "Fiat", "Cronos", "2023", "Auto", "No reparado", ["78901234", "Diego Sanchez", "789012345", "Moreno 654"]],
    ["VWX234", "Renault", "Duster", "2020", "Camioneta", "Reparado", ["89012345", "Sofia Torres", "890123456", "Colon 987"]],
    ["YZA567", "Kawasaki", "Ninja", "2016", "Moto", "En reparación", ["90123456", "Martin Diaz", "901234567", "Las Heras 147"]],
    ["BCD890", "Peugeot", "208", "2024", "Auto", "No reparado", ["01234567", "Valentina Ruiz", "012345678", "Urquiza 258"]],
]

menu_options = {
    1: agregarVehiculo,
    2: buscarVehiculoPorPatente,
    3: actualizarEstadoReparacion,
    4: mostrarVehiculosPorMarca,
    5: mostrarVehiculosPorEstadoReparacion,
}


while 6 != (opcion := menu()):
    if opcion in menu_options:
        resultado = menu_options[opcion](vehiculos)
    if opcion == 2:
            print(resultado if resultado else "Vehículo no encontrado.")
    if opcion not in menu_options:
        print("Opción inválida. Por favor, ingrese un número del 1 al 6.")
    print("\nPresione Enter para continuar...")
    input()
    clear()
