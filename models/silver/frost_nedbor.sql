MODEL (
  name silver.frost_observations,
  kind FULL
);

SELECT 
source_id AS kilde_id,
element_id,
"value" AS nedbor_mm,
unit as enhet,
reference_time + CAST(regexp_extract(time_offset, '\d+') AS INTEGER) * INTERVAL 1 HOUR AS maling_timestamp,
CAST (reference_time AS DATE) as dato,
time_offset as klokkeslett_offset

FROM landing.frost_observations
WHERE element_id = 'sum(precipitation_amount P1D)'