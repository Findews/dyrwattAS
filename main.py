from pipelines.nve_pipeline import run as run_nve
from pipelines.frost_pipeline import run as run_frost
from dotenv import load_dotenv

load_dotenv()


if __name__ == "__main__":
    run_nve()
    run_frost()