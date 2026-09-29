CREATE TABLE IF NOT EXISTS f1_analytics.silver.races
AS
SELECT
    * EXCEPT(time)
    ,TRY_CAST(CONCAT('00:0', time) AS TIME) AS time
FROM
    f1_analytics.bronze.races