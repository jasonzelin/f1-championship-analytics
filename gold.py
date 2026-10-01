import os
import dotenv
from pathlib import Path

import kaggle
from pyspark.sql import SparkSession

from src.data_ingestion import download_data
from utils import logger as app_logger

dotenv.load_dotenv()

os.chdir(os.environ["REPO_PATH"])
logger = app_logger.setup_logging(os.environ["LOG_DIR"])

data_source_path = os.environ["DATA_SOURCE_PATH"]
bronze_dir = f"{os.environ['REPO_PATH']}/src/pipelines/gold"

spark = SparkSession.builder.getOrCreate()

for f in Path(bronze_dir).iterdir():
    logger.info(f"Executing gold SQL file: {f.name}")
    with open(f, "r") as sql_file:
        sql = sql_file.read()

    sql = sql.replace("$DATA_SOURCE_PATH", data_source_path)

    spark.sql(sql)

    logger.info(f"Successfully executed gold SQL file: {f.name}")