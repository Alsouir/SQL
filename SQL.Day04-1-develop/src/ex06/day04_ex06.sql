--ex06
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    SELECT 
			pizzeria.name AS cheap_pizzeria_name
	FROM person_visits
	INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	INNER JOIN person ON person_visits.person_id = person.id
	INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
	WHERE person.name = 'Dmitriy' 
			AND person_visits.visit_date = '2022-01-08'
			AND menu.price < 800;	

SELECT * FROM mv_dmitriy_visits_and_eats;
