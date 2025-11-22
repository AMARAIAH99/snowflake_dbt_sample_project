with sources as(
    select * from {{source('ecommerce_raw','order_items')}}
)

select * from sources