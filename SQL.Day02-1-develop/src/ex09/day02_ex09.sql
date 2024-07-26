--ex09
WITH new_table AS (
    SELECT
			person.name AS name,
			COUNT(*)
	FROM person_order
	INNER JOIN person ON person_order.person_id = person.id
	INNER JOIN menu ON person_order.menu_id = menu.id
	WHERE (menu.pizza_name = 'cheese pizza' 
			OR  menu.pizza_name = 'pepperoni pizza')
			AND person.gender = 'female'
	GROUP BY person.name
	ORDER BY person.name
)
SELECT name
FROM new_table
WHERE count = 2;	
