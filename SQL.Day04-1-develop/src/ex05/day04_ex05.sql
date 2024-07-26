--ex05
CREATE VIEW v_price_with_discount AS
	SELECT person.name, menu.pizza_name, menu.price, 
			CAST(menu.price - (menu.price * 0.1) AS INT) AS dicount_price
	FROM menu 
	JOIN person_order ON menu.id = person_order.menu_id
	JOIN person ON person_order.person_id = person.id 
	ORDER BY name, pizza_name;

SELECT * FROM v_price_with_discount;

