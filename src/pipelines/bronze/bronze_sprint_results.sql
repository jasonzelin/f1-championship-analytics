CREATE TABLE IF NOT EXISTS f1_analytics.bronze.sprint_results
AS
SELECT
    *
FROM
    read_files(
        "$DATA_SOURCE_PATH",
        format => 'csv',
        header => true,
        inferSchema => true,
        pathGlobFilter => 'sprint_results.csv'
    );