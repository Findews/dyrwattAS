MODEL (
  name silver.nve_magasinstatistikk,
  kind FULL
);

SELECT
CAST(dato_id AS DATE) AS dato,
iso_aar, 
iso_uke, 
omrnr,
fyllingsgrad,
fylling_t_wh as fylling_twh,
kapasitet_t_wh as kapasitet_twh,
endring_fyllingsgrad, 
endring_fyllingsgrad * kapasitet_t_wh AS endring_fylling_twh

FROM landing.nve_magasinstatistikk 
WHERE omr_type = 'EL'
AND iso_aar >= 2020