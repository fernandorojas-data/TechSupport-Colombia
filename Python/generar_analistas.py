import pandas as pd
import random
from faker import Faker

fake = Faker("es_co")

analistas = []

niveles = [
    "N1",
    "N2",
    "N3"
]

grupos = [
    "Mesa de Ayuda",
    "Soporte Aplicaciones",
    "Infraestructura",
    "Redes",
    "Bases de Datos"
]

for i in range(1,21):
    analistas.append({
        "id_analista": i,
        "nombre": fake.name(),
        "nivel": random.choice(niveles),
        "grupo_soporte": random.choice(grupos)
    })

df_analistas = pd.DataFrame(analistas)

df_analistas.to_csv(
    "../Dataset/analistas.csv",
    index=False,
    encoding="utf-8-sig"
)

print("Archivo analistas.csv generado correctamente")
print(df_analistas.head())