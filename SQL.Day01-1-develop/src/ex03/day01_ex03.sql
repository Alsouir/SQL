--ex03
/*ПОИСК СТРОК С ОБЩИМИ ДАННЫМИ В ДВУХ ТАБЛИЦАХ
 * INTERSECT - возращает строки, содержащие общие 
 * данные для обоих источников строк.*/
SELECT order_date AS action_date,
		person_id
FROM person_order
INTERSECT 
SELECT visit_date AS action_date,
		person_id
FROM person_visits
ORDER BY action_date, person_id DESC;
