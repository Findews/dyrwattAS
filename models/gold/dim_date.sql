MODEL (
  name gold.dim_date,
  kind FULL
);

WITH dates AS (
    SELECT *
    FROM generate_series(
        DATE '2020-01-01',
        DATE '2026-12-31',
        INTERVAL 1 DAY
    ) AS t(d)
)

SELECT
    isoyear(d) AS iso_aar,
    week(d) AS iso_uke,
    dense_rank() over (order by isoyear(d), week(d)) AS uke_lopenr,
    d AS dato
FROM dates