--ex06
/*ОИСК СТРОК С ОБЩИМИ ДАННЫМИ В ДВУХ ТАБЛИЦАХ С ДОБАВЛЕНИЕМ ТРЕТЬЕЙ
 * для того чтобы вместо id людей отобразить их имена.
 * INTERSECT - возращает строки, содержащие общие 
 * данные для обоих источников строк и */
SELECT order_date AS action_date,
		(SELECT name 
     	FROM person 
     	WHERE person.id = person_order.person_id) AS person_name
FROM person_order
INTERSECT 
SELECT visit_date AS action_date,
		(SELECT name 
     	FROM person 
     	WHERE person.id = person_visits.person_id) AS person_name
FROM person_visits
ORDER BY action_date, person_name DESC;
