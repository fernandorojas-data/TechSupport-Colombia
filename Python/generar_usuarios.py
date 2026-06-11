import pandas as pd
import random
from faker import Faker

fake = Faker("es_co")

usuarios = []

areas = [
    "Finanzas",
    "Recursos Humanos",
    "Tecnología",
    "Compras",
    "Operaciones",
    "Logística",
    "Jurídica",
    "Comercial",
    "Marketing",
    "Gerencia"
]

cargos = [
    "Analista",
    "Coordinador",
    "Especialista",
    "Auxiliar",
    "Supervisor",
    "Líder",
    "Gerente"
]

ciudades = [
    "Bogotá",
    "Medellín",
    "Cali",
    "Barranquilla",
    "Bucaramanga",
    "Pereira",
    "Manizales",
    "Cartagena"
]

for i in range(1,501):

    usuarios.append({
        "id_usuario": i,
        "nombre": fake.name(),
        "ciudad": random.choice(ciudades),
        "area": random.choice(areas),
        "cargo": random.choice(cargos),
        "fecha_ingreso": fake.date_between(
            start_date="-8y",
            end_date="today"
        )
    })

df_usuarios = pd.DataFrame(usuarios)

df_usuarios.to_csv(
    "../Dataset/usuarios.csv",
    index= False,
    encoding="utf-8-sig"
)

print("Archivo usuarios.csv generado correctamente")
print(df_usuarios.head())