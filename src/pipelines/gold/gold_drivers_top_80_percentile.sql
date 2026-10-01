CREATE TABLE IF NOT EXISTS f1_analytics.gold.gold_drivers_top_80_percentile
AS
WITH drivers_with_points AS (
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
        ,d.nationality
)
SELECT
    * EXCEPT(total_points)
    ,SUM(total_points) OVER(
        ORDER BY total_points DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_points
    ,SUM(total_points) OVER() AS total_points
    ,TRY_DIVIDE(
        SUM(total_points) OVER(
            ORDER BY total_points DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        )
        ,SUM(total_points) OVER()
     ) AS cumulative_points_percentage
    ,PERCENT_RANK() OVER(
        ORDER BY total_points ASC
    ) AS percentile_rank
FROM
    drivers_with_points
QUALIFY
    PERCENT_RANK() OVER(
        ORDER BY total_points ASC
    ) > 0.8