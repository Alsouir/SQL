--ex08
/*ex07 но с использоанием NATURAL JOIN.
 * Cоздаёт неявное объединение на основе одинаковых имён 
 * столбцов в объединяемых таблицах. Если вывести все столбцы (SELECT *),
 то выведит все общие столбцы в обеих таблицах тоже, с одинаковыми именами.
 Шаблон:
     SELECT *
     FROM T1
     NATURAL [INNER, LEFT, RIGHT] JOIN T2;
*/
SELECT order_date,
	persons.name || ' (age:' || persons.age || ')' AS person_information
FROM person_order
NATURAL JOIN 
	(SELECT id AS person_id, name, age FROM person) AS persons
ORDER BY order_date, person_information;
