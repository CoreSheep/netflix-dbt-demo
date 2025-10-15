{{ config(materialized = 'table') }}

WITH fact_ratings AS (
    SELECT * FROM {{ ref('fact_ratings')}}
),

seed_movie_release_dates AS (
    SELECT * FROM {{ ref('seed_movie_release_dates')}}
)

SELECT
    f.*,
    CASE 
        WHEN d.release_date IS NOT NULL THEN 'Known Release Date'
        ELSE 'Unknown Release Date'
    END AS release_date_status
FROM fact_ratings f
LEFT JOIN seed_movie_release_dates d
ON f.movie_id = d.movie_id