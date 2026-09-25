{{config(materialized="ephemeral")}}
with frequencies as (select * from {{ref('airport_frequencies')}})
select 

    ID as frequency_id,
    AIRPORT_REF as airport_ref,
    AIRPORT_IDENT as airport_ident,
    TYPE as frequency_type,
    DESCRIPTION as frequency_description,
    FREQUENCY_MHZ as frequency_mhz
from frequencies
