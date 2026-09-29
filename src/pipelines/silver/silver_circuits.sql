CREATE TABLE IF NOT EXISTS f1_analytics.silver.circuits
AS
SELECT
    circuitId
    , circuitRef
    , name
    , location
    , country
    , lat
    , lng
    , alt
    , url
FROM
    f1_analytics.bronze.circuits