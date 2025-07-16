{% snapshot scd_table %}
{{
    config(
        target_schema = 'scds',
        strategy = 'check',
        unique_key = 'id',
        check_cols = ['fname', 'lname'],
    )
}}

select * from {{source("sri_src",'scd')}}

{% endsnapshot %}