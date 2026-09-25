CREATE TABLE IF NOT EXISTS f1_analytics.bronze.driver_standings
AS
SELECT
    circuitId, circuitRef, name, location, country, lat, lng, alt, url
FROM
    read_files(
        "$DATA_SOURCE_PATH",
        format => 'csv',
        header => true,
        inferSchema => true,
        pathGlobFilter => 'driver_standings.csv'
    );