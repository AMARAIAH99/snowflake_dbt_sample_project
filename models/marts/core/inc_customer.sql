{{ config(
    materialized = 'incremental',
    unique_key = 'customer_id',
    incremental_strategy = 'merge'
) }}

WITH source_data AS ( 
    SELECT 
    customer_id ,
    customer_name ,
    email ,
    country ,
    total_purchase ,
    etl_load_timestamp
    FROM {{ref('stg_customer')}}



    {% if is_incremental() %}
        WHERE etl_load_timestamp > (SELECT MAX(etl_load_timestamp) FROM {{ this }})
    {% endif %}
)

select * from source_data