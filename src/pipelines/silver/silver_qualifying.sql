CREATE TABLE IF NOT EXISTS f1_analytics.silver.qualifying
AS
SELECT
    * EXCEPT(q1, q2, q3)
    ,TRY_CAST(CONCAT('00:0', q1) AS TIME) AS q1
    ,TRY_CAST(CONCAT('00:0', q2) AS TIME) AS q2
    ,TRY_CAST(CONCAT('00:0', q3) AS TIME) AS q3
FROM
    f1_analytics.bronze.qualifying