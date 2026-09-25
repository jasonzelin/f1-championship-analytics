import os
import kaggle

import dotenv

dotenv.load_dotenv()

kaggle.api.authenticate()
kaggle.api.dataset_download_files('formula-1-world-championship-1950-2020', path='../../../Users/jr9808@gmail.com/data/raw/', unzip=True)

spark.sql("""
CREATE TABLE IF NOT EXISTS f1_analytics.bronze.circuits
USING CSV
LOCATION '/Workspace/Users/jr9808@gmail.com/data/raw/circuits.csv'
OPTIONS (header = true, inferSchema = true)
""")

spark.sql("SELECT * FROM f1_analytics.bronze.circuits LIMIT 5").show()