select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status AS payment_status,
    created as payment_date,
    amount

from {{ source('stripe', 'payment') }}
