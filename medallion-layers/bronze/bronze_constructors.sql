CREATE TABLE IF NOT EXISTS f1_analytics.bronze.constructors
AS
SELECT
    *
FROM
    read_files(
        '/Workspace/Users/jr9808@gmail.com/data/raw/',
        format => 'csv',
        header => true,
        inferSchema => true,
        pathGlobFilter => 'constructors.csv'
    );