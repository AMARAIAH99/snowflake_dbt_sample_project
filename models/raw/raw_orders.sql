with sources as(
    select * from {{source('ecommerce_raw','orders')}}
)

select * from sources