--ex03
SELECT COALESCE(PO.name, PV.name) AS name, 
	countPO+countPV AS total_count
FROM (SELECT pizzeria.name,
	COUNT(*) AS countPO
	FROM person_order
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	GROUP BY pizzeria.name
	) AS PO 
JOIN (SELECT pizzeria.name,
	COUNT(*) AS countPV
	FROM person_visits 
	JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	GROUP BY pizzeria.name
	) AS PV
ON PO.name = PV.name
ORDER BY total_count DESC
