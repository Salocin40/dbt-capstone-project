with airport_locations as (
    select distinct
        continent,
        iso_country,
        iso_region
    from {{ ref('src_airports') }}
),

locations as (
    select
        md5(concat_ws('|',
            coalesce(continent, ''),
            coalesce(iso_country, ''),
            coalesce(iso_region, '')
        )) as location_id,
        continent as continentt,
        iso_country,
        iso_region
    from airport_locations
)

select * from locations