create Table Usuarios (
	id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    area VARCHAR(50),
    cargo VARCHAR(50),
    fecha_ingreso DATE
)

create Table Analistas (
id_analista INT PRIMARY KEY,
    nombre VARCHAR(100),
    nivel VARCHAR(10),
    grupo_soporte VARCHAR(100)
)

create Table tickets (
    id_ticket INT PRIMARY KEY,
    fecha_creacion DATE,
    fecha_cierre DATETIME,
    id_usuario INT,
    id_analista INT,
    categoria VARCHAR(50),
    prioridad VARCHAR(20),
    estado VARCHAR(30),
    sla_horas INT,
    tiempo_resolucion INT,
    sede VARCHAR(50),
    canal VARCHAR(30)
)


