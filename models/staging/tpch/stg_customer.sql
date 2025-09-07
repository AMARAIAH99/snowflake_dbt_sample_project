{{ config(
    materialized = 'table'
) }}

WITH source_data AS (
    SELECT 
    customer_id ,
    customer_name ,
    email ,
    country ,
    total_purchase ,
    load_datatimestamp as etl_load_timestamp
    FROM dev_customerdatalake.customer.customer_data
    
)

select * from source_data
