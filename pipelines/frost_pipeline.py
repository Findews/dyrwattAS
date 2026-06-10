import dlt

from sources.frost import frost_observations_raw, frost_observations_flat

def run():
    pipeline = dlt.pipeline(
        pipeline_name="frost",
        destination="motherduck",
        dataset_name="landing"
    )

    return pipeline.run(
        frost_observations_raw() | frost_observations_flat,
        table_name="frost_observations"
    )

