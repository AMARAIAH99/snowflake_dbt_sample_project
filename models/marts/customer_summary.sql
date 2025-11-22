select 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.order_status,
    o.total_amount,
    i.item_id,
    i.product_name
from {{ source('ecommerce_raw', 'customers') }} as c
inner join {{ source('ecommerce_raw', 'orders') }} as o 
    on c.customer_id = o.customer_id inner join
    {{ source('ecommerce_raw', 'order_items') }} i
    on o.order_id=i.order_id

