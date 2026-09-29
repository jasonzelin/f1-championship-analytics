CREATE TABLE IF NOT EXISTS f1_analytics.silver.sprint_results
AS
SELECT
    * EXCEPT(position, time, milliseconds, fastestLap, fastestLapTime)
    ,TRY_CAST(CONCAT('00:0', REGEXP_REPLACE(time, r'\+', '')) AS TIME) AS time
    ,TRY_CAST(milliseconds AS FLOAT) AS milliseconds
    ,TRY_CAST(fastestLap AS INT) AS fastestLap
    ,TRY_CAST(CONCAT('00:0', fastestLapTime) AS TIME) AS fastestLapTime
FROM
    f1_analytics.bronze.sprint_results