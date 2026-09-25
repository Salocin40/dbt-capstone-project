{{config (materialized="ephemeral")}}

with region as (select * from {{ref('regions')}})

select id as region_id,
    code as region_code,
    name as region_name,
    continent,
    iso_region,
    iso_country,
    wikipedia_link
from region