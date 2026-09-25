{{config(materialized="ephemeral")}}
with airports as (select * from {{source('airstats','airports')}})
select
{{ dbt_utils.generate_surrogate_key(['ident', 'name']) }} as airport_id,
ident as airport_ident,
type as airport_type,
name as airport_name,
latitude_deg as airport_lat,
longitude_deg as airport_long,
continent,
iso_country,
iso_region

from airports