select
    id AS payment_id,
    orderid AS order_id,
    amount
from dbt-tutorial.stripe.payment