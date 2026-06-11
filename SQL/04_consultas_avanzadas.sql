-- Consulta 1: Ranking de Analistas
select 
	a.nombre,
	COUNT(*) AS Tickets_Atendidos,
	RANK() over(
		order by COUNT(*) desc
		) AS Ranking
from Tickets_Import t
inner join Analistas_Import a
	on t.id_analista = a.id_analista
group by a.nombre
order by Ranking;

-- Consulta 2: DENSE_RANK()
select
	a.nombre,
	COUNT(*) AS Tickets_Atendidos,
	DENSE_RANK() over (
		order by count(*) desc
	) AS Ranking
from Tickets_Import t
inner join Analistas_Import a
	on t.id_analista = a.id_analista
group by a.nombre
order by Ranking;

-- Consulta 3: ROW_NUMBER()
SELECT
    a.nombre,
    COUNT(*) AS Tickets_Atendidos,
    ROW_NUMBER() OVER(
        ORDER BY COUNT(*) DESC
    ) AS Fila
FROM Tickets_Import t
INNER JOIN Analistas_Import a
        ON t.id_analista = a.id_analista
GROUP BY a.nombre
ORDER BY Fila;

-- Consulta 4: Top 5 Analistas usando CTE
WITH RankingAnalistas AS
(
    SELECT
        a.nombre,
        COUNT(*) AS Tickets_Atendidos,
        ROW_NUMBER() OVER(
            ORDER BY COUNT(*) DESC
        ) AS Ranking
    FROM Tickets_Import t
    INNER JOIN Analistas_Import a
        ON t.id_analista = a.id_analista
    GROUP BY a.nombre
)

SELECT *
FROM RankingAnalistas
WHERE Ranking <= 5;

-- Consulta 5: SLA por Analista
SELECT
    a.nombre,

    COUNT(*) AS Total_Tickets,

    SUM(
        CASE
            WHEN t.tiempo_resolucion
                 <= t.sla_horas
            THEN 1
            ELSE 0
        END
    ) AS Tickets_Cumplen_SLA,

    CAST(
        100.0 *
        SUM(
            CASE
                WHEN t.tiempo_resolucion
                     <= t.sla_horas
                THEN 1
                ELSE 0
            END
        ) /
        COUNT(*)
    AS DECIMAL(5,2))
    AS Cumplimiento_SLA

FROM Tickets_Import t
INNER JOIN Analistas_Import a
    ON t.id_analista = a.id_analista

GROUP BY a.nombre

ORDER BY Cumplimiento_SLA DESC;

-- Consulta 6: Categoría más crítica
SELECT TOP 1
    categoria,
    AVG(tiempo_resolucion * 1.0)
        AS Tiempo_Promedio
FROM Tickets_Import
GROUP BY categoria
ORDER BY Tiempo_Promedio DESC;

-- Consulta 7: Tendencia mensual
SELECT
    YEAR(fecha_creacion) AS Año,
    MONTH(fecha_creacion) AS Mes,
    COUNT(*) AS Total_Tickets
FROM Tickets_Import
GROUP BY
    YEAR(fecha_creacion),
    MONTH(fecha_creacion)
ORDER BY Año, Mes;

