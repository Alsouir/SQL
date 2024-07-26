--ex04
/*ИЗВЛЕЧЕНИЕ ИЗ ОДНОЙ ТАБЛИЦЫ ЗНАЧЕНИЙ, ОТСУТСТВУЮЩИХ В ДРУГОЙ 
 * (разность множеств)
 * EXCEPT - передается 1-ое результирующее множество, 
 * из которого он удаляет все строки, присутствующие 
 * 2-ом результирующем множестве.*/
SELECT person_id 
FROM person_order
WHERE order_date = '2022-01-07'
EXCEPT ALL
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-07';
