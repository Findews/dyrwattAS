import dlt
import requests

@dlt.resource(
        name="nve_magasinstatistikk",
        write_disposition="replace"
        #primary_key=["dato_Id", "omrType", "omrnr"]
    )
def nve_magasinstatistikk():

    url = "https://biapi.nve.no/magasinstatistikk/api/Magasinstatistikk/HentOffentligData"

    response = requests.get(url)
    response.raise_for_status()

    yield response.json()

@dlt.resource(
        name="nve_omrader", 
        write_disposition='replace'
)
def nve_omrader():
    url = 'https://biapi.nve.no/magasinstatistikk/api/Magasinstatistikk/HentOmråder'

    response = requests.get(url)
    response.raise_for_status()

    yield from response.json()

@dlt.resource(
        name='nve_magasinstatistikk_minmax', 
        write_disposition='replace'
)
def nve_minmax():
    url = 'https://biapi.nve.no/magasinstatistikk/api/Magasinstatistikk/HentOffentligDataMinMaxMedian'

    response = requests.get(url)
    response.raise_for_status()

    yield response.json()

@dlt.source
def nve():
    return [
        nve_magasinstatistikk(), 
        nve_omrader(), 
        nve_minmax()
    ]