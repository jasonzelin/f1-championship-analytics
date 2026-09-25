CREATE CATALOG IF NOT EXISTS f1_analytics
COMMENT 'F1 Analytics Lakehouse';

CREATE SCHEMA IF NOT EXISTS f1_analytics.bronze
COMMENT 'Bronze Layer';

CREATE SCHEMA IF NOT EXISTS f1_analytics.silver
COMMENT 'Silver Layer';

CREATE SCHEMA IF NOT EXISTS f1_analytics.gold
COMMENT 'Gold Layer'