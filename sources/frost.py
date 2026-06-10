import dlt
import requests
from dotenv import load_dotenv
import os

load_dotenv()

#TODO read from csv
sources = {
    "NO1": "SN12960",  # Sjusjøen - Storåsen, 930 moh
    "NO2": "SN45300",  # Litla tjodanvatnet, 841 moh
    "NO3": "SN10800",  # Sølendet, 1294 moh
    "NO4": "SN84210",  # Losistua, 1237 moh
    "NO5": "SN46430",  # Røldalsfjellet, 1250 moh
}

@dlt.resource(
        #write_disposition="replace"
        #primary_key=["source_id", "reference_time"]
    )
def frost_observations_raw():
    url = "https://frost.met.no/observations/v0.jsonld"
    params = {"sources": ", ".join(sources.values()),
                "referencetime": "2020-01-01T00:00:00.000Z/2026-06-01T23:59:59Z",
                "elements": "sum(precipitation_amount P1D)"
                }
    
    auth = (os.getenv("FROST_CLIENT_ID"), "")

    response = requests.get(url, params=params, auth=auth)
    response.raise_for_status()

    yield from response.json().get("data")

@dlt.transformer(
        name="frost_observations",
        write_disposition="replace")
def frost_observations_flat(record):

    observations = record.pop("observations")

    for observation in observations:
        yield record | observation