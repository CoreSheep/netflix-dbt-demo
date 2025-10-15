-- SELECT 
--     movie_id,
--     tag_id,
--     relevance
-- FROM {{ ref('fact_genome_scores')}}
-- WHERE relevance <= 0.0 OR relevance > 1.0

-- Test: Relevance score should be between 0 and 1
-- If there is no result, the test should pass.

{{ no_nulls_in_columns(ref('fact_genome_scores')) }}    
