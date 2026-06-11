-- KPI 1: Total Tickets
SELECT COUNT(*) AS Total_Tickets
FROM Tickets_Import;

-- KPI 2: Tickets Cerrados
SELECT COUNT(*) AS Tickets_Cerrados
FROM Tickets_Import
WHERE estado IN ('Cerrado','Resuelto');

-- KPI 3: Tickets Abiertos
SELECT COUNT(*) AS Tickets_Abiertos
FROM Tickets_Import
WHERE estado IN ('Abierto','En Proceso');

-- KPI 4: Tiempo Promedio de Resolución
SELECT AVG(tiempo_resolucion * 1.0) AS Tiempo_Promedio_Horas
FROM Tickets_Import;

--KPI 5: Cumplimiento SLA
SELECT
    CAST(
        100.0 *
        SUM(
            CASE
                WHEN tiempo_resolucion <= sla_horas
                THEN 1
                ELSE 0
            END
        ) /
        COUNT(*)
    AS DECIMAL(5,2))
    AS Cumplimiento_SLA
FROM Tickets_Import;

-- KPI 6: Tickets por Estado
SELECT
    estado,
    COUNT(*) AS Total
FROM Tickets_Import
GROUP BY estado
ORDER BY Total DESC;

-- KPI 7: Tickets por Prioridad
SELECT
    prioridad,
    COUNT(*) AS Total
FROM Tickets_Import
GROUP BY prioridad
ORDER BY Total DESC;

-- KPI 8: Tickets por Canal
SELECT
    canal,
    COUNT(*) AS Total
FROM Tickets_Import
GROUP BY canal
ORDER BY Total DESC;

-- KPI 9: Top Categorías
SELECT TOP 10
    categoria,
    COUNT(*) AS Total
FROM Tickets_Import
GROUP BY categoria
ORDER BY Total DESC;

-- KPI 10: Top Analistas
SELECT TOP 10
    a.nombre,
    COUNT(*) AS Tickets_Atendidos
FROM Tickets_Import t
INNER JOIN Analistas_Import a
    ON t.id_analista = a.id_analista
GROUP BY a.nombre
ORDER BY Tickets_Atendidos DESC;

