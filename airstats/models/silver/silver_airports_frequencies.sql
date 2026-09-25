select 
    frequency_id,
    frequency_type,
    a.airport_id,
    frequency_description,
    frequency_mhz
from {{ref('src_airports_frequencies')}} as f
left join {{ref('silver_airports',v=3)}} as a
    on f.airport_ident = a.airport_ident