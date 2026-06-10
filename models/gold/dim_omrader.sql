MODEL (
    name gold.dim_omrader,
    kind FULL
);

SELECT
e.navn_langt, 
e.beskrivelse, 
e.navn,
m.kilde_id, 
m.omrade_nr, 
FROM
silver.elspot_omrader e
LEFT JOIN silver.sensor_omrade_mapping m
ON e.omrnr = m.omrade_nr