{% test unique(model, column_name) %}

select
    {{ column_name }} as unique_field,
    count(*) as n_records
from {{ model }}
group by {{ column_name }}
having count(*) > 1

{% endtest %}
