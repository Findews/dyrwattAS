MODEL (
  name gold.nve_magasinstatistikk_minmax,
  kind FULL
);

SELECT
m.iso_uke, 
m.omrnr,
m.min_fyllingsgrad, 
m.median_fyllings_grad, 
m.median_fylling_twh,
m.max_fyllingsgrad,
m.min_fylling_twh, 
m.max_fylling_twh,
k.kapasitet_twh

FROM silver.nve_magasinstatistikk_minmax m
INNER JOIN silver.nve_kapasitet k
ON m.omrnr = k.omrnr