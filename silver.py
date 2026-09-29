import os
import dotenv
from pathlib import Path

import kaggle
from pyspark.sql import SparkSession

from utils import logger as app_logger

dotenv.load_dotenv()

os.chdir(os.environ["REPO_PATH"])
logger = app_logger.setup_logging(os.environ["LOG_DIR"])

data_source_path = os.environ["DATA_SOURCE_PATH"]
silver_dir = f"{os.environ['REPO_PATH']}/src/pipelines/silver"

spark = SparkSession.builder.getOrCreate()

for f in Path(silver_dir).iterdir():
    logger.info(f"Executing silver SQL file: {f.name}")
    with open(f, "r") as sql_file:
        sql = sql_file.read()

    sql = sql.replace("$DATA_SOURCE_PATH", data_source_path)

    spark.sql(sql)

    logger.info(f"Successfully executed silver SQL file: {f.name}")