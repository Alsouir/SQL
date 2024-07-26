--ex08
SELECT 
		person.name 
FROM person_order
INNER JOIN person ON person_order.person_id = person.id
INNER JOIN menu ON person_order.menu_id = menu.id
WHERE (person.address = 'Moscow' OR person.address = 'Samara')
		AND (menu.pizza_name = 'mushroom pizza' 
		OR menu.pizza_name = 'pepperoni pizza')
		AND person.gender = 'male'
ORDER BY person.name DESC;
