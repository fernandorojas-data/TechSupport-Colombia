# TechSupport Colombia – Mesa de Servicios TI

## Objetivo del Proyecto

Desarrollar una solución de Business Intelligence para el monitoreo y análisis de la operación de una Mesa de Servicios TI, permitiendo evaluar el desempeño operativo, el cumplimiento de los Acuerdos de Nivel de Servicio (SLA), la gestión de tickets y la productividad de los analistas mediante indicadores clave de gestión.

El proyecto busca transformar datos operativos en información útil para la toma de decisiones, facilitando la identificación de oportunidades de mejora en los procesos de soporte tecnológico.

---

## Herramientas Utilizadas

### SQL Server

* Creación de tablas.
* Importación de datos.
* Consultas de negocio.
* Generación de indicadores y análisis exploratorio.

### Python

* Generación de datos simulados.
* Creación de usuarios.
* Creación de analistas.
* Generación de tickets de soporte.

### Power BI

* Modelado de datos.
* Construcción de medidas DAX.
* Diseño de dashboards interactivos.
* Análisis visual de indicadores.

### Git y GitHub

* Control de versiones.
* Publicación y documentación del proyecto.
* Gestión del portafolio profesional.

---

## Modelo de Datos

El modelo fue construido bajo una arquitectura tipo esquema estrella (Star Schema), donde la tabla de hechos Tickets concentra los eventos transaccionales de la mesa de servicio y se relaciona con las dimensiones Usuarios, Analistas y Calendario.

### Tablas del Modelo

#### Tickets (Tabla de Hechos)

Contiene la información operativa de cada solicitud registrada:

* id_ticket
* fecha_creacion
* fecha_cierre
* categoria
* estado
* prioridad
* canal
* tiempo_resolucion
* sla_horas
* id_usuario
* id_analista

#### Usuarios (Dimensión)

Información de los usuarios que generan los tickets:

* id_usuario
* nombre
* ciudad
* área
* cargo

#### Analistas (Dimensión)

Información de los agentes de soporte:

* id_analista
* nombre
* nivel
* grupo_soporte

#### Calendario (Dimensión)

Permite el análisis temporal por:

* Año
* Mes
* Mes-Año
* Fecha

---

## KPIs Implementados

### Resumen Ejecutivo

* Total Tickets
* Tickets Cerrados
* Tickets Abiertos
* Cumplimiento SLA %
* Tiempo Promedio de Resolución

### Operación de Tickets

* Categoría Líder
* Total Categorías
* Área Líder
* Ciudad Líder
* Tickets por Categoría
* Tickets por Área
* Tickets por Ciudad

### Rendimiento de Analistas

* Analista Líder
* Tickets del Analista Líder
* Total Analistas
* SLA %
* Tickets por Grupo de Soporte
* SLA % por Analista
* Distribución por Nivel

### SLA y Calidad

* SLA General
* Mejor Categoría SLA
* Peor Categoría SLA
* Tiempo Promedio por Categoría
* SLA por Ciudad
* SLA por Grupo de Soporte

### Modelo de Datos

* Total Usuarios
* Total Analistas
* Total Tickets
* Visualización del modelo relacional

---

## Hallazgos del Análisis

### Gestión Operativa

* Se analizaron 20.000 tickets de soporte.
* La organización cuenta con 500 usuarios y 20 analistas de soporte.
* El tiempo promedio de resolución fue de 36,26 horas.

### Cumplimiento SLA

* El cumplimiento general de SLA fue de 26,95%.
* La categoría Red presentó el mejor desempeño con 28,87%.
* La categoría Accesos registró el menor cumplimiento con 24,68%.

### Distribución de Tickets

* Recursos Humanos fue el área con mayor generación de tickets.
* Pereira fue la ciudad con más solicitudes registradas.
* Hardware fue la categoría con mayor volumen de incidentes.

### Desempeño de Analistas

* Lucy Gonzáles Silva fue la analista con mayor cantidad de tickets gestionados.
* El nivel N2 concentró aproximadamente el 50% de los tickets atendidos.
* El grupo de soporte Redes presentó el mayor volumen de casos gestionados.

### Oportunidades de Mejora

* Incrementar el cumplimiento SLA en categorías con bajo desempeño.
* Analizar la carga operativa de las áreas con mayor generación de tickets.
* Optimizar los procesos asociados a las categorías Accesos y Base de Datos.
* Implementar estrategias de balanceo de carga entre grupos de soporte.
