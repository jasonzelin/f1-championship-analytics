CREATE OR REPLACE TABLE f1_analytics.gold.gold_drivers_top_80_percentile_points_time_series
AS
SELECT
    p.driverId
    ,p.forename
    ,p.surname
    ,ra.date AS raceDate
    ,SUM(r.points) OVER(
        PARTITION BY p.driverId
        ORDER BY ra.date ASC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_points
FROM
    f1_analytics.gold.gold_drivers_top_80_percentile p
    LEFT JOIN f1_analytics.silver.results r ON p.driverId = r.driverId
    LEFT JOIN f1_analytics.silver.races ra ON r.raceId = ra.raceId