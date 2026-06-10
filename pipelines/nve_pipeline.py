import dlt

from sources.nve import nve

def run():
    pipeline = dlt.pipeline(
        pipeline_name="nve",
        destination="motherduck",
        dataset_name="landing"
    )

    return pipeline.run(nve())
