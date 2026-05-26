select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    created as payment_date,
    amount
from dbt-tutorial.stripe.payment