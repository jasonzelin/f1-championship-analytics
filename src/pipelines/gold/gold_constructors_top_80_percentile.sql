CREATE TABLE IF NOT EXISTS f1_analytics.gold.gold_constructors_top_80_percentile
AS
WITH constructors_with_points AS (
    SELECT
        c.constructorId
        ,c.name as constructorName
        ,c.nationality
        ,SUM(points) AS total_points
    FROM
        f1_analytics.silver.constructor_standings cs
        LEFT JOIN f1_analytics.silver.constructors c ON cs.constructorId = c.constructorId
    GROUP BY
        c.constructorId
        ,c.name
        ,c.nationality
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
    constructors_with_points
QUALIFY
    PERCENT_RANK() OVER(
        ORDER BY total_points ASC
    ) > 0.8