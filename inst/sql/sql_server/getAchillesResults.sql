/*This query will return the achilles_results*/

SELECT *
FROM @resultsDatabaseSchema.achilles_results
WHERE analysis_id IN (@analysis_ids)
AND count_value > @min_cell_count
