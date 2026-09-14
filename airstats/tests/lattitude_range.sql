select
    *
from {{ ref('silver_airports') }}
where airport_lat is not null
  and (airport_lat < -90 or airport_lat > 90)