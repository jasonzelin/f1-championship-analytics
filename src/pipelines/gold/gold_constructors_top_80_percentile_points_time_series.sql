CREATE TABLE IF NOT EXISTS f1_analytics.gold.gold_constructors_top_80_percentile_points_time_series
AS
SELECT
    p.constructorId
    ,p.constructorName
    ,ra.date AS raceDate
    ,SUM(r.points) OVER(
        PARTITION BY p.constructorId
        ORDER BY ra.date ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_points
FROM
    f1_analytics.gold.gold_constructors_top_80_percentile p
    LEFT JOIN f1_analytics.silver.results r ON p.constructorId = r.constructorId    
    LEFT JOIN f1_analytics.silver.races ra ON r.raceId = ra.raceId