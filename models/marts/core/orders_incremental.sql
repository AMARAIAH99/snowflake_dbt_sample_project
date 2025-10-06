{{ config(materialized='incremental', unique_key='ORDER_ID') }}

SELECT
    ORDER_ID,
    CUSTOMER_NAME,
    ORDER_DATE,
    TOTAL_AMOUNT,
    insert_data_ts as load_ts
FROM DEVELOP_SAMPLE_DBT_SNOWFLAKE_PROJECT.RAW.SALES_RAW

{% if is_incremental() %}
    -- Load only new or updated rows since last run
    WHERE insert_data_ts > (SELECT MAX(load_ts) FROM {{ this }})
{% endif %}
