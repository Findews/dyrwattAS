MODEL (
  name gold.frost_observations,
  kind FULL
);

SELECT 
kilde_id,
dato,
nedbor_mm,
FROM silver.frost_observations
where klokkeslett_offset = 'PT18H'