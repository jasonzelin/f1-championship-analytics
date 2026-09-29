CREATE TABLE IF NOT EXISTS f1_analytics.silver.pit_stops
AS
SELECT
    * except(duration)
    ,TRY_CAST(duration AS FLOAT64) AS duration
FROM
    f1_analytics.bronze.pit_stops