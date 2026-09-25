CREATE TABLE IF NOT EXISTS f1_analytics.bronze.circuits
AS
SELECT
    circuitId, circuitRef, name, location, country, lat, lng, alt, url
FROM
    read_files(
        '/Workspace/Repos/jr9808@gmail.com/f1-championship-analytics/data/raw/',
        format => 'csv',
        header => true,
        inferSchema => true,
        pathGlobFilter => 'circuits.csv'
    );