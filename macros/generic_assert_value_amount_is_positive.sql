{% test assert_value_amount_positive(model, column_name) %}

select
    {{ column_name }} as invalid_value
from {{ model }}

where {{ column_name }} < 0

{% endtest %}