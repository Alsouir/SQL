--ex04

SELECT pizza_name AS pizza_name,
		pizzeria.name AS pizzeria_name,
		price AS price
FROM menu AS m
FULL JOIN pizzeria ON m.pizzeria_id = pizzeria.id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;
