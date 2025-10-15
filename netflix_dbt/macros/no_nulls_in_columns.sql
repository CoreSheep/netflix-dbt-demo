{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }}
    WHERE
    {% for column in adapter.get_columns_in_relation(model) %}
        {{ column.name }} IS NULL OR    
    {% endfor %}
    FALSE
{% endmacro %}