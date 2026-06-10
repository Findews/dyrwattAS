MODEL (
  name gold.nve_magasinstatistikk,
  kind FULL
);

SELECT
dato, 
omrnr,
fylling_twh,
kapasitet_twh,
endring_fylling_twh

FROM silver.nve_magasinstatistikk