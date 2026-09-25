with airports as (
    select * from {{ ref('src_airports') }}
),

locations as (
    select * from {{ ref('dim_location') }}
)

select
    airport_id,
    airports.airport_ident,
    airports.airport_type,
    airports.airport_name as bidabidou,
    airports.airport_lat,
    airports.airport_long,
    locations.location_id
from airports
left join locations
    on airports.continent = locations.continent
    and airports.iso_country = locations.iso_country
    and airports.iso_region = locations.iso_region