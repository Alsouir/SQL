--ex02
/*Уникальные названия пиццы*/
SELECT DISTINCT pizza_name 
FROM menu
ORDER BY pizza_name DESC;

SELECT pizza_name 
FROM menu
UNION 
SELECT pizza_name 
FROM menu
ORDER BY pizza_name DESC;
