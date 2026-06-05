with daily as (
    select
        order_date,
        count(*) as order_count,
        sum(amount) as total_amount,
        {% for order_status in ['placed', 'completed', 'returned'] %}
        sum(case when order_status = '{{ order_status }}' then 1 else 0 end) as {{ order_status }}_num{{ ',' if not loop.last }}
        {% endfor %}
    from {{ ref('fct_orders') }}
    group by 1
),
compared as (
    select
        *,
        lag(order_count) over (order by order_date) AS prev_day_orders,
        lag(total_amount) over (order by order_date) AS prev_day_amount
    from daily
)
select * from compared
order by order_date