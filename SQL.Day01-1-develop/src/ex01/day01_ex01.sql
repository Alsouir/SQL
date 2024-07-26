--ex01
/*Столбцы двух таблиц представить в одном, 
	 * и упорядочить сначала строки одной табл., 
	 * а потом другой*/
(SELECT name AS object_name 
FROM person
ORDER BY name)
UNION ALL
(SELECT pizza_name AS object_name 
FROM menu
ORDER BY pizza_name);
