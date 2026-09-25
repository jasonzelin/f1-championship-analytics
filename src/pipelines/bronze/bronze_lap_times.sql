CREATE TABLE IF NOT EXISTS f1_analytics.bronze.lap_times
AS
SELECT
    *
FROM
    read_files(
        "$DATA_SOURCE_PATH",
        format => 'csv',
        header => true,
        inferSchema => true,
        pathGlobFilter => 'lap_times.csv'
    );