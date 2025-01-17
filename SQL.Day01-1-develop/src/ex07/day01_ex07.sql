--ex07
/*Выводим дату заказа order_date и 
 * информацию о заказавшем из таблицы person*/
SELECT order_date,
		(SELECT name || ' (age:' || age || ')'
     	FROM person 
     	WHERE person.id = person_order.person_id) AS person_information
FROM person_order
ORDER BY order_date, person_information;
