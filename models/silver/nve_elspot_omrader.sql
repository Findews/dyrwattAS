  MODEL (
    name silver.elspot_omrader, 
    kind FULL
  );
  
  SELECT 
  omrnr,
  navn_langt, 
  beskrivelse, 
  navn,
  omr_type
  FROM landing.nve_omrader__elspot