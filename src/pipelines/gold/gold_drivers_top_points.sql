CREATE OR REPLACE TABLE f1_analytics.gold.gold_drivers_top_points
AS
SELECT
    d.driverId
    ,d.forename
    ,d.surname
    ,d.nationality
    ,SUM(r.points) AS total_points
FROM
    f1_analytics.silver.results r
    LEFT JOIN f1_analytics.silver.drivers d ON r.driverId = d.driverId
    LEFT JOIN f1_analytics.silver.races ra ON r.raceId = ra.raceId
GROUP BY
    d.driverId
    ,d.forename
    ,d.surname
    ,d.nationality