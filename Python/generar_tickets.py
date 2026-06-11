import pandas as pd
import random
from faker import Faker
from datetime import timedelta

fake = Faker("es_CO")

usuarios = pd.read_csv("../Dataset/usuarios.csv")
analistas = pd.read_csv("../Dataset/analistas.csv")

tickets = []

categorias = [
    "Hardware",
    "Software",
    "Correo",
    "VPN",
    "Red",
    "Impresoras",
    "SAP",
    "Office 365",
    "Accesos",
    "Base de Datos",
    "Telefonía",
    "Equipos"
]

prioridades = [
    "Baja",
    "Media",
    "Alta",
    "Crítica"
]

estados = [
    "Cerrado",
    "Resuelto",
    "En Proceso",
    "Abierto"
]

canales = [
    "Correo",
    "Portal",
    "Teléfono",
    "Chat",
    "Teams"
]

sedes = [
    "Bogotá",
    "Medellín",
    "Cali",
    "Barranquilla",
    "Bucaramanga",
    "Pereira"
]

for i in range(1, 20001):

    fecha_creacion = fake.date_between(
        start_date="-2y",
        end_date="today"
    )

    sla_horas = random.choice([4, 8, 12, 24, 48])

    tiempo_resolucion = random.randint(1, 72)

    fecha_cierre = (
        pd.to_datetime(fecha_creacion)
        + timedelta(hours=tiempo_resolucion)
    )

    tickets.append({
        "id_ticket": i,
        "fecha_creacion": fecha_creacion,
        "fecha_cierre": fecha_cierre,
        "id_usuario": random.randint(1, 500),
        "id_analista": random.randint(1, 20),
        "categoria": random.choice(categorias),
        "prioridad": random.choice(prioridades),
        "estado": random.choice(estados),
        "sla_horas": sla_horas,
        "tiempo_resolucion": tiempo_resolucion,
        "sede": random.choice(sedes),
        "canal": random.choice(canales)
    })

df_tickets = pd.DataFrame(tickets)

df_tickets.to_csv(
    "../Dataset/tickets.csv",
    index=False,
    encoding="utf-8-sig"
)

print("Archivo tickets.csv generado correctamente")
print(df_tickets.head())