{% snapshot customer_history %}

{{ config(
    target_schema="public", 
    unique_key="customer_id", 
    strategy="timestamp", 
    updated_at="created_at", 
    meta={'invalidate_hard_rows': True}
) }}

select customer_id,customer_name,email,phone,created_at from {{source('ecommerce_raw','customers')}}

{% endsnapshot %} 
