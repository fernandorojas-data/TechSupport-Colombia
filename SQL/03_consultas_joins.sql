-- Consulta 1 - Tickets por Área
select 
	u.area,
	COUNT(*) AS Tota_tickets
from Tickets_Import t
inner join Usuarios_Import u
	on t.id_usuario = u.id_usuario
group by u.area
order by Tota_tickets desc;


-- Consulta 2 - Tickets por Ciudad

SELECT
    u.ciudad,
    COUNT(*) AS Total_Tickets
FROM Tickets_Import t
INNER JOIN Usuarios_Import u
    ON t.id_usuario = u.id_usuario
GROUP BY u.ciudad
ORDER BY Total_Tickets DESC;

-- Consulta 3 - SLA por Categoría

SELECT
    categoria,
    CAST(
        100.0 *
        SUM(
            CASE
                WHEN tiempo_resolucion <= sla_horas
                THEN 1
                ELSE 0
            END
        ) / COUNT(*)
    AS DECIMAL(5,2))
    AS Cumplimiento_SLA
FROM Tickets_Import
GROUP BY categoria
ORDER BY Cumplimiento_SLA DESC;


-- Consulta 4 - SLA por Analista
SELECT
    a.nombre,
    CAST(
        100.0 *
        SUM(
            CASE
                WHEN t.tiempo_resolucion <= t.sla_horas
                THEN 1
                ELSE 0
            END
        ) / COUNT(*)
    AS DECIMAL(5,2))
    AS Cumplimiento_SLA
FROM Tickets_Import t
INNER JOIN Analistas_Import a
    ON t.id_analista = a.id_analista
GROUP BY a.nombre
ORDER BY Cumplimiento_SLA DESC;

-- Consulta 5 - Ranking Analistas
SELECT
    a.nombre,
    COUNT(*) AS Tickets_Atendidos,
    RANK() OVER(
        ORDER BY COUNT(*) DESC
    ) AS Ranking
FROM Tickets_Import t
INNER JOIN Analistas_Import a
    ON t.id_analista = a.id_analista
GROUP BY a.nombre
ORDER BY Ranking;

-- Consulta 6 - Tiempo Promedio por Prioridad
SELECT
    prioridad,
    AVG(tiempo_resolucion * 1.0)
        AS Tiempo_Promedio
FROM Tickets_Import
GROUP BY prioridad
ORDER BY Tiempo_Promedio DESC;