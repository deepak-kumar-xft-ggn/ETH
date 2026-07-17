{% macro conversion(column_name, factor) %}


sum( {{column_name }}/power(10, {{ factor}} ) )

{% endmacro %}


{% macro ethereum_conversion(column_name) %}

{{ conversion(column_name, 18) }}

{% endmacro %}