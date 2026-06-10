MODEL (
  name silver.nve_kapasitet,
  kind FULL
);

SELECT DISTINCT
omrnr, 
kapasitet_t_wh as kapasitet_twh, 
omr_type
FROM landing.nve_magasinstatistikk
