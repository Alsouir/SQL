--ex00
/*Слияние двух табл. в один глобальный список, 
	 * с object_id в которм хранится номер id 
	 * и людей и пицы и их названия и имена в столбце object_name */
SELECT id AS object_id, pizza_name AS object_name 
FROM menu
UNION ALL
SELECT id AS object_id, name AS object_name 
FROM person
ORDER BY object_id, object_name;
