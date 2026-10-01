CREATE TABLE IF NOT EXISTS f1_analytics.gold.gold_constructors_top_points
AS
SELECT
    c.constructorId
    ,c.name
    ,c.nationality
    ,SUM(points) AS total_points
FROM
    f1_analytics.silver.constructor_standings cs
    LEFT JOIN f1_analytics.silver.constructors c ON cs.constructorId = c.constructorId
GROUP BY
    c.constructorId
    ,c.name
    ,c.nationality