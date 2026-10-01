CREATE TABLE IF NOT EXISTS f1_analytics.bronze.constructor_standings
AS
SELECT
    d.driverId
    ,d.forename
    ,d.surname
    ,d.nationality
    ,SUM(points) AS total_points
FROM
    f1_analytics.silver.driver_standings ds
    LEFT JOIN f1_analytics.silver.drivers d ON ds.driverId = d.driverId
GROUP BY
    d.driverId
    ,d.forename
    ,d.surname