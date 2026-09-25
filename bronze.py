import os
import dotenv
from pathlib import Path

import kaggle
from pyspark.sql import SparkSession

from src.data_ingestion import download_data

dotenv.load_dotenv()

# Download the Formula 1 World Championship dataset from Kaggle
download_data()

os.chdir(os.environ["REPO_PATH"])
dotenv.load_dotenv()

data_source_path = os.environ["DATA_SOURCE_PATH"]
bronze_dir = f"{os.environ['REPO_PATH']}/src/medallion-layers/bronze"

spark = SparkSession.builder.getOrCreate()

for f in Path(bronze_dir).iterdir():
    with open(f, "r") as sql_file:
        sql = sql_file.read()

    sql = sql.replace("$DATA_SOURCE_PATH", data_source_path)

    spark.sql(sql)