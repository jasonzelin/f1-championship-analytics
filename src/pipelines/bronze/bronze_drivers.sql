CREATE TABLE IF NOT EXISTS f1_analytics.bronze.drivers
AS
SELECT
    *
FROM
    read_files(
        "$DATA_SOURCE_PATH",
        format => 'csv',
        header => true,
        inferSchema => true,
        pathGlobFilter => 'drivers.csv'
    );