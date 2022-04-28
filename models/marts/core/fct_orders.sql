with orders as (
    select * from {{ ref('stg_orders')}}
),

payments as (
    select
        sum(case when status = 'success' then amount end) as amount,
        order_id
    
    from {{ ref('stg_payments')}}

    group by 2

),

final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(payments.amount, 0) as amount
    
    from orders 

    left join payments using (order_id)
)

select * from final

