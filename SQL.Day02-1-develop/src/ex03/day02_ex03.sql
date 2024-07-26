--ex03	
/*Common Table Expression (CTE) - это временная таблица, 
 * которая определяется внутри запроса и может быть 
 * использована в последующих частях этого же запроса.*/
	
WITH new_table AS (
    SELECT DISTINCT person_visits.visit_date AS missing_date
	FROM (SELECT visit_date FROM person_visits
	    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-10'
	    AND person_id BETWEEN 1 AND 2) AS  visit12
	RIGHT JOIN person_visits
	ON visit12.visit_date = person_visits.visit_date
	WHERE visit12.visit_date is NULL
	ORDER BY person_visits.visit_date
)
SELECT *
FROM new_table;	
	
