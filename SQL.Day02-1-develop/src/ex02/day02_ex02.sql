--ex02
/*COALESCE - это функция, которая используется 
 * для замены значения NULL на заданное значение. */
SELECT COALESCE(person.name, '-') AS person_name,
		visit_date,
		COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM 
	(SELECT *
	FROM person_visits 
	WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS condision
FULL JOIN person ON condision.person_id = person.id
FULL JOIN pizzeria ON condision.pizzeria_id = pizzeria.id
ORDER BY  person_name, visit_date, pizzeria_name;
	
