{% macro cents_to_dollars(column_name, decinal_places=2) %}
    round(1.0 * {{column_name}}/100, {{decinal_places}})
{% endmacro %}