{% macro create_procs() %}
    {% set sql %}
        CREATE OR REPLACE PROCEDURE DEVELOP_SAMPLE_DBT_SNOWFLAKE_PROJECT.stage.proc_recalculate_sales()
        RETURNS STRING
        LANGUAGE JAVASCRIPT
        AS
        $$
            var sql_command = "UPDATE sales SET total = quantity * price";
            snowflake.execute({sqlText: sql_command});
            return "Sales updated successfully";
        $$;
    {% endset %}

    {{ run_query(sql) }}
{% endmacro %}