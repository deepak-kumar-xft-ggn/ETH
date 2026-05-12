{% test accepted_values(model, column_name, values=None, arguments=None) %}

    {# Support both legacy `values:` and Fusion-style `arguments.values` #}
    {% set allowed_values = values %}
    {% if allowed_values is none and arguments is not none and arguments['values'] is defined %}
        {% set allowed_values = arguments['values'] %}
    {% endif %}

    with all_values as (

        select
            {{ column_name }} as value_field,
            count(*) as n_records

        from {{ model }}
        group by {{ column_name }}

    )

    select *
    from all_values
    where value_field not in (
        {%- for value in allowed_values -%}
            '{{ value }}'{% if not loop.last %}, {% endif %}
        {%- endfor -%}
    )

{% endtest %}
