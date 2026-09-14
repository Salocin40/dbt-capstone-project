{{
    config(
        materialized='incremental',
        unique_key='comment_id',
        incremental_strategy='merge'
    )
}}

SELECT
    comment_id,
    airport_ident,
    comment_timestamp,
    NVL(member_nickname, '__UNKNOWN__') as member_nickname,
    comment_subject,
    comment_body,
    current_timestamp() as loaded_at
FROM {{ ref('src_airports_comments') }}
WHERE comment_body is not null

{% if is_incremental() %}
  AND comment_id > (SELECT max(comment_id) FROM {{ this }})
{% endif %}