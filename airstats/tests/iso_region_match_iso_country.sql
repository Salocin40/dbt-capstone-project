select
    iso_country,
    iso_region
from {{ ref('silver_airports') }}
where iso_region is not null
  and iso_country is not null
  and left(iso_region, length(iso_country)) != iso_country