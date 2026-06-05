with orders as (
    select
        order_id,
        customer_id,
        order_date,
        order_status
    from {{ ref('stg_jaffle_shop__orders') }}
),
payments as (
    select
        order_id,
        amount
    from {{ ref('stg_stripe__payments') }}
)
select
    order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    coalesce(p.amount, 0) AS amount
from orders o
left join payments p 
    using (order_id)