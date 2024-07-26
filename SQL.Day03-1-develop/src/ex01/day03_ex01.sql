--ex01
WITH new_table AS (
    SELECT menu.id AS menu_id, person_order.menu_id AS menu_order
	FROM menu 
	FULL JOIN person_order ON menu.id = person_order.menu_id
)
SELECT menu_id
FROM new_table
WHERE menu_order is NULL
ORDER BY menu_id;
