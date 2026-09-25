CREATE TABLE IF NOT EXISTS f1_analytics.bronze.constructors
AS
SELECT
    *
FROM
    read_files(
        '/Workspace/Repos/jr9808@gmail.com/f1-championship-analytics/data/raw/',
        format => 'csv',
        header => true,
        inferSchema => true,
        pathGlobFilter => 'constructors.csv'
    );