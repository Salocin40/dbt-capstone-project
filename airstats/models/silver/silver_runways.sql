SELECT
runway_id,
airport_ident,
runway_length_ft,
runway_width_ft,
NVL(runway_surface,'__UNKNOWN__') as runway_surface,
runway_lighted,
runway_closed
FROM {{ref("src_runways")}}