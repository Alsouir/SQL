--ex06
WITH pizzas_info AS (
    SELECT * 
    FROM menu 
    LEFT JOIN 
    	(SELECT id, name FROM pizzeria) AS pizzeria 
    			ON menu.pizzeria_id = pizzeria.id
)
SELECT pizzas_info.pizza_name AS pizza_name, 
		pizzas_info.name AS pizzeria_name_1, 
		buff.name AS pizzeria_name_2, pizzas_info.price
FROM pizzas_info
INNER JOIN pizzas_info AS buff
	ON pizzas_info.pizza_name = buff.pizza_name 
			AND pizzas_info.price = buff.price 
			AND pizzas_info.name != buff.name 
			AND pizzas_info.pizzeria_id > buff.pizzeria_id
ORDER BY pizza_name;
