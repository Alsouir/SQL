--ex02
WITH new_table AS (
    SELECT menu.id,
    	person_order.menu_id AS menu_order,
    	menu.pizza_name, menu.price, 
    	pizzeria.name AS pizzeria_name
	FROM menu 
	FULL JOIN person_order ON menu.id = person_order.menu_id
	FULL JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT  pizza_name, price, pizzeria_name
FROM new_table
WHERE menu_order is NULL
ORDER BY pizza_name, price;

