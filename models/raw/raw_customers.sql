{{ config(materialized='table') }}

with sources as (
    select * from {{ source('ecommerce_raw','customers') }}
)

select * from sources
