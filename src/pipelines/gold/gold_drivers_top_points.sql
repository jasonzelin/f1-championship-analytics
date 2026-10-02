CREATE TABLE IF NOT EXISTS f1_analytics.gold.gold_drivers_top_points
AS
SELECT
    d.driverId
    ,d.forename
    ,d.surname
    ,d.nationality
    ,points AS total_points
FROM
    f1_analytics.silver.driver_standings ds
    LEFT JOIN f1_analytics.silver.drivers d ON ds.driverId = d.driverId
QUALIFY
    ROW_NUMBER() OVER(
        PARTITION BY d.driverId
        ORDER BY ds.raceId DESC
    ) = 1