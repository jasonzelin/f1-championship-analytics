import os
import kaggle

import dotenv

def download_data():
    """
    Downloads the Formula 1 World Championship dataset from Kaggle and saves it to the 'data/raw/' directory.
    """
    # Load environment variables from .env file
    dotenv.load_dotenv()

    kaggle.api.authenticate()
    kaggle.api.dataset_download_files('formula-1-world-championship-1950-2020', path='data/raw/', unzip=True)