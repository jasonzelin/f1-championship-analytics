CREATE TABLE IF NOT EXISTS f1_analytics.gold.gold_constructors_top_points
AS
SELECT
    c.constructorId
    ,c.name
    ,c.nationality
    ,SUM(r.points) AS total_points
FROM
    f1_analytics.silver.constructor_results r
    LEFT JOIN f1_analytics.silver.constructors c ON r.constructorId = c.constructorId
    LEFT JOIN f1_analytics.silver.races ra ON r.raceId = ra.raceId
GROUP BY
    c.constructorId
    ,c.name
    ,c.nationality