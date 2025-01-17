--ex02

SELECT person.name AS name,
	menu.pizza_name AS pizza_name,
	menu.price AS price,
	(menu.price * (100 - person_discounts.discount) * 0.01) AS discount_price,
	pizzeria.name AS pizzeria_name
FROM person_order 
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_discounts ON menu.pizzeria_id = person_discounts.pizzeria_id AND 
	person_discounts.person_id = person_order.person_id
ORDER BY name, pizza_name;


