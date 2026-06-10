MODEL (
  name silver.nve_magasinstatistikk_minmax,
  kind FULL
);

SELECT
iso_uke, 
omrnr,
min_fyllingsgrad, 
median_fyllings_grad, 
max_fyllingsgrad,
median_fylling_twh,
min_fylling_twh, 
max_fylling_twh

FROM landing.nve_magasinstatistikk_minmax
WHERE omr_type = 'EL'