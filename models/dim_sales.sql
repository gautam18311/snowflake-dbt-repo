{{config(
    materialized = 'incremental')
}}

select * from {{source("sri_src",'dim_sales')}} t1

{% if is_incremental() %}
where
t1.dates > select max(dates) from {{this}}
{% endif %}

