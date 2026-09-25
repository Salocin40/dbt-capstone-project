{{config (materialized="ephemeral")}}
with countries as (select * from {{ref('countries')}})
select
    id as country_id,
    code as country_code,
    name as country_name,
    continent,
    wikipedia_link
from countries