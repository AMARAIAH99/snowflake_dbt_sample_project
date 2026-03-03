SELECT 
    id,
    event_type,
    country,
    event_value,
    loaded_at
FROM (
    SELECT
        seq4() AS id,
        CASE WHEN uniform(1, 10, random()) <= 5 THEN 'event_a' ELSE 'event_b' END AS event_type,
        CASE WHEN uniform(1, 10, random()) <= 7 THEN 'IN' ELSE 'US' END AS country,
        uniform(10, 100, random()) AS event_value,
        DATEADD('minute', -uniform(1, 500, random()), CURRENT_TIMESTAMP()) AS loaded_at
    FROM TABLE(GENERATOR(ROWCOUNT => 500))
);
