{% macro upper_case_name(name) %}
    upper({{ name }})
{% endmacro %}